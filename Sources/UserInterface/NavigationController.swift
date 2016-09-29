//
//  NavigationController
//
//  Created on 10/07/16.
//
//

import UIKit

open class NavigationController: UINavigationController {
  
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
