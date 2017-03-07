//
//  ViewController.swift
//  Shapes
//
//  Created by eli on 3/7/17.
//  Copyright © 2017 Examples. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stickPath = UIBezierPath()
        stickPath.move(to: CGPoint(x: 175, y: 100))
        stickPath.addArc(withCenter: CGPoint(x: 150, y: 100),
                         radius: 25,
                         startAngle: 0,
                         endAngle: CGFloat(M_PI * 2),
                         clockwise: true)
        stickPath.move(to: CGPoint(x: 150, y: 125))
        stickPath.addLine(to: CGPoint(x: 150, y: 175))
        stickPath.addLine(to: CGPoint(x: 125, y: 225))
        stickPath.move(to: CGPoint(x: 150, y: 175))
        stickPath.addLine(to: CGPoint(x: 175, y: 225))
        stickPath.move(to: CGPoint(x: 100, y: 150))
        stickPath.addLine(to: CGPoint(x: 200, y: 150))
        
        let stickShapeLayer = CAShapeLayer()
        stickShapeLayer.strokeColor = UIColor.red.cgColor
        stickShapeLayer.fillColor = UIColor.clear.cgColor
        stickShapeLayer.lineWidth = 5
        stickShapeLayer.lineJoin = "round"
        stickShapeLayer.lineCap = "round"
        stickShapeLayer.path = stickPath.cgPath
        
        view.layer.addSublayer(stickShapeLayer)
        
        //Rounded View
        
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let radii = CGSize(width: 20, height: 20)
        let corners: UIRectCorner = [.bottomLeft, .bottomRight, .topLeft]
        let roundedBoxPath = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: radii)
        
        let roundedBoxShapeLayer = CAShapeLayer()
        roundedBoxShapeLayer.path = roundedBoxPath.cgPath
        
        let roundedView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        roundedView.backgroundColor = .blue
        roundedView.layer.mask = roundedBoxShapeLayer
        
        view.addSubview(roundedView)
        
        // Text
        
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: 100, y: 450, width: 100, height: 100)
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.alignmentMode = "left"
        textLayer.isWrapped = true
        
        let mutString = NSMutableAttributedString(string: "Example text, using CATextLayer")
        
        let myAttributes = [
            NSFontAttributeName: UIFont(name: "Chalkduster", size: 14.0)! ,
            NSForegroundColorAttributeName: UIColor.black
        ]
        
        mutString.addAttributes(myAttributes, range: NSMakeRange(0, mutString.length))
        
        let myAttributes2: [String : Any] = [
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0) ,
            NSForegroundColorAttributeName: UIColor.red,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue
        ]

        mutString.addAttributes(myAttributes2, range: NSMakeRange(7, 5))
        
        textLayer.string = mutString
        view.layer.addSublayer(textLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

