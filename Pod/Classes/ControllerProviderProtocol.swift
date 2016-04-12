//
//  ControllerProviderProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 11.04.16.
//
//

import Foundation

/**
 * ControllerProvider: a provider creating a view controller for a specific URL
 **/
public protocol ControllerProviderProtocol{


    func controller( forRouteString : String,
                              option: RoutingOptionProtocol,
                          parameters: [String:AnyObject]) -> UIViewController?
    
    
}