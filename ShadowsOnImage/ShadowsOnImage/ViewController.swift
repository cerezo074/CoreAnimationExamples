//
//  ViewController.swift
//  ShadowsOnImage
//
//  Created by eli on 2/27/17.
//  Copyright © 2017 Examples. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let zoroLayer = createZoroLayer()
        zoroLayer.position = view.center
        view.layer.addSublayer(zoroLayer)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

private extension ViewController {
    
    func createZoroLayer() -> CALayer {
        guard let zoro = UIImage(named: "zoro") else {
            return CALayer()
        }
        
        let zoroLayer = CALayer()
        let size = CGSize(width: zoro.size.width, height: zoro.size.height)
        zoroLayer.bounds = CGRect(origin: CGPoint.zero, size:size)
        zoroLayer.isOpaque = true
        zoroLayer.contents = zoro.cgImage
        //zoroLayer.contentsGravity = "resizeAspect"
        
        zoroLayer.shadowRadius = 0.5
        zoroLayer.shadowColor = UIColor.black.cgColor
        zoroLayer.shadowOpacity = 0.4 //shadow transparency
        zoroLayer.shadowOffset = CGSize(width: 2, height: 2)
        
        /*
         Apply a custom shadow, uncomment if you preffer apply a shadow that fit with backing
         image
         */
        
//        let zoroSize = zoroLayer.bounds.size
//        let ellipseShadowHeight: CGFloat = 25.0
//        let ellipseShadowSize = CGSize(width: zoroSize.width,
//                                       height: ellipseShadowHeight)
//        let ellipseOrigin = CGPoint(x: 0,
//                                    y: zoroSize.height - ellipseShadowHeight)
//        let ellipseRect = CGRect(origin: ellipseOrigin,
//                                 size: ellipseShadowSize)
//        zoroLayer.shadowPath = CGPath(ellipseIn: ellipseRect, transform: nil)
        
        return zoroLayer
    }
    
}
