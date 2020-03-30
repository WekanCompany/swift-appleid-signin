//
//  LoginViewController.swift
//  SignInWithAppleId
//
//  Created by Santhosh Kumar on 03/03/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var loginStackView: UIStackView!
    
    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sign in with Apple ID"
        setupView()
    }
    
    // MARK: - Setup View
    
    private func setupView() {
        let button = ASAuthorizationAppleIDButton()
        button.addTarget(self, action: #selector(handleAppleIDAuthorization), for: .touchUpInside)
        loginStackView.addArrangedSubview(button)
    }
    
    // MARK: - Handle Apple ID Authorization
    
    @objc func handleAppleIDAuthorization() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
}

// MARK: - AuthorizationController Delegates

extension LoginViewController: ASAuthorizationControllerDelegate {
    
    ///Authorization Controller Did Complete with Authorization
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credential as ASAuthorizationAppleIDCredential:
            let userId = credential.user
            print("User Identifier: ", userId)
            
            if let fullname = credential.fullName {
                print("FullName: ", fullname)
            }
            
            if let email = credential.email {
                print("Email: ", email)
            }
            
            if let identityToken = credential.identityToken {
                print("IdentityToken: ", identityToken)
            }
            
            if let code = credential.authorizationCode {
                print("AuthorizationCode: ", code)
            }
            
            let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)

            break
        default:
            break
        }
    }
    
    ///Authorization Controller Did Complete with  Error
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple ID Authorization failed. ", error.localizedDescription)
    }
}

// MARK: - AuthorizationController Persenttaion

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }    
}
