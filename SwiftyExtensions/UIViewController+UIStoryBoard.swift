//
//  UIViewController+UIStoryBoard.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

import UIKit

public protocol StoryboardLoadable {
  func loadStoryboard() -> Self
}

public extension StoryboardLoadable {

  public func loadStoryboard() -> Self {
    let className = StringFromType(Self)
    let storyboard = UIStoryboard(name: className, bundle: nil)
    return storyboard.instantiateViewControllerWithIdentifier(className) as! Self
  }
}