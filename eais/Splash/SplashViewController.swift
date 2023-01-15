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
        
        super.viewWillAppear(animated)

        NetworkManager.isUnreachable { _ in
            print(" ================isUnreachable=================== ")
          self.showOfflinePage()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
     

    }

    private func showOfflinePage() -> Void {
//        DispatchQueue.main.async {
//            self.performSegue(withIdentifier: "NetworkUnavailable", sender: self)
            
            ErrorAlertViewController.networkCheck(with: "앱 종료", serviceTime : nil) { (index, isCancelIndex) in
                DispatchQueue.main.async {
                   print("Alert 확인했음!")
                }
            }
//        }
    }

}
