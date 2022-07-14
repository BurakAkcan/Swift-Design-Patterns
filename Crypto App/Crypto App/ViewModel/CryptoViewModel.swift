//
//  CryptoViewModel.swift
//  Crypto App
//
//  Created by Burak AKCAN on 15.07.2022.
//

import Foundation
struct CryptoListViewModel{
    let cryptoCurrencyList : [CryptoModel]
    
    func numberOfRows()->Int{
        return self.cryptoCurrencyList.count
    }
    func cryptoAtIndex(_ index:Int)->cryptoViewModel{
        let crypto = self.cryptoCurrencyList[index]
        return cryptoViewModel(cryptoCurrency: crypto)
    }
}

struct cryptoViewModel{
    let cryptoCurrency:CryptoModel
    var name:String{
        return self.cryptoCurrency.currency
    }
    var price:String{
        return self.cryptoCurrency.price
    }
    
}
