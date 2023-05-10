//
//  Extensions.swift
//  Instagram
//
//  Created by apple on 09/05/2023.
//

import Foundation
import UIKit
import JGProgressHUD

extension UITextField {
    
    func getTextOrDefault() -> String {
        return self.text ?? ""
    }
}

extension String? {
    
    func orDefault() -> String {
        return self ?? ""
    }
}
