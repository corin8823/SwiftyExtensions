//
//  UIImage+Additions.swift
//  SwiftyExtensions
//
//  Created by yusuke takahashi on 8/2/15.
//  Copyright (c) 2015 yusuke takahashi. All rights reserved.
//

import UIKit
import Accelerate

extension UIImage {
  
  public class func fromColor(color: UIColor, size: CGSize = CGSizeMake(1, 1)) -> UIImage {
    let rect = CGRectMake(0, 0, size.width, size.height)
    
    UIGraphicsBeginImageContext(size)
    let context = UIGraphicsGetCurrentContext()
    
    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    return image
  }
  
  public class func fromView(view: UIView) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    view.layer.renderInContext(UIGraphicsGetCurrentContext())
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  public class func centerCrop(image: UIImage?, size: CGSize) -> UIImage? {
    if let image = image {
      var newSize: CGSize
      if(size.width > size.height) {
        let ratio = size.height / size.width
        newSize = CGSize(width: image.size.width, height: image.size.height * ratio)
      } else {
        let raito = size.width / size.height
        newSize = CGSize(width: image.size.width * raito, height: image.size.height)
      }
      let point = CGPoint(x: (image.size.width - newSize.width) / 2, y: (image.size.height - newSize.height) / 2)
      
      let rect = CGRect(origin: point, size: newSize)
      let cgImage = CGImageCreateWithImageInRect(image.CGImage, rect)
      let cropImage: UIImage? = UIImage(CGImage: cgImage)
      if let cropImage = cropImage{
        return cropImage
      }
    }
    return nil
  }
  
  public class func resize(image: UIImage, size: CGSize) -> UIImage {
    UIGraphicsBeginImageContext(size)
    image.drawInRect(CGRect(x: 0, y: 0, width: size.width, height: size.height))
    let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return resizedImage
  }
  
  public class func resizeAspectFit(image: UIImage, sizeValue: CGFloat) -> UIImage{
    let widthRatio  = sizeValue  / image.size.width
    let heightRatio = sizeValue / image.size.height
    let ratio = min(widthRatio, heightRatio)
    let resizedSize = CGSize(width: image.size.width*ratio, height: image.size.height*ratio)
    UIGraphicsBeginImageContext(resizedSize)
    image.drawInRect(CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
    let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return resizedImage
  }
  
  public class func createImageFromColor(size: CGSize, color: UIColor) -> UIImage {
    let rect = CGRect(x: 0,y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContext(size)
    let contextRef = UIGraphicsGetCurrentContext()
    CGContextSetFillColorWithColor(contextRef, color.CGColor)
    CGContextFillRect(contextRef, rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  public func blurred(radius: CGFloat = 10) -> UIImage! {
    if floorf(Float(size.width)) * floorf(Float(size.height)) <= 0.0 {
      return self
    }
    
    let imageRef = CGImage
    var boxSize = UInt32(radius * scale)
    if boxSize % 2 == 0 {
      boxSize++
    }
    
    let height = CGImageGetHeight(imageRef)
    let width = CGImageGetWidth(imageRef)
    let rowBytes = CGImageGetBytesPerRow(imageRef)
    let bytes = rowBytes * height
    
    let inData = malloc(bytes)
    var inBuffer = vImage_Buffer(data: inData, height: UInt(height), width: UInt(width), rowBytes: rowBytes)
    
    let outData = malloc(bytes)
    var outBuffer = vImage_Buffer(data: outData, height: UInt(height), width: UInt(width), rowBytes: rowBytes)
    
    let tempFlags = vImage_Flags(kvImageEdgeExtend + kvImageGetTempBufferSize)
    let tempSize = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, nil, 0, 0, boxSize, boxSize, nil, tempFlags)
    let tempBuffer = malloc(tempSize)
    
    let provider = CGImageGetDataProvider(imageRef)
    let copy = CGDataProviderCopyData(provider)
    let source = CFDataGetBytePtr(copy)
    memcpy(inBuffer.data, source, bytes)
    
    let flags = vImage_Flags(kvImageEdgeExtend)
    for index in 0 ..< 3 {
      vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, tempBuffer, 0, 0, boxSize, boxSize, nil, flags)
      
      let temp = inBuffer.data
      inBuffer.data = outBuffer.data
      outBuffer.data = temp
    }
    
    free(outBuffer.data)
    free(tempBuffer)
    
    let colorSpace = CGImageGetColorSpace(imageRef)
    let bitmapInfo = CGImageGetBitmapInfo(imageRef)
    let bitmapContext = CGBitmapContextCreate(inBuffer.data, width, height, 8, rowBytes, colorSpace, bitmapInfo)
    
    let bitmap = CGBitmapContextCreateImage(bitmapContext)
    let image = UIImage(CGImage: bitmap, scale: scale, orientation: imageOrientation)
    free(inBuffer.data)
    
    return image
  }
}