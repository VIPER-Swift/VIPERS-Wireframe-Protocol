//
//  RoutingOptionProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 11.04.16.
//
//

import Foundation

/**
 * A routing option specifies how a controller is presented.
 * You can create new routing options to implement new ways of presenting 
 * a view controller. It is more or less a message object to a specific
 * ControllerRoutingPresenter, which aggregates the information nessecary 
 * to present the controller with a ControllerRoutingPresenter.
 **/
public protocol RoutingOptionProtocol{
    var animated:Bool{get}
}

/**
 * Push a view controller
 **/
public protocol RoutingOptionPushProtocol : RoutingOptionProtocol{}

/**
 * Show a controller as modal view
 **/
public protocol RoutingOptionModalProtocol : RoutingOptionProtocol{}