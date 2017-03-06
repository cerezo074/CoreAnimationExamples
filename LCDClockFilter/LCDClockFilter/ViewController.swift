//
//  ViewController.swift
//  LCDClockFilter
//
//  Created by eli on 3/6/17.
//  Copyright © 2017 Examples. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var digitViews: [UIView]!
    private weak var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let digitsImage = UIImage(named: "digits") else {
            return
        }
        
        let tickSelector = #selector(ViewController.tick)
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: tickSelector,
                                     userInfo: nil,
                                     repeats: true)
        
        for digit in digitViews {
            digit.layer.contents = digitsImage.cgImage
            digit.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.1, height: 1.0)
            digit.layer.contentsGravity = "resizeAspect"
            digit.layer.magnificationFilter = "nearest"
        }
        
        
        tick()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController {
    
    func tick() {
        let calendar = Calendar(identifier: .gregorian)
        let units: Set<Calendar.Component> = [.hour,
                     .minute,
                     .second]
        let components = calendar.dateComponents(units, from: Date())
        
        guard let hour = components.hour else { return }
        guard let minute = components.minute else { return }
        guard let second =  components.second else { return }
        //Set Hours
        setDigit(digit: hour / 10, on: digitViews[0]) //First digit
        setDigit(digit: hour % 10, on: digitViews[1]) //Second digit
        setDigit(digit: minute / 10, on: digitViews[2]) //First digit
        setDigit(digit: minute % 10, on: digitViews[3]) //Second digit
        setDigit(digit: second / 10, on: digitViews[4]) //First digit
        setDigit(digit: second % 10, on: digitViews[5]) //Second digit
    }
    
    func setDigit(digit: Int, on digitView: UIView) {
        digitView.layer.contentsRect = CGRect(x: 0.1 * CGFloat(digit),
                                         y: 0,
                                         width: 0.1,
                                         height: 1.0)
    }

}

