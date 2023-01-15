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
//                let window = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
//                return window
//                let windowScenes = UIApplication.shared.connectedScenes.first as? UIWindowScene
                
//                return windowScenes?.windows.first
                return UIApplication.shared.windows.first { $0.isKeyWindow }
                
            } else {
                return UIApplication.shared.keyWindow
            }
    }
    

}

