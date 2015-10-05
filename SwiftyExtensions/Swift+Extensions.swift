//
//  Swift+Extensions.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

public func delay(delay: Double, closure:() -> ()) {
  dispatch_after(
    dispatch_time( DISPATCH_TIME_NOW,
      Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

public func Localized(key: String) -> String {
  return NSLocalizedString(key, comment: "")
}

public func StringFromClass(object: AnyObject) -> String {
  return NSStringFromClass(object.dynamicType).componentsSeparatedByString(".").last! as String
}

public func StringFromType<T>(type: T) -> String {
  return String(type.self).componentsSeparatedByString(".").last!
}

public func LOG<T>(body: T, function: String = __FUNCTION__, line: Int = __LINE__) {
  #if DEBUG || DEV
    print("[\(function) : \(line)] \(body)", terminator: "\n")
  #endif
}

public func dispatch_async_main(closure: () -> ()) {
    dispatch_async(dispatch_get_main_queue(), closure)
}

public func dispatch_async_global(closure: () -> ()) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), closure)
}