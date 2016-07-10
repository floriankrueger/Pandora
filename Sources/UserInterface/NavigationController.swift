//
//  NavigationController
//
//  Created on 10/07/16.
//
//

import UIKit

public class NavigationController: UINavigationController {
  
  public var statusBarStyle = UIStatusBarStyle.Default
  public var interfaceOrientations: UIInterfaceOrientationMask = [.Portrait]
  
  // MARK: - UI Configuration
  
  override public func preferredStatusBarStyle() -> UIStatusBarStyle {
    return self.statusBarStyle
  }
  
  override public func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
    return self.interfaceOrientations
  }
  
}
