//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let image = UIImage(named: "monet1")!


func load() {
    UIGraphicsBeginImageContextWithOptions(image.size, true, image.scale)
    let context = UIGraphicsGetCurrentContext()
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    XCPlaygroundPage.currentPage.captureValue(result, withIdentifier: "load")
}
//load()

func flip() {
    UIGraphicsBeginImageContextWithOptions(image.size, true, image.scale)
    let context = UIGraphicsGetCurrentContext()
    
    CGContextScaleCTM(context, 1.0, -1.0)     // (2)
    CGContextTranslateCTM(context, 0.0, -image.size.height) // (1)
    
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    XCPlaygroundPage.currentPage.captureValue(result, withIdentifier: "flip")
}
flip()

func resize(targetWidth: CGFloat, _ targetHeight: CGFloat) {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(targetWidth, targetHeight), true, image.scale)
    let context = UIGraphicsGetCurrentContext()
    
    CGContextScaleCTM(context, 1.0, -1.0)     // (2)
    CGContextTranslateCTM(context, 0.0, -targetHeight) // (1)
    
    CGContextDrawImage(context, CGRectMake(0, 0, targetWidth, targetHeight), image.CGImage)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    XCPlaygroundPage.currentPage.captureValue(result, withIdentifier: "resize")
}
resize(300, 300)


func radian(degree: CGFloat) -> CGFloat {
    return degree * CGFloat(M_PI) / 180.0
}

func rotate(angle: CGFloat) {
    
    UIGraphicsBeginImageContextWithOptions(image.size, true, image.scale)
    let context = UIGraphicsGetCurrentContext()
    
    CGContextScaleCTM(context, 1.0, -1.0)                                       // (5)
    CGContextTranslateCTM(context, 0.0, -image.size.height)                     // (4)
    CGContextTranslateCTM(context, image.size.width/2, image.size.height/2)     // (3)
    CGContextRotateCTM(context, angle)                                          // (2)
    CGContextTranslateCTM(context, -image.size.width/2, -image.size.height/2)   // (1)
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    XCPlaygroundPage.currentPage.captureValue(result, withIdentifier: "rotate\(angle)")
}
rotate(radian(90))

func horizontalFlip() {
    
    UIGraphicsBeginImageContextWithOptions(image.size, true, image.scale)
    let context = UIGraphicsGetCurrentContext()
    
    CGContextScaleCTM(context, -1.0, -1.0)                                   // (2)
    CGContextTranslateCTM(context, -image.size.width, -image.size.height)    // (1)
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    XCPlaygroundPage.currentPage.captureValue(result, withIdentifier: "horizontalFlip")
}
horizontalFlip()


func verticalFlip() {
    
    UIGraphicsBeginImageContextWithOptions(image.size, true, image.scale)
    let context = UIGraphicsGetCurrentContext()
    
    
    CGContextTranslateCTM(context, 0, image.size.height)        // (4)
    CGContextScaleCTM(context, 1.0, -1.0)                       // (3)
    CGContextScaleCTM(context, 1.0, -1.0)                       // (2)
    CGContextTranslateCTM(context, 0, -image.size.height)       // (1)
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    XCPlaygroundPage.currentPage.captureValue(result, withIdentifier: "verticalFlip")
}
verticalFlip()


func crop(rect: CGRect) {
    UIGraphicsBeginImageContextWithOptions(rect.size, true, image.scale)
    let context = UIGraphicsGetCurrentContext()
    
    CGContextScaleCTM(context, 1.0, -1.0)                       // (2)
    CGContextTranslateCTM(context, 0, -rect.size.height)        // (1)
    let croppedImage = CGImageCreateWithImageInRect(image.CGImage, rect)
    
    let drawRect = CGRectMake(0, 0, rect.size.width, rect.size.height)
    CGContextDrawImage(context, drawRect, croppedImage)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    XCPlaygroundPage.currentPage.captureValue(result, withIdentifier: "crop")
}
crop(CGRectMake(0, 0, 190, 40))

