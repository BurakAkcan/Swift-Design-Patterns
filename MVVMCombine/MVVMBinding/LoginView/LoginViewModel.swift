//
//  LoginViewModel.swift
//  MVVMBinding
//
//  Created by Burak AKCAN on 9.10.2022.
//

import Foundation

final class LoginViewModel {
    
   @Published var error: String?
    
    func login(email:String, password: String){
        NetworkService.shared.login(email: email, password: password) { [weak self] succes in
            guard let self = self else{ return }
            self.error = succes ? nil : "Invalid credentials "
            
        }
    }
}
