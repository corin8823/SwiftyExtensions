//
//  UIColor+Hex.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//  to see : https://github.com/yeahdongcn/UIColor-Hex-Swift/blob/master/UIColorExtension.swift
//

import UIKit

extension UIColor {
  
  public convenience init(rgba: String, alpha: CGFloat = 1.0) {
    var red:   CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue:  CGFloat = 0.0
    let alpha: CGFloat = alpha
    
    if rgba.hasPrefix("#") {
      let index   = rgba.startIndex.advancedBy(1)
      let hex     = rgba.substringFromIndex(index)
      let scanner = NSScanner(string: hex)
      var hexValue: CUnsignedLongLong = 0
      if scanner.scanHexLongLong(&hexValue) {
        switch (hex.characters.count) {
        case 3:
          red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
          green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
          blue  = CGFloat(hexValue & 0x00F)              / 15.0
        case 6:
          red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
          green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
          blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
        default:
          LOG("Invalid RGB string, number of characters after '#' should be either 3 or 6")
        }
      } else {
        LOG("Scan hex error")
      }
    } else {
      LOG("Invalid RGB string, missing '#' as prefix")
    }
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}