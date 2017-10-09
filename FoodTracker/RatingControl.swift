//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Xiaoli Shen on 2017/10/09.
//  Copyright © 2017 furixturi. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    // property observers
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Initialization
    //For programmatically instantiate the view, called by Interface Builder at app development
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    //For loading the vie from the storyboard at run time
    //"required" is required to indicate the subclass of this must also implement the initializer
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed")
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        // Clear any existing buttons
        for button in ratingButtons {
            // Tell the stack view no longer to calculate the button's size and position
            removeArrangedSubview(button)
            // Remove the button from the stack view entirely
            button.removeFromSuperview()
        }
        // Empty the ratingButtons array
        ratingButtons.removeAll()
        
        // Create the buttons
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false // Disables the button's auto-generated constraints
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the ratingButtons array
            ratingButtons.append(button)
        }
    }
}
