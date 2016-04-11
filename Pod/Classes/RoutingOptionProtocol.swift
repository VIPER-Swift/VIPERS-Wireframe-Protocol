//
//  RoutingOptionProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 11.04.16.
//
//

import Foundation

public protocol RoutingOptionProtocol{
    var animated:Bool{get}
}

public protocol RoutingOptionPushProtocol : RoutingOptionProtocol{}

public protocol RoutingOptionModalProtocol : RoutingOptionProtocol{}