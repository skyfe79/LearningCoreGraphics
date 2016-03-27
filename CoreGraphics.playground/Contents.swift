//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

//: How to get CGContext?
//: We should get CGContext of Bitmap because we're on Playground!
UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
let context = UIGraphicsGetCurrentContext()
UIGraphicsEndImageContext()