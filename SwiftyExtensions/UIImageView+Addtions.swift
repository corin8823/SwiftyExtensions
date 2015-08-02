//
//  UIImageView+Addtions.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

import UIKit

extension UIImageView {

  public func template() {
    self.image = self.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
  }
}