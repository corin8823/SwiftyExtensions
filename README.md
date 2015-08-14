# SwiftyExtensions
A set of Swift extensions

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/corin8823/SwiftyExtensions.svg)](https://travis-ci.org/corin8823/SwiftyExtensions/)

## Requirements
- iOS 7.0+
- Xcode 6.4

## Integration

### Carthage (iOS 8+)
You can use [Carthage](https://github.com/Carthage/Carthage) to install `SwiftyExtensions` by adding it to your `Cartfile`
```
github "corin8823/SwiftyExtensions"
```

## Contents
- NSMutableAttributedString
- String
- UICollectionView
- UIColor
- UIImage
- UIImageView
- UITableView
- UIView
- UIViewController

## Extensions

## NSMutableAttributedString
- ``init(string: String, image: UIImage?, point: CGPoint = CGPointZero, index: Int = 0)``
- ``init(string: String, lineHeight: CGFloat) ``

## String
- ``insert(#string: String, atIndex: Int) -> String ``
- ``trim() -> String``
- ``textHeight(width: CGFloat, font: UIFont) -> CGFloat``

## Swift
- ``delay(delay: Double, closure:() -> ())``
- ``Localized(key: String) -> String``
- ``StringFromClass(object: AnyObject) -> String``
- ``LOG(_ body: AnyObject! = "", function: String = __FUNCTION__, line: Int = __LINE__)``
- ``dispatch_async_main(closure: () -> ())``
- ``dispatch_async_global(closure: () -> ())``

## UICollectionView
- ``registerNibFromClass<T: UICollectionViewCell>(type: T.Type)``
- ``registerNibFromClass<T: UICollectionReusableView>(type: T.Type, forSupplementaryViewOfKind kind: String)``
- ``registerClassFromClass<T: UICollectionViewCell>(type: T.Type)``
- ``dequeueReusableCell<T: UICollectionViewCell>(type: T.Type,
  forIndexPath indexPath: NSIndexPath) -> T ``
- ``dequeueReusableCell<T: UICollectionReusableView>(kind: String, withReuseType type: T.Type,
  forIndexPath indexPath: NSIndexPath) -> T``

## UIColor
- ``init(rgba: String, alpha: CGFloat = 1.0) ``

## UIImageView
- ``template()``

## UITableView
- ``registerNibFromClass<T: UITableViewCell>(type: T.Type)``
- ``registerClassFromClass<T: UITableViewCell>(type: T.Type)``
- ``dequeueReusableCell<T: UITableViewCell>(type: T.Type,
  forIndexPath indexPath: NSIndexPath) -> T``

## UIView
- ``loadNib() -> UIView``
- ``roundedCorrner(radius: CGFloat)``
- ``roundedRectangleFilter()``
- ``circleFilter()``
- ``border(width: CGFloat, color: UIColor)``
- ``removeSublayers()``
- ``hasViewClass(targetClass: AnyClass) -> Bool``

## UIViewController
- ``initialLoadStoryboard() -> UIViewController``
- ``loadStoryboard() -> UIViewController``

## License
SwiftyExtensions is released under the MIT license. See LICENSE for details.
