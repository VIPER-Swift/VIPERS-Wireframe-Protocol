//
//  WireframeProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 11.04.16.
//
//

import UIKit

/**
 * The wireframe is the powerful thing that wires the view controllers in 
 * your app together.
 * It takes an NSURL and some parameters, talks to the components that create your 
 * view controllers (the ControllerProvider) which create the view controller
 * connected to this URL, and gives it to those components which are responsible for
 * presenting your controller (the ControllerRoutingPresenter).
 **/
public protocol WireframeProtocol{
    
    
    /**
     * ROUTE-STRING:
     * A route string is a string representation of the NSURL connected 
     * to one view controller
     * It might be something like '/path/to/my/starting/controller'.
     **/
    
    
    /**
     * Adds a route string connected to a view controller
     * (it is the string representation of the controllers URL)
     * to your wireframe.
     * If you call with wireframe.routeURL(url:NSURL('/path/to/my/starting/controller'), ...)
     * the corresponding view controller will be presented.
     **/
    func addRouteString(routeString:String)
    
    
    /**
     * Adds a route string connected to a handler block
     * It might be something like '/path/to/invoke/for/my/handler/block'.
     * Your handler block will be invoked if you call your wireframe with
     * wireframe.routeURL(url:NSURL('/path/to/invoke/for/my/handler/block'), ...)
     * in that case
     **/
    func addRouteString(routeString: String, handler:((parameters:[String:AnyObject])->Void))
    
    
    /**
     * Routes a URL, which results is calling handler blocks or presenting a view controller
     * connected to the called URL
     **/
    func routeURL(URL:NSURL)
    func routeURL(URL:NSURL,parameters:[String:AnyObject]?)
    func routeURL(URL:NSURL,parameters:[String:AnyObject]?,option:RoutingOptionProtocol)
    

    /**
     * Returns the controller connected to a given URL
     */
    func controllerFor(URL:NSURL,[String:AnyObject]?) -> UIViewController


    /**
     * Returns whether a route exists for a URL
     **/
    func canRoute(URL:NSURL) -> Bool
    func canRoute(URL:NSURL,parameters:[String:AnyObject]?) -> Bool


    /**
     * ControllerProvider: a provider creating a view controller for a specific URL
     **/


    /**
     * Add a controller provider, responsible for creating a view controller
     * for a specific NSURL
     **/
    func addControllerProvider(provider: ControllerProviderProtocol)

    
    /**
     * Remove a controller provider, responsible for creating a view controller
     * for a specific NSURL
     **/
     func removeControllerProvider(provider: ControllerProviderProtocol)-> Bool


     /**
      * Returns all registered controller providers
      **/
     func controllerProviders() -> [ControllerProviderProtocol]


     /**
      * RoutingOptionProvider: a routing provider is responsible for creating
      * a RoutingOption for a specific URL. By creating a specific RoutingOption
      * for an URL a RoutingOptionProvider can decide in which way a controller 
      * should be presented
      **/


     /**
      * Add a RoutingOptionProvider, responsible for creating a RoutingOption for
      * a specific URL
      **/
     func addRoutingOptionProvider(provider:RoutingOptionProviderProtocol)


     /**
      * Remove a RoutingOptionProvider, responsible for creating a RoutingOption for
      * a specific URL
      **/
     func removeRoutingOptionProvider(provider:RoutingOptionProviderProtocol) -> Bool

    
    /**
     * ControllerRoutingPresenter: a presenter responsible for presenting 
     * a controller with a specific RoutingOption
     **/


    /**
     * add a ControllerRoutingPresenter, responsible for presenting controllers with
     * a specific RoutingOption
     **/
     func addControllerRoutingPresenter(presenter: ControllerRoutingPresenterProtocol)


    /**
     * remove a ControllerRoutingPresenter, responsible for presenting controllers with
     * a specific RoutingOption
     **/
     func removeControllerRoutingPresenter(presenter: ControllerRoutingPresenterProtocol) -> Bool


    /**
     * RoutingObserver: an observer object for observing the routing process
     **/


     /**
      * Add a RoutingObserver an observer object for observing the routing process
      **/
     func addRoutingObserver(observer:RoutingObserverProtocol)

    
     /**
      * Remove a RoutingObserver an observer object for observing the routing process
      **/
     func removeRoutingObserver(observer:RoutingObserverProtocol) -> Bool

}