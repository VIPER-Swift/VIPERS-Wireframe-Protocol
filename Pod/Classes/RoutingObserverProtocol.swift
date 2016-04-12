//
//  RoutingObserverProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 11.04.16.
//
//

import Foundation

/**
 * RoutingObserver: an observer object for observing the routing process.
 * It can intercept and redirect your routing request when returning an NSURL 
 * in it's shouldRouteTo - Method.
 **/
public protocol RoutingObserverProtocol{
    
    func observes(routeString: String,
                  option: RoutingOptionProtocol,
                  parameters: [String : AnyObject])->Bool
    
    
    func shouldRouteTo(routeString: String,
                          option: RoutingOptionProtocol,
                      parameters: [String : AnyObject]) -> NSURL?

    func didRouteTo( controller: UIViewController,
                 routeString: String,
                      option: RoutingOptionProtocol,
                  parameters: [String : AnyObject],
            routingPresenter: ControllerRoutingPresenterProtocol,
                   wireframe: WireframeProtocol) -> Void
}