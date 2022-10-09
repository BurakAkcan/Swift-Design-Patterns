//
//  NetworkService.swift
//  MVVMBinding
//
//  Created by Burak AKCAN on 9.10.2022.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    private init(){}
   private var user: User?
    
    func login(email:String,password:String, completion: @escaping(Bool)->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if  email == "test" && password == "testpassword" {
                completion(true)
                self.user = User(name: "burak", lastname: "akcan", email: email, age: 23)
            }else {
                self.user = nil
                completion(false)
            }
        }
    }
    
    func getLoggedUser ()->User?{
        return user
    }
}
