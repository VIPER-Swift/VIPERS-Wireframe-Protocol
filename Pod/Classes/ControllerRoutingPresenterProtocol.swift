//
//  ControllerPresenterProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 11.04.16.
//
//

import Foundation

/**
 * ControllerRoutingPresenter: a presenter responsible for presenting
 * a controller with a specific RoutingOption
 **/
public protocol ControllerRoutingPresenterProtocol{
 
    func isResponsible(option:RoutingOptionProtocol) -> Bool
    
    func present(routeString : String,
                  controller : UIViewController,
                      option : RoutingOptionProtocol,
                  parameters : [String : AnyObject],
                   wireframe : WireframeProtocol,
                   completion: ((routeString : String,
                                  controller : UIViewController,
                                     option  : RoutingOptionProtocol,
                                  parameters : [String : AnyObject],
                                   wireframe : WireframeProtocol)->Void))

}