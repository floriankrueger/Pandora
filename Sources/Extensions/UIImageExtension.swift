//
//  UIImageExtension.swift
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

public extension UIImage {
  public static func solidColor(color: UIColor, size: CGSize) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image!
  }
  
  public static func pixel(color: UIColor) -> UIImage {
    return solidColor(color: color, size: CGSize(width: 1, height: 1))
  }

  public func tint(color: UIColor) -> UIImage
  {
    UIGraphicsBeginImageContextWithOptions (self.size, false, UIScreen.main.scale)
    let context = UIGraphicsGetCurrentContext()

    context!.translateBy(x: 0, y: self.size.height)
    context!.scaleBy(x: 1.0, y: -1.0)

    let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)

    // draw tint color
    context!.setBlendMode(.normal)
    color.setFill()
    context!.fill(rect)

    // mask by alpha values of original image
    context!.setBlendMode(.destinationIn)
    context!.draw(self.cgImage!, in: rect)

    let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return coloredImage!
  }

  public func rotateByDegrees(degrees: CGFloat) -> UIImage {
    let radians = degrees * CGFloat(M_PI) / 180
    let scale = UIScreen.main.scale

    // calculate the size of the rotated view's containing box for our drawing space
    let rotatedViewBox = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height))
    let t = CGAffineTransform(rotationAngle: radians)
    rotatedViewBox.transform = t
    let rotatedSize = rotatedViewBox.frame.size

    // Create the bitmap context
    UIGraphicsBeginImageContextWithOptions(rotatedSize, false, scale)
    let bitmap = UIGraphicsGetCurrentContext()

    // Move the origin to the middle of the image so we will rotate and scale around the center.
    bitmap!.translateBy(x: rotatedSize.width/2, y: rotatedSize.height/2)

    // Rotate the image context
    bitmap!.rotate(by: radians)

    // Now, draw the rotated/scaled image into the context
    bitmap!.scaleBy(x: 1.0, y: -1.0)
    
    let rect = CGRect(x: -self.size.width / 2, y: -self.size.height / 2, width: self.size.width, height: self.size.height)
    bitmap!.draw(self.cgImage!, in: rect)

    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage!
  }
}
