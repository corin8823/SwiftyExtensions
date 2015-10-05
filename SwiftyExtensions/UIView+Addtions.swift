//
//  UIView+Addtions.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

import UIKit

extension UIView {

  // size
  var width:   CGFloat { return self.frame.size.width }
  var height:  CGFloat { return self.frame.size.height }
  var size:    CGSize  { return self.frame.size}

  // origin
  var origin:  CGPoint { return self.frame.origin }
  var x:       CGFloat { return self.frame.origin.x }
  var y:       CGFloat { return self.frame.origin.y }
  var centerX: CGFloat { return self.center.x }
  var centerY: CGFloat { return self.center.y }

  var left:    CGFloat { return self.frame.origin.x }
  var right:   CGFloat { return self.frame.origin.x + self.frame.size.width }
  var top:     CGFloat { return self.frame.origin.y }
  var bottom:  CGFloat { return self.frame.origin.y + self.frame.size.height }

  public func setWidth(width: CGFloat) {
    self.frame.size.width = width
  }

  public func setHeight(height: CGFloat) {
    self.frame.size.height = height
  }

  public func setSize(size: CGSize) {
    self.frame.size = size
  }

  public func setOrigin(point: CGPoint) {
    self.frame.origin = point
  }

  public func setX(x: CGFloat) {
    self.frame.origin.x = x
  }

  public func setY(y: CGFloat) {
    self.frame.origin.y = y
  }

  public class func loadNib() -> UIView {
    let name = StringFromClass(self)
    return NSBundle.mainBundle().loadNibNamed(name, owner: nil, options: nil)[0] as! UIView
  }

  public func roundedCorrner(radius: CGFloat) {
    self.layer.cornerRadius = radius
    self.clipsToBounds = true
  }

  public func roundedRectangleFilter() {
    self.roundedCorrner(self.height / 2)
  }

  public func circleFilter() {
    self.roundedCorrner(self.width / 2)
  }

  public func border(width: CGFloat, color: UIColor) {
    self.layer.borderWidth = width
    self.layer.borderColor = color.CGColor
  }

  public func removeSublayers() {
    if let sublayers = self.layer.sublayers {
      for layer in sublayers {
        layer.removeFromSuperlayer()
      }
    }
  }

  public func hasViewClass(targetClass: AnyClass) -> Bool {
    for childView in self.subviews {
      if childView.isMemberOfClass(targetClass) {
        return true
      }
    }
    return false
  }
}
