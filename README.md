# VISPERS-Wireframe-Protocol

[![License](https://img.shields.io/cocoapods/l/VISPERS-Wireframe-Protocol.svg?style=flat)](http://cocoapods.org/pods/VISPERS-Wireframe-Protocol)
[![Platform](https://img.shields.io/cocoapods/p/VISPERS-Wireframe-Protocol.svg?style=flat)](http://cocoapods.org/pods/VISPERS-Wireframe-Protocol)

The wireframe layer in an VIPER-Application is used to create and to present view controllers and controller transitions. A VIPERS application uses an object conforming to the WireframeProtocol to route between the controllers of your app.   

It is the powerful thing that wires the view controllers in your app together. It takes an NSURL and some parameters, talks to the components that create your view controllers (the ControllerProvider) which create the view controller connected to this URL, and gives it to those components which are responsible for presenting your controller (the ControllerRoutingPresenter).

The wireframe is responsible for navigating to the next view controller and communicates and connects all objects of the wireframe layer. It is used by the presenter layer to navigate to the next view controller. We recommend you to avoid using it in a view controller which is located in the view layer. It is better to call it from a delegate.

![VIPER Architecture]
(https://raw.githubusercontent.com/VIPER-Swift/VISPERS-Wireframe-Protocol/master/Example/VISPERS-Wireframe-Protocol/viper-architecture.png)

## More about VIPER
VIPER is an application architecture for mobile app development.
You can find some explanations here: [Blogpost from objc.io] (https://www.objc.io/issues/13-architecture/viper/)  (It's example is written in OBJ-C but I think you will accept this as a challenge :-P)

##Short explanation for the players in the wireframe layer

### ControllerProvider

A provider-class reponsible for creating a view controller for a specific URL

Example:
```swift
class ExampleControllerProvider : ControllerProviderProtocol {
    
    let responsibleForRoutesCreatedWithRouteString = "/path/to/my/controller"

    func controller( forRouteString : String,
                              option: RoutingOptionProtocol,
                          parameters: [String:AnyObject]) -> UIViewController?{

        if(forRouteString == self.responsibleForRoutesCreatedWithRouteString){
            return UIViewController()
        }else{
            return nil
        }

    }
    
}

// somewhere in your application (appdelegate or a factory could be a good idea)
// add provider to wireframe 
let myProvider = ExampleControllerProvider()
wireframe.addControllerProvider(provider:myProvider)

//route to controller and present it
wireframe.routeURL(       URL: NSURL(string:"/path/to/my/controller"),
                   parameters: nil,
                       option: RoutingOptionPush())

```

### Routing option

A routing option specifies how a controller is presented.
You can create new routing options to implement new ways of presenting a view controller. It is more or less a message object to a specific ControllerRoutingPresenter, which aggregates the information nessecary to present the controller with a ControllerRoutingPresenter.  

You can find a full example in the ControllerRoutingPresenter section.

### Routing option provider

A routing option provider is responsible for creating a RoutingOption 
for a specific URL. By creating a specific RoutingOption for an URL a RoutingOptionProvider can decide in which way a controller should be presented

Example:
```swift
class ExampleRoutingOptionsProvider : RoutingOptionProviderProtocol {

    let responsibleForRoutesCreatedWithRouteString = "/path/to/my/controller"

    func options( forRoutingString: String,
                        parameters: [String,NSObject],
                     currentOption: RoutingOptionProtocol?) -> RoutingOptionProtocol?{

        // if someone has already created a routing option, use that 
        // (don't override it if this is not nessecary!)
        if let currentRoutingOption = currentOption{
            return currentRoutingOption
        }else{
            //create a new object conforming to RoutingOptionProtocol otherwise
            return RoutingOptionPush()
        }

    }

}

// somewhere in your application (appdelegate or a factory could be a good idea)
// add provider to wireframe 
let myProvider = ExampleRoutingOptionsProvider()
wireframe.addRoutingProvider(provider:myProvider)

//
// I suppose that you added a controller provider for your 
// route somewhere
//

//route to controller and push it
wireframe.routeURL(        URL: NSURL(string:"/path/to/my/controller"),
                    parameters: nil,
                        option: nil)

```

###  Controller Routing Presenter
A presenter responsible for presenting a controller with a specific RoutingOption

Example:
```swift
//create a new routing option for pushing with a hidden navigation bar
struct HiddenNavbarRoutingOption : RoutingOptionPushProtocol{
    let animated : bool
}

//create a new controller routing presenter for your option
class HiddenNavBarRoutingPresenter : ControllerRoutingPresenterProtocol{

    let navigationController : UINavigationController

    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }

    func isResponsible(option:RoutingOptionProtocol) -> Bool{
        return option is HiddenNavbarRoutingOption
    }

    func present(routeString: String,
                  controller: UIViewController,
                      option: RoutingOptionProtocol,
                 parameters : [String : AnyObject],
                  wireframe : WireframeProtocol,
                  completion: ((routeString : String,
                                 controller : UIViewController,
                                    option  : RoutingOptionProtocol,
                                 parameters : [String : AnyObject],
                                  wireframe : WireframeProtocol)->Void)){

        self.navigationController.setNavigationBarHidden(true, animated: option.animated)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completion( routeString : routeString,
                         controller : controller,
                             option : option,
                         parameters : parameters,
                          wireframe : wireframe)
        }
        navigationController.pushViewController(controller, animated: true)
        CATransaction.commit()
    }

}

// somewhere in your application (appdelegate or a factory could be a good idea)
// add presenter to wireframe 
let myPresenter = HiddenNavBarRoutingPresenter(myNavigationController)
wireframe.addControllerRoutingPresenter(presenter)

//
// I suppose that you added a controller provider for your 
// route somewhere
//

//route to controller and present it
wireframe.routeURL(       URL: NSURL(string:"/path/to/my/controller"),
                   parameters: nil,
                       option: HiddenNavbarRoutingOption(animated : true))

```

### Routing Observer

An observer object for observing the routing process. It can intercept and redirect your routing request when returning an NSURL in it's shouldRouteTo - Method.

Example for redirecting when not logged in:
```swift

//
// lets assume you have a fancy class named LoginManager which tells you 
// if you are logged in for a specific url
//


//
// Create routing observer
//
class AuthRoutingObserver : RoutingObserverProtocol{

    let loginManager : LoginManager

    init(loginManager : LoginManager){
        self.loginManager = loginManager
    }

    func observes(routeString: String,
                       option: RoutingOptionProtocol,
                   parameters: [String : AnyObject])->Bool{
        return true
    }


    func shouldRouteTo(routeString: String,
                            option: RoutingOptionProtocol,
                        parameters: [String : AnyObject]) -> NSURL?{
        if(loginManager.allowsRoutingForRouteString(routeString)){
            return nil
        }else{
            return NSURL("/path/to/access/denied/controller")
        }
    }

    func didRouteTo( controller: UIViewController,
                    routeString: String,
                         option: RoutingOptionProtocol,
                     parameters: [String : AnyObject],
               routingPresenter: ControllerRoutingPresenterProtocol,
                      wireframe: WireframeProtocol) -> Void{
        //do something after the controller of this route is visible in your app
    }
}

// somewhere in your application (appdelegate or a factory could be a good idea)
// add presenter to wireframe 
let authObserver = AuthRoutingObserver(myLoginManager)
wireframe.addRoutingObserver(authObserver)


// routes to "/path/to/access/denied/controller"
// when not logged in
wireframe.routeURL(NSURL(string: "/a/route/which/needs/login"))

// works as expected
wireframe.routeURL(NSURL(string: "/a/route/which/does/not/need/login"))


```


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

VISPERS-Wireframe-Protocol is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "VISPERS-Wireframe-Protocol"
```

## Author

Jan Bartel, barteljan@yahoo.de

## License

VISPERS-Wireframe-Protocol is available under the MIT license. See the LICENSE file for more info.
