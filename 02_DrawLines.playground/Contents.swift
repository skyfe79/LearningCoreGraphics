//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
let context = UIGraphicsGetCurrentContext()

CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)

CGContextMoveToPoint(context, 10, 10)
CGContextAddLineToPoint(context, 90, 10)
CGContextAddLineToPoint(context, 90, 90)
CGContextAddLineToPoint(context, 10, 90)
CGContextAddLineToPoint(context, 10, 10)

CGContextDrawPath(context, .Stroke)

let result = UIGraphicsGetImageFromCurrentImageContext()

UIGraphicsEndImageContext()

XCPlaygroundPage.currentPage.captureValue(result, withIdentifier: "result")

