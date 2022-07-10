//
//  ViewController.swift
//  Dependency Injection
//
//  Created by Burak AKCAN on 10.07.2022.
//

import APIKit
import UIKit
import MyAppUIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 250, width: 250, height: 50))
        view.addSubview(button)
        button.setTitle("Tap Me", for: .normal)
        button.center = view.center
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
                              
                              
    }
    
    @objc private func didTapButton(){
        let vc = CoursesViewController(dataFetchable: ApiCaller.shared)
        present(vc, animated: true, completion: nil)
        
    }


}

extension ApiCaller:DataFetchable{
    
}
