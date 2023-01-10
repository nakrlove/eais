//
//  RclassCommon.swift
//  eais
//
//  Created by nakrlove on 2023/01/10.
//

import Foundation
import UIKit

public class R {
    static let bundle = Bundle(for: R.self)
}
extension R.Storyboard {
    public typealias Storyboard = R.Storyboard

//    public static var detail: Storyboard { Storyboard(name: "Detail", identifier: "DetailViewController") }
    public static var splash: Storyboard { Storyboard(name: "Splash", identifier: "SplashViewController") }
//    public static var authorization: Storyboard { Storyboard(name: "Covered", identifier: "PopupViewControllerForAuthorization") }
    public static var toast: Storyboard { Storyboard(name: "Covered", identifier: "ToastViewController") }
    
}

extension R {
    public class Storyboard {
        let identifier: String
        public let storyboard: UIStoryboard
        public init(name: String, identifier: String) {
            self.identifier = identifier
            self.storyboard = UIStoryboard(name: name, bundle: R.bundle)
        }
        public convenience init(name: String) {
            self.init(name: name, identifier: name)
        }
        public func instance<T: UIViewController>() -> T {
            storyboard.instantiateViewController(withIdentifier: identifier) as! T
        }
    }
}
