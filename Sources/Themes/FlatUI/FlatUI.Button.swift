//
//  FlatUI.Buttons.swift
//  Pandora
//
//  Created by Florian Krüger on 14/03/2017.
//
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
    }
    
    public convenience init(style: Style, size: Size = .normal) {
      self.init()
      
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
    }
    
  }
  
}
