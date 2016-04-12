//
//  RoutingOptionProviderProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 11.04.16.
//
//

import Foundation

/**
 * RoutingOptionProvider: a routing provider is responsible for creating
 * a RoutingOption for a specific URL. By creating a specific RoutingOption
 * for an URL a RoutingOptionProvider can decide in which way a controller
 * should be presented
 **/
public protocol RoutingOptionProviderProtocol{
   
    func options( forRoutingString : String,
                  parameters : [String : NSObject],
                      currentOption: RoutingOptionProtocol?) -> RoutingOptionProtocol?

    
}