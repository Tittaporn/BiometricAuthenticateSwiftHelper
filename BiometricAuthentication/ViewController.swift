//
//  ViewController.swift
//  BiometricAuthentication
//
//  Created by Lee on 11/10/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var btnAuthentication: UIButton!
    
    // MARK: - Properties
    let biometricAuthenticate = BiometricIDAuth()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAuthentication.isHidden = !biometricAuthenticate.canEvaluatePolicy()
        switch biometricAuthenticate.biometricType() {
        case .faceID:
            btnAuthentication.setImage(UIImage(named: "FaceIcon"),  for: .normal)
        default:
            btnAuthentication.setImage(UIImage(named: "Touch-icon-lg"),  for: .normal)
        }
    }
    
    // MARK: - Action
    @IBAction func authenticationButtonTapped(_ sender: Any) {
        biometricAuthenticate.authenticateUser { (errorMessage) in
            if let error = errorMessage {
                print(error)
            } else {
                print("Successfully, authenticate with biometric!")
            }
        }
    }
}

