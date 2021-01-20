//
//  UIAlertExtension.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/19/21.
//

import Foundation
import UIKit



extension UIViewController {
    func alertUser(title:String,message:String){
        let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

