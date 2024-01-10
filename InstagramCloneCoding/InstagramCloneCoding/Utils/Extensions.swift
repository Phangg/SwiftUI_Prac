//
//  Extensions.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/1/24.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
