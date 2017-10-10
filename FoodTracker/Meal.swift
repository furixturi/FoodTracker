//
//  Meal.swift
//  FoodTracker
//
//  Created by Xiaoli Shen on 2017/10/10.
//  Copyright © 2017 furixturi. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    var name: String
    var photo: UIImage
    var rating: Int
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialization should fail if there is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        self.name = name
        self.photo = photo!
        self.rating = rating
        
    }
}
