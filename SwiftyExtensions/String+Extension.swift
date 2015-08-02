//
//  String+Extension.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

import Foundation

extension String {
  
  public func insert(#string: String, atIndex: Int) -> String {
    return prefix(self, atIndex) + string + suffix(self, count(self) - atIndex)
  }

  public func trim() -> String {
    return self.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
  }

  public func textHeight(width: CGFloat, font: UIFont) -> CGFloat {
    let size = CGSize(width: width, height: CGFloat.max)

    let rect = self.boundingRectWithSize(size,
      options: .UsesLineFragmentOrigin | .UsesFontLeading,
      attributes: [NSFontAttributeName: font], context: nil)
    return rect.size.height
  }
}