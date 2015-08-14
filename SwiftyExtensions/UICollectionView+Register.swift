//
//  UICollectionView+Register.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

import UIKit

extension UICollectionView {

  public func registerNibFromClass<T: UICollectionViewCell>(type: T.Type) {
    let className = StringFromClass(T)
    let nib = UINib(nibName: className, bundle: nil)
    registerNib(nib, forCellWithReuseIdentifier: className)
  }

  public func registerNibFromClass<T: UICollectionReusableView>(type: T.Type, forSupplementaryViewOfKind kind: String) {
    let className = StringFromClass(T)
    let nib = UINib(nibName: className, bundle: nil)
    registerNib(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
  }

  public func registerClassFromClass<T: UICollectionViewCell>(type: T.Type) {
    let className = StringFromClass(T)
    registerClass(T.self, forCellWithReuseIdentifier: className)
  }

  public func dequeueReusableCell<T: UICollectionViewCell>(type: T.Type,
    forIndexPath indexPath: NSIndexPath) -> T {
      return dequeueReusableCellWithReuseIdentifier(StringFromClass(T), forIndexPath: indexPath) as! T
  }

  public func dequeueReusableCell<T: UICollectionReusableView>(kind: String, withReuseType type: T.Type,
    forIndexPath indexPath: NSIndexPath) -> T {
      return dequeueReusableSupplementaryViewOfKind(kind,
        withReuseIdentifier: StringFromClass(T), forIndexPath: indexPath) as! T
  }
}