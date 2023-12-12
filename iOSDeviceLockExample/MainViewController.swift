//
//  ViewController.swift
//  iOSDeviceLockExample
//
//  Created by 영준 이 on 2023/12/12.
//

import UIKit
import LocalAuthentication

class MainViewController: UIViewController {
    
    var lockButton: UIButton = {
        var value: UIButton = .init()
        
        value.setTitle("Lock", for: .normal)
        value.setTitleColor(.blue, for: .normal)
        
        value.translatesAutoresizingMaskIntoConstraints = false
        value.widthAnchor.constraint(equalToConstant: 100).isActive = true
        value.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        return value
    }()

    convenience init(window: UIWindow) {
        self.init(nibName: nil, bundle: nil)
        window.rootViewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .cyan
        self.setupLayout()
        self.setupHandlers()
    }
    
    func setupLayout() {
        view.addSubview(self.lockButton)
        
        self.lockButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.lockButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupHandlers() {
        self.lockButton.addAction(onLock, for: .touchUpInside)
    }
    
    func lock() {
        let context: LAContext = .init()
        
        context
            .evaluatePolicy(.deviceOwnerAuthentication,
                            localizedReason: "Please unlock") { [weak self]result, error in
                debugPrint("Unlocked? \(result). Error[\(error)]")
                
                guard result else{
//                    self?.lock()
                    return
                }
                
                //
        }
    }
    
    lazy var onLock: UIAction = .init { [weak self]_ in
        self?.lock()
    }
}
