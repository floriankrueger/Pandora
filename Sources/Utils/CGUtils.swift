//
//  CGUtils.swift
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

import Foundation

public func radians(float: CGFloat) -> CGFloat {
  return CGFloat(M_PI) * (float/180)
}

public func radians(double: Double) -> Double {
  return M_PI * (double/180)
}

// @see http://sketchytech.blogspot.in/2014/11/swift-drawing-regular-polygons-with.html
//
public func polygonPointArray(sides: Int, x: CGFloat, y: CGFloat, radius: CGFloat, offset: CGFloat) -> [CGPoint] {
  let angle = radians((360/CGFloat(sides)))
  let cx = x // x origin
  let cy = y // y origin
  let r = radius // radius of circle
  var i = 0
  var points = [CGPoint]()
  while i <= sides {
    let xpo = cx + r * cos(angle * CGFloat(i) - radians(offset))
    let ypo = cy + r * sin(angle * CGFloat(i) - radians(offset))
    points.append(CGPoint(x: xpo, y: ypo))
    i++
  }
  return points
}
