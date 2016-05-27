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
  public class func solidColor(color color: UIColor, size: CGSize) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    
    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
  }
  
  public class func pixel(color color: UIColor) -> UIImage {
    return solidColor(color: color, size: CGSize(width: 1, height: 1))
  }

  public func tint(color: UIColor) -> UIImage
  {
    UIGraphicsBeginImageContextWithOptions (self.size, false, UIScreen.mainScreen().scale)
    let context = UIGraphicsGetCurrentContext()

    CGContextTranslateCTM(context, 0, self.size.height)
    CGContextScaleCTM(context, 1.0, -1.0)

    let rect = CGRectMake(0, 0, self.size.width, self.size.height)

    // draw tint color
    CGContextSetBlendMode(context, .Normal)
    color.setFill()
    CGContextFillRect(context, rect)

    // mask by alpha values of original image
    CGContextSetBlendMode(context, .DestinationIn)
    CGContextDrawImage(context, rect, self.CGImage)

    let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return coloredImage
  }

  public func rotateByDegrees(degrees: CGFloat) -> UIImage {
    let radians = degrees * CGFloat(M_PI) / 180
    let scale = UIScreen.mainScreen().scale

    // calculate the size of the rotated view's containing box for our drawing space
    let rotatedViewBox = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height))
    let t = CGAffineTransformMakeRotation(radians)
    rotatedViewBox.transform = t
    let rotatedSize = rotatedViewBox.frame.size

    // Create the bitmap context
    UIGraphicsBeginImageContextWithOptions(rotatedSize, false, scale)
    let bitmap = UIGraphicsGetCurrentContext()

    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2)

    // Rotate the image context
    CGContextRotateCTM(bitmap, radians)

    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0)
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), self.CGImage)

    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage
  }
}
