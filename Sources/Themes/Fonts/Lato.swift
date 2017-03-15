//
//  Fonts.swift
//  Pandora
//
//  Created by Florian Krüger on 14/03/2017.
//
//

import Foundation

public enum LatoStyle: String {
  case black =        "Lato-Black"
  case bold =         "Lato-Bold"
  case bolditalic =   "Lato-BoldItalic"
  case italic =       "Lato-Italic"
  case light =        "Lato-Light"
  case regular =      "Lato-Regular"
}

extension UIFont {
  
  public static func lato(_ size: CGFloat, style: LatoStyle) -> UIFont {
    return UIFont(name: style.rawValue, size: size)!
  }
  
}
