//
//  UITableView+Reusable.swift
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
//  This particular extension is taken from @PublicExtension by Jasdev Singh (@jasdev).
//  The original post: https://twitter.com/PublicExtension/status/656489984485146624
//  The refined version: http://jasdev.me/lets-get-meta/
//
//  Thank you!
//

import UIKit

public protocol Reusable: class {
  static var reuseIdentifier: String { get }
}

public extension UITableView {
  
  public func registerReusable<T: Reusable>(cellClass: T.Type) {
    registerClass(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
  }
  
  public func dequeueReusable<T: Reusable>(cellClass: T.Type) -> T {
    guard let cell = dequeueReusableCellWithIdentifier(cellClass.reuseIdentifier) as? T else {
      fatalError("Misconfigured cell type, \(cellClass)!")
    }
    return cell
  }
  
  public func dequeueReusable<T: Reusable>(cellClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
    guard let cell = dequeueReusableCellWithIdentifier(cellClass.reuseIdentifier, forIndexPath: indexPath) as? T else {
      fatalError("Misconfigured cell type, \(cellClass)!")
    }
    return cell
  }
}