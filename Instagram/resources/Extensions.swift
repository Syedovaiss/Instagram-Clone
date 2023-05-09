//
//  Extensions.swift
//  Instagram
//
//  Created by apple on 09/05/2023.
//

import Foundation
import UIKit

extension UITextField {
    
    func getTextOrDefault() -> String {
        return self.text ?? ""
    }
}
