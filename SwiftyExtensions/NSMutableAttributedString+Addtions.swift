//
//  NSMutableAttributedString+Addtions.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {

  public convenience init(string: String, image: UIImage?, point: CGPoint = CGPointZero, index: Int = 0) {
    self.init(string: string)
    if let image = image {
      var textAttachment = NSTextAttachment()
      textAttachment.image = image
      textAttachment.bounds = CGRect(origin: point, size: image.size)
      let ns = NSAttributedString(attachment: textAttachment)
      self.insertAttributedString(ns, atIndex: index)
    }
  }

  public convenience init(string: String, lineHeight: CGFloat) {
    self.init(string: string)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.maximumLineHeight = lineHeight
    self.addAttribute(NSParagraphStyleAttributeName,
      value: paragraphStyle,
      range: NSMakeRange(0, self.length))
  }
}
