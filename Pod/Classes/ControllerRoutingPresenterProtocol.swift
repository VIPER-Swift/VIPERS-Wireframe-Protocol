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

    func setRootViewController(controller: UIViewController)
    func rootViewController() -> UIViewController?
    
    func isResponsible(option:RoutingOptionProtocol) -> Bool
    
    func rootViewControllerInjectable(controller: UIViewController)->Bool
    
    func present(routeString : String,
                  controller : UIViewController,
                      option : RoutingOptionProtocol,
                  parameters : [String : AnyObject],
                   wireframe : WireframeProtocol,
                   completion: (()->Void))

}