//
//  SplashViewController.swift
//  eais
//
//  Created by nakrlove on 2023/01/10.
//

import UIKit

class SplashViewController: UIViewController {

    let network: NetworkManager = NetworkManager.sharedInstance
    
    override func viewWillAppear(_ animated: Bool) {
        ErrorAlertViewController.systemCheck(with: "앱 종료", serviceTime : nil) { (index, isCancelIndex) in
            DispatchQueue.main.async {
               print("Alert 확인했음!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(" =================================== ")
     
//        NetworkManager.isUnreachable { _ in
//          self.showOfflinePage()
//        }
    }

    private func showOfflinePage() -> Void {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "NetworkUnavailable", sender: self)
        }
    }

}
