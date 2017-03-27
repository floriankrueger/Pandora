//
//  FlatUI.Buttons.swift
//  Pandora
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

extension Themes.FlatUI {
  
  public class Button: UIButton {
    
    public enum Style {
      case primary
      case warning
      case `default`
      case danger
      case success
      case inverse
      case info
      
      public var normalForegroundColor: UIColor {
        return .white
      }
      
      public var highlightedForegroundColor: UIColor {
        return .white
      }
      
      public var disabledForegroundColor: UIColor {
        return Colors.Clouds
      }
      
      public var normalBackgroundColor: UIColor {
        switch self {
        case .primary:  return Colors.Turquoise
        case .warning:  return Colors.SunFlower
        case .default:  return Colors.Silver
        case .danger:   return Colors.Pomegranate
        case .success:  return Colors.Emerald
        case .inverse:  return Colors.MidnightBlue
        case .info:     return Colors.PeterRiver
        }
      }
      
      public var highlightedBackgroundColor: UIColor {
        switch self {
        case .primary:  return normalBackgroundColor.darker(by: 20.0)
        case .warning:  return normalBackgroundColor.darker(by: 20.0)
        case .default:  return normalBackgroundColor.darker(by: 20.0)
        case .danger:   return normalBackgroundColor.darker(by: 20.0)
        case .success:  return normalBackgroundColor.darker(by: 20.0)
        case .inverse:  return normalBackgroundColor.darker(by: 20.0)
        case .info:     return normalBackgroundColor.darker(by: 20.0)
        }
      }
      
      public var disabledBackgroundColor: UIColor {
        return Colors.Silver
      }
    }
    
    public enum Size {
      case normal
      case small
      
      public var cornerRadius: CGFloat {
        switch self {
        case .normal: return 6.0
        case .small:  return 4.0
        }
      }
      
      public var font: UIFont {
        switch self {
        case .normal: return UIFont.lato(17.0, style: .regular)
        case .small:  return UIFont.lato(12.0, style: .bold)
        }
      }
      
      public var defaultHeight: CGFloat {
        switch self {
        case .normal: return 45.0
        case .small:  return 27.0
        }
      }
    }
    
    // MARK: Data & Configuration
    
    public private(set) var style: Style!
    public private(set) var size: Size!
    
    // MARK: Init
    
    public convenience init(style: Style, size: Size = .normal) {
      self.init()
      
      self.style = style
      self.size = size
      
      let normalBackgroundImage =       UIImage.pixel(color: style.normalBackgroundColor)
      let highlightedBackgroundImage =  UIImage.pixel(color: style.highlightedBackgroundColor)
      let disabledBackgroundImage =     UIImage.pixel(color: style.disabledBackgroundColor)
      
      setTitleColor(style.normalForegroundColor, for: .normal)
      setTitleColor(style.highlightedForegroundColor, for: .highlighted)
      setTitleColor(style.disabledForegroundColor, for: .disabled)
      
      setBackgroundImage(normalBackgroundImage,       for: .normal)
      setBackgroundImage(highlightedBackgroundImage,  for: .highlighted)
      setBackgroundImage(disabledBackgroundImage,     for: .disabled)
      
      clipsToBounds = true
      layer.cornerRadius = size.cornerRadius
      titleLabel?.font = size.font
      
      contentEdgeInsets = UIEdgeInsets(top: 6.0, left: 21.0, bottom: 6.0, right: 21.0)
    }
    
  }
  
}
