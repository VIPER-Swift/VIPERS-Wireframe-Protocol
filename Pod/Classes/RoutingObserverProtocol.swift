//
//  RoutingObserverProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 11.04.16.
//
//

import Foundation

/**
 * RoutingObserver: an observer object for observing the routing process
 **/
public protocol RoutingObserverProtocol{

    func routeTo( controller: UIViewController,
                 routeString: String,
                      option: RoutingOptionProtocol,
                  parameters: [String : AnyObject],
            routingPresenter: ControllerRoutingPresenterProtocol,
                   wireframe: WireframeProtocol)
}