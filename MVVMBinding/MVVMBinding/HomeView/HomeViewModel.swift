//
//  HomeViewModel.swift
//  MVVMBinding
//
//  Created by Burak AKCAN on 9.10.2022.
//

import Foundation

final class HomeViewModel {
    var welcomeMessage: ObservableObject<String?> = ObservableObject(nil)
    
    func getLoggedUser(){
        let user:User? = NetworkService.shared.getLoggedUser()
        guard let user = user else {
            return
        }

        self.welcomeMessage.value = "Hola \(user.name) \(user.lastname) "
    }
}
