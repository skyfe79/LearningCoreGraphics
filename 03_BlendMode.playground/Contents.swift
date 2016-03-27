//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

func drawTwoEllipse(name : String, _ blendMode : CGBlendMode = .Normal) -> UIImage {

    UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
    let context = UIGraphicsGetCurrentContext()

    CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 50, 50))

    CGContextDrawPath(context, .Fill)

    CGContextSetBlendMode(context, blendMode)


    CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
    CGContextAddEllipseInRect(context, CGRectMake(50, 10, 50, 50))

    CGContextDrawPath(context, .Fill)

    NSString(string: name).drawAtPoint(CGPoint(x: 0, y: 70), withAttributes: nil)
    
    let result = UIGraphicsGetImageFromCurrentImageContext()

    UIGraphicsEndImageContext()
    
    return result
}


let blendDic : [String:CGBlendMode] = [
    "Normal" : .Normal,
    "Multiply" : .Multiply,
    "Screen" : .Screen,
    "Overlay" : .Overlay,
    "Darken" : .Darken,
    "Lighten" : .Lighten,
    "ColorDodge" : .ColorDodge,
    "ColorBurn" : .ColorBurn,
    "SoftLight" : .SoftLight,
    "HardLight" : .HardLight,
    "Difference" : .Difference,
    "Exclusion" : .Exclusion,
    "Hue" : .Hue,
    "Saturation" : .Saturation,
    "Color" : .Color,
    "Luminosity" : .Luminosity,
    "Clear" : .Clear,
    "Copy" : .Copy,
    "SourceIn" : .SourceIn,
    "SourceOut" : .SourceOut,
    "SourceAtop" : .SourceAtop,
    "DestinationOver" : .DestinationOver,
    "DestinationIn" : .DestinationIn,
    "DestinationOut" : .DestinationOut,
    "DestinationAtop" : .DestinationAtop,
    "XOR" : .XOR,
    "PlusDarker" : .PlusDarker,
    "PlusLighter" : .PlusLighter
]

for (key, value) in blendDic {
    XCPlaygroundPage.currentPage.captureValue(drawTwoEllipse(key, value), withIdentifier: "result of \(key)")
}
