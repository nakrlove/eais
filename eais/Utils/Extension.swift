//
//  Extension.swift
//  eais
//
//  Created by nakrlove on 2023/01/13.
//

import Foundation
import UIKit

extension UIWindow {

    /// The app's key window taking into consideration apps that support multiple scenes.
//    static var key: UIWindow? {
//        if #available(iOS 13, *) {
//            return UIApplication.shared.windows.first { $0.isKeyWindow }
//
////            return (UIApplication.shared.windows.filter{ $0.rootViewController!.view.frame.equalTo(UIScreen.main.bounds) }).last!
//        } else {
//            return UIApplication.shared.keyWindow
//        }
//    }

    
    
    static var key: UIWindow? {
            if #available(iOS 13, *) {
                let window = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
//                return UIApplication.shared.windows.first { $0.isKeyWindow }
                return window
            } else {
                return UIApplication.shared.keyWindow
            }
    }
    
//    static let keyWd = UIApplication.shared.connectedScenes
//        .filter({$0.activationState == .foregroundActive})
//        .map({$0 as? UIWindowScene})
//        .compactMap({$0})
//        .first?.windows
//        .filter({$0.isKeyWindow}).first
//
//
//    public var visibleViewController: UIViewController? {
//        return self.visibleViewControllerFrom(vc: self.rootViewController)
//    }
//
//    public func visibleViewControllerFrom(vc: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
//
//        if let nc = vc as? UINavigationController {
//           return self.visibleViewControllerFrom(vc: nc.visibleViewController)
//        }
//
//        if let tc = vc as? UITabBarController {
//           return self.visibleViewControllerFrom(vc: tc.selectedViewController)
//        }
//
//        if let pvc = vc?.presentedViewController {
//           return self.visibleViewControllerFrom(vc: pvc)
//        }
//
//        return vc
//
//    }
}

