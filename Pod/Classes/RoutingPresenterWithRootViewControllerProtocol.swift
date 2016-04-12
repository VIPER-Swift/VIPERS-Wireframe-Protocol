//
//  ControllerRoutingPresenterWithRootViewController.swift
//  Pods
//
//  Created by Jan Bartel on 12.04.16.
//
//

import Foundation

public protocol RoutingPresenterWithRootViewControllerProtocol : ControllerRoutingPresenterProtocol{
    
    associatedtype RootViewControllerType : UIViewController

    func setRootViewController(controller: RootViewControllerType)
    func rootViewController() -> RootViewControllerType?

}

public extension RoutingPresenterWithRootViewControllerProtocol{
    func rootViewControllerInjectable(controller: UIViewController) -> Bool {
        return controller is RootViewControllerType
    }
    
    func setRootViewController(controller: UIViewController){
        self.setRootViewController(controller as! RootViewControllerType)
    }
    
    func rootViewController() -> UIViewController?{
        let rootVC : RootViewControllerType? = self.rootViewController()
        return rootVC
    }
}
