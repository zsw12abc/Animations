//
//  ViewController.swift
//  Animations
//
//  Created by Shaowei Zhang on 15/7/18.
//  Copyright © 2015年 Shaowei Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pikaImage: UIImageView!

    var count = 1
    var timer = NSTimer()
    var isAnimating = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAmination"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        

    }

    @IBAction func updateImage(sender: AnyObject) {
        if isAnimating == true {
            timer.invalidate()
            isAnimating = false
        }else{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAmination"), userInfo: nil, repeats: true)
            isAnimating = true
        }
    }
    
    //called before the view actually displayed
    override func viewDidLayoutSubviews() {
        //左右移动
        pikaImage.center = CGPointMake(pikaImage.center.x-400, pikaImage.center.y)
        //渐变
        pikaImage.alpha = 0
        //放大缩小
        //pikaImage.frame = CGRectMake(100, 20, 0, 0)
    }
    
    //called just when the view appears
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in
            // is a closure, so need add self. to access the viewcontroller
            self.pikaImage.center = CGPointMake(self.pikaImage.center.x+400, self.pikaImage.center.y)
            self.pikaImage.alpha = 1
            //self.pikaImage.frame = CGRectMake(100, 20, 100, 200)
        }
    }
    func doAmination(){
        if count == 9 {
            count = 1
        }else{
            count++
        }
        pikaImage.image = UIImage(named: "\(count).png")
//        print(count)
//        print(pikaImage)

    }

}

