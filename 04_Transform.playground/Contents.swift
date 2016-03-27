//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


let image = UIImage(named: "monet1")!


UIGraphicsBeginImageContext(CGSize(width: 200, height: 200))
let c1 = UIGraphicsGetCurrentContext()

CGContextDrawImage(c1, CGRectMake(0, 0, 200, 200), image.CGImage)

let r1 = UIGraphicsGetImageFromCurrentImageContext()

UIGraphicsEndImageContext()

XCPlaygroundPage.currentPage.captureValue(r1, withIdentifier: "r1")



//: Using UIImage.drawAtPoint

UIGraphicsBeginImageContext(CGSize(width: 200, height: 200))
let c2 = UIGraphicsGetCurrentContext()

image.drawAtPoint(CGPointMake(0, 0))

let r2 = UIGraphicsGetImageFromCurrentImageContext()

UIGraphicsEndImageContext()

XCPlaygroundPage.currentPage.captureValue(r2, withIdentifier: "r2")

//: Transform!
func radian(degree:CGFloat) -> CGFloat {
    return degree * CGFloat(M_PI) / 180.0
}

func transform( functor : (CGContextRef) -> () ) -> UIImage {
    
    UIGraphicsBeginImageContext(CGSize(width: 200, height: 200))
    let context = UIGraphicsGetCurrentContext()
    
    functor(context!)
    
    CGContextDrawImage(context, CGRectMake(0, 0, 200, 200), image.CGImage)
    
    let result = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return result
}

//: Flip
XCPlaygroundPage.currentPage.captureValue( transform { context in
    // 적용순서에 주의해야 한다.
    // 행렬연산은 아래에서 위로 변환이 적용된다.
    CGContextScaleCTM(context, 1.0, -1.0)     // (2)
    CGContextTranslateCTM(context, 0.0, -200) // (1)
    
}, withIdentifier: "flip")

//: Rotate
XCPlaygroundPage.currentPage.captureValue( transform { context in
    // 적용순서에 주의해야 한다.
    // 행렬연산은 아래에서 위로 변환이 적용된다.

    CGContextScaleCTM(context, 1.0, -1.0)     // (2)
    CGContextTranslateCTM(context, 0.0, -200) // (1)
    
}, withIdentifier: "rotate-where-is-it?")

//: Rotate-1
XCPlaygroundPage.currentPage.captureValue( transform { context in
    // 적용순서에 주의해야 한다.
    // 행렬연산은 아래에서 위로 변환이 적용된다.
    CGContextRotateCTM(context, radian(10))   // (3)
    CGContextScaleCTM(context, 1.0, -1.0)     // (2)
    CGContextTranslateCTM(context, 0.0, -200) // (1)
    
}, withIdentifier: "rotate-where-is-the-origin? 1")



//: Rotate-2
XCPlaygroundPage.currentPage.captureValue( transform { context in
    // 적용순서에 주의해야 한다.
    // 행렬연산은 아래에서 위로 변환이 적용된다.

    CGContextScaleCTM(context, 1.0, -1.0)       // (3)
    CGContextTranslateCTM(context, 0.0, -200)   // (2)
    CGContextRotateCTM(context, radian(10))     // (1)
    
}, withIdentifier: "rotate-where-is-the-origin? 2")



//: set Anchor point to the center
XCPlaygroundPage.currentPage.captureValue( transform { context in
    // 적용순서에 주의해야 한다.
    // 행렬연산은 아래에서 위로 변환이 적용된다.
    
    CGContextScaleCTM(context, 1.0, -1.0)       // (5)
    CGContextTranslateCTM(context, 0.0, -200)   // (4)
    CGContextTranslateCTM(context, 100, 100)    // (3)
    CGContextRotateCTM(context, radian(10))     // (2)
    CGContextTranslateCTM(context, -100, -100)  // (1)
    
}, withIdentifier: "Anchor-Point to center")






















