//
//  ErrorAlertViewController.swift
//  eais
//
//  Created by nakrlove on 2023/01/13.
//

import UIKit


/// index: -1 = 배경터치로 취소. 나머지는 좌상단부터 우하단 순서의 버튼 인덱스.
/// isCancelIndex: '취소'를 명시적으로 눌렀을 경우를 명확히 하기 위해 추가
public typealias ErrorPopupCompletion = (_ index: Int, _ isCancelIndex: Bool) -> Void

enum ErrorAlertType  {
    case network
    case system
    case systemError
    case timeout
    case nopage
    case busy
    case etc
}


class ErrorAlertViewController: UIViewController {

    var errorType:ErrorAlertType = .etc
    var completion: ErrorPopupCompletion?
    
    var buttonString : String? = ""
    private var serviceCheckTime : String?
    
    
    
//    let keyWindow = UIApplication.shared.connectedScenes
//        .filter({$0.activationState == .foregroundActive})
//        .map({$0 as? UIWindowScene})
//        .compactMap({$0})
//        .first?.windows
//        .filter({$0.isKeyWindow}).first
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        ErrorAlertViewController.systemCheck(with: "앱 종료", serviceTime : nil) { (index, isCancelIndex) in
//            DispatchQueue.main.async {
//                exit(0)
//            }
//        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
   
    open class func systemCheck(with titleButton: String, serviceTime : String?, completion: @escaping ErrorPopupCompletion) {
        print(" =================systemCheck================== ")
        if let errorAlertViewController =  UIStoryboard(name: "Common", bundle: nil).instantiateViewController(withIdentifier: "ErrorAlertViewController") as? ErrorAlertViewController {
            
            print(" =================systemCheck 1================== ")
            if let topViewController = UIWindow.key?.rootViewController {
                print(" =================systemCheck 2================== ")
                topViewController.present(errorAlertViewController, animated: false)
            }
            

        }
    }
}



