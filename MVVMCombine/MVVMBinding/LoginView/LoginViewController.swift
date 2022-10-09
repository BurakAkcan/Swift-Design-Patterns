//
//  ViewController.swift
//  MVVMBinding
//
//  Created by Burak AKCAN on 8.10.2022.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let loginViewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
    }
    
    private func setupBinders(){
        
        loginViewModel.$error.sink { [weak self] error in
            if let error = error {
                print(error)
            }else{
                self?.goToHomePage()
            }
        }.store(in: &cancellables)
        
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

