//
//  Color.swift
//  ColorPaletteApp
//
//  Created by Sunni Tang on 8/20/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

struct Color {
    var redValue: CGFloat
    var greenValue: CGFloat
    var blueValue: CGFloat
    var alphaValue: CGFloat
    
    static func getColor(with redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat, alphaValue: CGFloat) -> UIColor {
        let color = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
        return color
    }
}
