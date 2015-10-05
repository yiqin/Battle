//
//  ViewController.swift
//  Battle
//
//  Created by Yi Qin on 8/19/15.
//  Copyright © 2015 Yi Qin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var switchUser: Bool = true
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // generate a map of grid
        
        generateMap()
        // generateFences()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func generateMap() {
        
        print(view.frame.size)
        
        for i in 0...rows {
            for j in 0...columns {
                
                if i < rows && j < columns {
                    let gridView = Grid(frame: CGRectMake(CGFloat(i)*gridWidth, CGFloat(j)*gridHeight+gridHeight*1.2, gridWidth, gridHeight))
                    
                    gridView.layer.borderWidth = 1.0
                    gridView.layer.borderColor = UIColor.blackColor().CGColor
                    
                    view.addSubview(gridView)
                    
                    let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapGridView:"))
                    singleTap.numberOfTapsRequired = 1
                    gridView.userInteractionEnabled = true
                    gridView.addGestureRecognizer(singleTap)
                }
                
                if i < rows {
                    let fence1 = Fence(row: i, column: j, direction: .Horizontal)
                    view.addSubview(fence1)
                    
                    let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapDetected:"))
                    singleTap.numberOfTapsRequired = 1
                    fence1.userInteractionEnabled = true
                    fence1.addGestureRecognizer(singleTap)
                }
                
                if j < columns && i > 0 && i < rows {
                    let fence2 = Fence(row: i, column: j, direction: .Vertical)
                    view.addSubview(fence2)
                    
                    let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapDetected:"))
                    singleTap.numberOfTapsRequired = 1
                    fence2.userInteractionEnabled = true
                    fence2.addGestureRecognizer(singleTap)
                }
                
            }
        }
    }
    
    func tapDetected(recognizer: UITapGestureRecognizer) {
        if let view = recognizer.view {
            if switchUser {
                view.backgroundColor = UIColor.blueColor()
            } else {
                view.backgroundColor = UIColor.grayColor()
            }
        }
        print("Single Tap on imageview")
        switchUser = !switchUser

    }
    
    func tapGridView(recognizer: UITapGestureRecognizer) {
        if let view = recognizer.view {
            if switchUser {
                view.backgroundColor = UIColor.redColor()
            } else {
                view.backgroundColor = UIColor.yellowColor()
            }
        }
        print("Single Tap on imageview")
        switchUser = !switchUser
    }
    
}

