//
//  LoginViewModel.swift
//  MVVMBinding
//
//  Created by Burak AKCAN on 9.10.2022.
//

import Foundation

final class LoginViewModel {
    
    var error: ObservableObject<String?> = ObservableObject(nil)
    
    func login(email:String, password: String){
        NetworkService.shared.login(email: email, password: password) { [weak self] succes in
            guard let self = self else{ return }
            self.error.value = succes ? nil : "Invalid credentials "
            
        }
    }
}
