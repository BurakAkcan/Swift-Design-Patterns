//
//  ViewController.swift
//  MVVMBinding
//
//  Created by Burak AKCAN on 8.10.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
    }
    
    private func setupBinders(){
        loginViewModel.error.bind { [weak self] error in
            guard  error == nil else {
                print(error)
                return
            }
            self?.goToHomePage()
                
        }
        
    }
    
    private func goToHomePage(){
        let controller = storyboard?.instantiateViewController(withIdentifier: "homePage") as! HomeViewController
       
        present(controller, animated: true)
    }

    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {return}
        loginViewModel.login(email: email, password: password)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

