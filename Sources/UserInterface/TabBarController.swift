//
//  TabBarController.swift
//  Pandora
//
//  Created by Florian Krüger on 15/03/2017.
//
//

import UIKit

open class TabBarController: UITabBarController {
  
  open var statusBarStyle = UIStatusBarStyle.default
  open var interfaceOrientations: UIInterfaceOrientationMask = [.portrait]
  
  // MARK: - UI Configuration
  
  override open var preferredStatusBarStyle : UIStatusBarStyle {
    return self.statusBarStyle
  }
  
  override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    return self.interfaceOrientations
  }
  
}
