//
//  AppDelegate.swift
//  VISPERS-Wireframe-Protocol
//
//  Created by Jan Bartel on 04/11/2016.
//  Copyright (c) 2016 Jan Bartel. All rights reserved.
//

import UIKit
import VIPERS_Wireframe_Protocol

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {         // Override point for customization after application launch.
        let _ = Wireframe()
        
        return true
    }

}

class Wireframe : WireframeProtocol{
    func addRouteString(routeString:String){}
    func addRouteString(routeString: String, handler:((parameters:[String:AnyObject])->Void)){}
    func routeURL(URL:NSURL){}
    func routeURL(URL:NSURL,parameters:[String:AnyObject]?){}
    func routeURL(URL:NSURL,parameters:[String:AnyObject]?,option:RoutingOptionProtocol){}
    func controllerFor(URL:NSURL,parameters:[String:AnyObject]?) -> UIViewController{return UIViewController()}
    func canRoute(URL:NSURL) -> Bool{return true}
    func canRoute(URL:NSURL,parameters:[String:AnyObject]?) -> Bool{return true}
    func addControllerProvider(provider: ControllerProviderProtocol){}
    func removeControllerProvider(provider: ControllerProviderProtocol)-> Bool{return true}
    func controllerProviders() -> [ControllerProviderProtocol]{return [ControllerProviderProtocol]()}
    func addRoutingOptionProvider(provider:RoutingOptionProviderProtocol){}
    func removeRoutingOptionProvider(provider:RoutingOptionProviderProtocol) -> Bool{return true}
    func routingOptionProviders() -> [RoutingOptionProviderProtocol]{return [RoutingOptionProviderProtocol]()}
    func addControllerRoutingPresenter(presenter: ControllerRoutingPresenterProtocol){}
    func removeControllerRoutingPresenter(presenter: ControllerRoutingPresenterProtocol) -> Bool{return true}
    func controllerRoutingPresenters()->[ControllerRoutingPresenterProtocol]{return [ControllerRoutingPresenterProtocol]()}
    func addRoutingObserver(observer:RoutingObserverProtocol){}
    func removeRoutingObserver(observer:RoutingObserverProtocol) -> Bool{return true}
    func routingObserver()->[RoutingObserverProtocol]{return [RoutingObserverProtocol]()}
}
