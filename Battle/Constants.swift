//
//  Constants.swift
//  Battle
//
//  Created by Yi Qin on 8/19/15.
//  Copyright © 2015 Yi Qin. All rights reserved.
//

import Foundation
import UIKit

let screenBounds = UIScreen.mainScreen().bounds
let screenSize   = screenBounds.size
let screenWidth  = screenSize.width
let screenHeight = screenWidth// screenSize.height

let rows = 6
let columns = 7
let gridWidth = screenWidth/CGFloat(rows)
let gridHeight = screenHeight/CGFloat(rows)

let fenceWidth: CGFloat = 8