//
//  ViewController.swift
//  Crypto App
//
//  Created by Burak AKCAN on 14.07.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //MARK: - Variables and Properties
    private var cryptoListViewModel:CryptoListViewModel!

    @IBOutlet weak var tableView: UITableView!
   
    
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
      
       
    }
    //Get Data
    
    func getData(){
        let urlString = "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDATASET/master/crypto.json"
        let url = URL(string: urlString)!
        Services().downloadCurrency(url: url) { cryptoList in
            
            if let cryptoList = cryptoList {
               // print(cryptoList)
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptoList)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            
        }
    }


}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoListViewModel == nil ? 0 : cryptoListViewModel.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.nameLabel.text = cryptoViewModel.name
        cell.priceLabel.text = "\(cryptoViewModel.price) $"
        return cell
        
    }
    
}
