//
//  SOXShapedTapView.swift
//  SOXShapedTapView
//
//  Created by Spagnolo, Daniele on 30/11/2014.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit
import Foundation
extension UIView {
    func alphaFromPoint(point: CGPoint) -> CGFloat {
        var pixel: [UInt8] = [0, 0, 0, 0]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let alphaInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue)
        let context = CGBitmapContextCreate(&pixel, 1, 1, 8, 4, colorSpace, alphaInfo.rawValue)
        
        CGContextTranslateCTM(context, -point.x, -point.y);
        
        self.layer.renderInContext(context!)
        
        let floatAlpha = CGFloat(pixel[3])
        return floatAlpha
    }
    
    func getColourFromPoint(point:CGPoint) -> UIColor {
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()!
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue)
        var pixelData:[UInt8] = [0, 0, 0, 0]
        let context = CGBitmapContextCreate(&pixelData, 1, 1, 8, 4, colorSpace, bitmapInfo.rawValue)
        CGContextTranslateCTM(context, -point.x, -point.y);
        self.layer.renderInContext(context!)
        
        let red:CGFloat = CGFloat(pixelData[0])/CGFloat(255.0)
        let green:CGFloat = CGFloat(pixelData[1])/CGFloat(255.0)
        let blue:CGFloat = CGFloat(pixelData[2])/CGFloat(255.0)
        let alpha:CGFloat = CGFloat(pixelData[3])/CGFloat(255.0)
        let color:UIColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
}
extension UIColor {
    var hexString: String {
        let components = CGColorGetComponents(self.CGColor)
        
        let red = Float(components[0])
        let green = Float(components[1])
        let blue = Float(components[2])
        return String(format: "#%02lX%02lX%02lX", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255))
    }
}

@IBDesignable
class SOXShapedTapButton: UIButton {
    
    @IBInspectable var treshold: CGFloat = 1.0 {
        didSet {
            if treshold > 1.0 {
                treshold = 1.0
            }
            if treshold < 0.0 {
                treshold = 0.0
            }
        }
    }
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return self.alphaFromPoint(point) > treshold
    }
}