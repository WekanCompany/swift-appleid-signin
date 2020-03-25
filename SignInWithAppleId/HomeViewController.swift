//
//  HomeViewController.swift
//  SignInWithAppleId
//
//  Created by Santhosh Kumar on 03/03/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - ViewController life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Home"
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - UIButton action
    
    @IBAction func btnLogoutAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
