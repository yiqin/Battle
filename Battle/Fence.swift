//
//  Fence.swift
//  Battle
//
//  Created by Yi Qin on 8/19/15.
//  Copyright © 2015 Yi Qin. All rights reserved.
//

import UIKit

class Fence: UIView {
    
    enum Direction {
        case Horizontal
        case Vertical
    }
    
    
    
    var isBuilt: Bool = false
    
    convenience init(row: Int, column: Int, direction: Direction) {
        
        let startingPoint = CGPointMake(CGFloat(row)*gridWidth, CGFloat(column)*gridHeight+gridHeight*1.2)
        
        let endingPoint:CGPoint
        switch direction {
        case .Horizontal:
            endingPoint = CGPointMake(CGFloat(row+1)*gridWidth, CGFloat(column)*gridHeight+gridHeight*1.2)
        case .Vertical:
            endingPoint = CGPointMake(CGFloat(row)*gridWidth, CGFloat(column+1)*gridHeight+gridHeight*1.2)
        }
        
        self.init(startingPoint: startingPoint, endingPoint: endingPoint)
    }
    
    init(startingPoint: CGPoint, endingPoint: CGPoint) {
        
        let frame:CGRect
        if startingPoint.x == endingPoint.x {
            frame = CGRectMake(startingPoint.x-fenceWidth*0.5, startingPoint.y, fenceWidth, endingPoint.y-startingPoint.y)
        } else {
            frame = CGRectMake(startingPoint.x, startingPoint.y-fenceWidth*0.5, endingPoint.x-startingPoint.x, fenceWidth)
        }
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.grayColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
