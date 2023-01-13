//
//  NetworkManager.swift
//  eais
//
//  Created by nakrlove on 2023/01/13.
//

import Foundation
import Reachability

class NetworkManager: NSObject {

    var reachability: Reachability!

    // NetworkManager 클래스의 싱글톤 인스턴스 sharedInstance 생성하기
    static let sharedInstance: NetworkManager = {
        return NetworkManager()
    }()

    override init() {
        super.init()

        // reachability 초기화
        reachability = try! Reachability()
        
        // 네트워크 상태에 대한 observer 등록하기
        // 네트워크 상태가 바뀌면 networkStatusChanged 콜백함수가 실행된다
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )

        do {
            // Start the network status notifier
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
        // 아래처럼 사용하면 이벤트 리스너가 아니고 한번만 실행된다.
        //*NetworkManager.sharedInstance.reachability.whenReachable* 이런 식으로 써줘야 한다!
        //NetworkManager.isReachable { networkManagerInstance in  print("Network is available")}
    }

    static func stopNotifier() -> Void {
        do {
            // Stop the network status notifier
            try (NetworkManager.sharedInstance.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }

    // Network is reachable
    static func isReachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection != .unavailable {
            completed(NetworkManager.sharedInstance)
        }
    }

    // Network is unreachable
    static func isUnreachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .unavailable {
            completed(NetworkManager.sharedInstance)
        }
    }

    // Network is reachable via WWAN/Cellular
    static func isReachableViaWWAN(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .cellular {
            completed(NetworkManager.sharedInstance)
        }
    }

    // Network is reachable via WiFi
    static func isReachableViaWiFi(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .wifi {
            completed(NetworkManager.sharedInstance)
        }
    }
}
