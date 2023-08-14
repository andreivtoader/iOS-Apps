//
//  View+HideKeyboard.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
