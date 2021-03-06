//
//  RobotStyleKit.swift
//  ProjectName
//
//  Created by AuthorName on 3/7/17.
//  Copyright © 2017 CompanyName. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//
//  This code was generated by Trial version of PaintCode, therefore cannot be used for commercial purposes.
//



import UIKit

public class RobotStyleKit : NSObject {

    //// Drawing Methods

    public dynamic class func drawRobot(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 250, height: 191), resizing: ResizingBehavior = .aspectFit, robotColor: UIColor = UIColor(red: 0.025, green: 0.976, blue: 0.065, alpha: 1.000), angle: CGFloat = 0) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 250, height: 191), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 250, y: resizedFrame.height / 191)


        //// Color Declarations
        let color = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 78, y: 68, width: 94, height: 75), byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 23, height: 23))
        rectanglePath.close()
        robotColor.setFill()
        rectanglePath.fill()


        //// Rectangle 2 Drawing
        context.saveGState()
        context.translateBy(x: 64.12, y: 73.77)
        context.rotate(by: -angle * CGFloat.pi/180)

        let rectangle2Path = UIBezierPath(roundedRect: CGRect(x: -6.12, y: -5.77, width: 11, height: 48), cornerRadius: 5.5)
        robotColor.setFill()
        rectangle2Path.fill()

        context.restoreGState()


        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(roundedRect: CGRect(x: 181, y: 68, width: 11, height: 48), cornerRadius: 5.5)
        robotColor.setFill()
        rectangle3Path.fill()


        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(roundedRect: CGRect(x: 97, y: 131, width: 11, height: 39), cornerRadius: 5.5)
        robotColor.setFill()
        rectangle4Path.fill()


        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(roundedRect: CGRect(x: 143, y: 131, width: 11, height: 39), cornerRadius: 5.5)
        robotColor.setFill()
        rectangle5Path.fill()


        //// Oval Drawing
        let ovalRect = CGRect(x: 78, y: 31, width: 94, height: 65)
        let ovalPath = UIBezierPath()
        ovalPath.addArc(withCenter: CGPoint.zero, radius: ovalRect.width / 2, startAngle: -180 * CGFloat.pi/180, endAngle: 0 * CGFloat.pi/180, clockwise: true)
        ovalPath.addLine(to: CGPoint.zero)
        ovalPath.close()

        var ovalTransform = CGAffineTransform(translationX: ovalRect.midX, y: ovalRect.midY)
        ovalTransform = ovalTransform.scaledBy(x: 1, y: ovalRect.height / ovalRect.width)
        ovalPath.apply(ovalTransform)

        robotColor.setFill()
        ovalPath.fill()


        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: 108, y: 44, width: 5, height: 5))
        color.setFill()
        oval2Path.fill()


        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: 135, y: 44, width: 5, height: 5))
        color.setFill()
        oval3Path.fill()


        //// Rectangle 6 Drawing
        context.saveGState()
        context.translateBy(x: 102, y: 10.73)
        context.rotate(by: -19.42 * CGFloat.pi/180)

        let rectangle6Path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2, height: 48), cornerRadius: 1)
        robotColor.setFill()
        rectangle6Path.fill()

        context.restoreGState()


        //// Rectangle 7 Drawing
        context.saveGState()
        context.translateBy(x: 140.96, y: 10.07)
        context.rotate(by: 19.42 * CGFloat.pi/180)

        let rectangle7Path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2, height: 48), cornerRadius: 1)
        robotColor.setFill()
        rectangle7Path.fill()

        context.restoreGState()
        
        context.restoreGState()

    }

    //// Generated Images

    public dynamic class func imageOfRobot(robotColor: UIColor = UIColor(red: 0.025, green: 0.976, blue: 0.065, alpha: 1.000), angle: CGFloat = 0) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 250, height: 191), false, 0)
            RobotStyleKit.drawRobot(robotColor: robotColor, angle: angle)

        let imageOfRobot = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return imageOfRobot
    }




    @objc public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
