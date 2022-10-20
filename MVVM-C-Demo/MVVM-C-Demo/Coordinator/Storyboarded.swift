//
//  Storyboarded.swift
//  MVVM-C-Demo
//
//  Created by Burak AKCAN on 19.10.2022.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instatiate() -> Self
}


extension Storyboarded where Self: UIViewController {
    static func instatiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
