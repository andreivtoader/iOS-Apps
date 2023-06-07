//
//  CustomColor.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI

enum CustomColor: String, CaseIterable {
    case brightBlue = "BrightBlue"
    case cloudBurst = "CloudBurst"
    case greyCloud = "GreyCloud"
    case waikawaGrey = "WaikawaGrey"
    case tealishBlue = "TealishBlue"
    
    static var assetColors: [UIColor] {
        return self.allCases.compactMap { UIColor(named: $0.rawValue) }
    }
    
    static var assetColorsUI : [Color] {
        return self.allCases.compactMap { Color($0.rawValue) }
    }
    
    static func getColor(index: Int) -> UIColor {
        return assetColors[index]
    }
}

enum BikeColor: String, CaseIterable {
    case charcoalGrey = "CharcoalGrey"
    case burntYellow = "BurntYellow"
    case darkSkyBlue = "DarkSkyBlue"
    case mossGreen = "MossGreen"
    case watermelon = "Watermelon"
    case pear = "Pear"
    case blueLagoon = "BlueLagoon"
    case mushroom = "Mushroom"
    case electricLavender = "ElectricLavender"
    case hippieBlue = "HippieBlue"
    case mediumTaupe = "MediumTaupe"
    
    static var assetBikeColors : [UIColor] {
        return self.allCases.compactMap { UIColor(named: $0.rawValue) }
    }
    
    static var assetBikeColorsUI : [Color] {
        return self.allCases.compactMap { Color($0.rawValue) }
    }
    
    static func getColor(index: Int) -> UIColor {
        return assetBikeColors[index]
    }
}


extension UIColor {
    public class var brightBlue: UIColor { UIColor(named: CustomColor.brightBlue.rawValue) ?? UIColor.white }
    public class var waikawaGrey: UIColor { UIColor(named: CustomColor.waikawaGrey.rawValue) ?? UIColor.white }
    public class var tealishBlue: UIColor { UIColor(named: CustomColor.tealishBlue.rawValue) ?? UIColor.white }
    public class var cloudBurst: UIColor { UIColor(named: CustomColor.cloudBurst.rawValue) ?? UIColor.white }
    public class var greyCloud: UIColor { UIColor(named: CustomColor.greyCloud.rawValue) ?? UIColor.white }
}
