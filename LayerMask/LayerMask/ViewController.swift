//
//  ViewController.swift
//  LayerMask
//
//  Created by eli on 2/27/17.
//  Copyright © 2017 Examples. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fractalImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let zoroMask = createZoroLayer(with: fractalImageView.bounds)
        let maskCenter = CGPoint(x: fractalImageView.bounds.size.width / 2,
                                 y: fractalImageView.bounds.size.height / 2)
        zoroMask.position = maskCenter
        fractalImageView.layer.mask = zoroMask
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

private extension ViewController {
    
    func createZoroLayer(with rect: CGRect) -> CALayer {
        guard let zoro = UIImage(named: "zoro") else {
            return CALayer()
        }
        
        let zoroLayer = CALayer()
        zoroLayer.bounds = rect
        zoroLayer.isOpaque = true
        zoroLayer.contents = zoro.cgImage
        zoroLayer.contentsGravity = "resizeAspect"
        
        return zoroLayer
    }
    
}
