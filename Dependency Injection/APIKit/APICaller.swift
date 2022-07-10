//
//  APICaller.swift
//  APIKit
//
//  Created by Burak AKCAN on 10.07.2022.
//

import Foundation

public class ApiCaller{
   public static let shared = ApiCaller()
    private init(){}
    
    public func fetchCourseName(completion:@escaping ([String])->Void){
        guard let url = URL(string:"https://iosacademy.io/api/v1/courses/index.php") else{
            completion([])
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
            //Decode
            do{
                
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [[String:String]]
                print(json)
                
                let names = json?.compactMap({$0["name"]})
                print("gelen liste \(names)")
                completion(names!)
            }catch{
                completion([])
            }

        }
        task.resume()
    }
    
}
