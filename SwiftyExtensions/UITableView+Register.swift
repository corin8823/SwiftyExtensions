//
//  UITableView+Register.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

import UIKit

extension UITableView {

  public func registerNibFromClass<T: UITableViewCell>(type: T.Type) {
    let className = StringFromClass(T)
    let nib = UINib(nibName: className, bundle: nil)
    registerNib(nib, forCellReuseIdentifier: className)
  }

  public func registerClassFromClass<T: UITableViewCell>(type: T.Type) {
    let className = StringFromClass(T)
    registerClass(T.self, forCellReuseIdentifier: className)
  }

  public func dequeueReusableCell<T: UITableViewCell>(type: T.Type,
    forIndexPath indexPath: NSIndexPath) -> T {
      return dequeueReusableCellWithIdentifier(StringFromClass(T), forIndexPath: indexPath) as! T
  }
}