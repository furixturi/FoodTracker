//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Xiaoli Shen on 2017/10/09.
//  Copyright © 2017 furixturi. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    //MARK: Initialization
    //For programmatically instantiate the view, called by Interface Builder at app development
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    //For loading the vie from the storyboard at run time
    //"required" is required to indicate the subclass of this must also implement the initializer
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
