//
//  HomeViewModel.swift
//  MVVMBinding
//
//  Created by Burak AKCAN on 9.10.2022.
//

import Foundation

final class HomeViewModel {
   @Published var welcomeMessage: String?
    
    func getLoggedUser(){
        let user:User? = NetworkService.shared.getLoggedUser()
        guard let user = user else {
            return
        }

        self.welcomeMessage = "Hola \(user.name) \(user.lastname) "
    }
}
