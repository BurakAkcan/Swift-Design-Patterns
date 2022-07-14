//
//  service.swift
//  Crypto App
//
//  Created by Burak AKCAN on 14.07.2022.
//

import Foundation
class Services{
    func downloadCurrency(url:URL,completion:@escaping ([CryptoModel]?)->Void){
        URLSession.shared.dataTask(with: url) { data, respnse, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                //elle oluşturduğumuz completiona nil verebilirim çünkü yukarıda nil olabilir dedik
            }else if let data = data {
                let decoder = JSONDecoder()
              let results = try? decoder.decode([CryptoModel].self, from: data)
                
                if let results = results {
                    completion(results)
                }
            }
        }.resume()  
        
    }
}


//Escaping
//Closuredan escape i kullandığımız zaman fonk tamamlandıktan sonra çağırılan
//argüman yolayabildiğimiz bir fonk
//Genellikle internetten veri çektiğimiz durumlarda kullanılır
//Herhangi bir şey döndürmemize gerek yoktur fakat gelen data ne onu belirtebiliriz [CurrencyModel] gibi gelen veri liste çünkü
