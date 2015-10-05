//
//  UIViewController+UIStoryBoard.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

import UIKit

extension UIViewController {

  public class func initialLoadStoryboard() -> UIViewController {
    let storyboard = UIStoryboard(name: StringFromClass(self), bundle: nil)
    return storyboard.instantiateInitialViewController()!
  }

  public class func loadStoryboard() -> UIViewController {
    let className = StringFromClass(self)
    let storyboard = UIStoryboard(name: className, bundle: nil)
    return storyboard.instantiateViewControllerWithIdentifier(className)
  }
}