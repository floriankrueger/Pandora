//
//  GradientView.swift
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

public class GradientView: UIView {
  
  public enum Direction {
    case vertical
    case horizontal
  }
  
  override public class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
  
  private var gradient: CAGradientLayer {
    return layer as! CAGradientLayer
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
  }
  
  dynamic public var colors: [UIColor]? {
    didSet {
      gradient.colors = colors?.map { $0.cgColor }
    }
  }
  
  public var direction: Direction = .vertical {
    didSet {
      switch direction {
      case .vertical:   gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
      case .horizontal: gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    gradient.startPoint = CGPoint.zero
    gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
