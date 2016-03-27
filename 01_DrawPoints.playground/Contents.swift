//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

/**

코어그래픽스의 핵심은 패스를 만든 후 그리는 것입니다.
선, 원, 사각형 등을 그릴 때, 바로 그리는 것이 아니라
현재 context에 해당 shape의 패스를 추가한 후
패스의 속성(두깨, 선색상, 채울 색상)을 정한 후 패스를 stroke하거나 fill합니다.

 */

UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
let context = UIGraphicsGetCurrentContext()

CGContextSetLineWidth(context, 5)
CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
CGContextAddEllipseInRect(context, CGRectMake(10, 10, 50, 50))

//CGContextStrokePath(context)
//CGContextFillPath(context)
CGContextDrawPath(context, .FillStroke)

let result = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

XCPlaygroundPage.currentPage.captureValue(result, withIdentifier: "result")



/**

CGContextStrokePath 나 CGContextFillPath를 사용하면 context에 저장되어 있는 패스가 모두
reset 됩니다. 따라서 두 개를 동시에 그리려면 CGContextDrawPath를 사용해서 그리기 모드를 
FillStroke 로 해줘야 합니다.

*/


/**

코어그래픽스는 아래의 단계로 코드가 진행됩니다.


1. 컨텍스트 생성
2. 패스의 속성 설정
 - 색상
 - 선 두깨
 - 행렬 변환
 - 채울 색상 등
3. 패스 추가하기
 - 원
 - 사각형
 - 타원
 - 임의의 폴리곤
4. 패스 그리기
5. 경우에 따라 UIImage얻기
6. 컨텍스트 종료하기

*/



//: 크기가 4x4인 원 100개 그리기
UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
let context2 = UIGraphicsGetCurrentContext()
CGContextSetStrokeColorWithColor(context2, UIColor.redColor().CGColor)
CGContextSetFillColorWithColor(context2, UIColor.whiteColor().CGColor)

for i in 1...100 {
    let x : CGFloat = CGFloat(arc4random() % UInt32(100))
    let y : CGFloat = CGFloat(arc4random() % UInt32(100))
    CGContextAddEllipseInRect(context2, CGRectMake(x, y, 4, 4))
}

CGContextDrawPath(context2, .FillStroke)
let result2 = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

XCPlaygroundPage.currentPage.captureValue(result2, withIdentifier: "result2")








