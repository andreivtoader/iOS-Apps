//
//  SettingsManager.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 04.06.2023.
//

import Foundation
import FormValidator

class SettingsManager: ObservableObject {
    @Published var settings = FormManager(validationType: .immediate)
}
