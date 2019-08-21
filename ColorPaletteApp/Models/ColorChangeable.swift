//
//  colorChangeable.swift
//  ColorPaletteApp
//
//  Created by Sunni Tang on 8/20/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

protocol ColorChangeable {
    //    func changeColor(to newRedValue: CGFloat, newGreenValue: CGFloat, newBlueValue: CGFloat, newAlphaValue: CGFloat)
    func changeColor(to newColor: UIColor)
}
