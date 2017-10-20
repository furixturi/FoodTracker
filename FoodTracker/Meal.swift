//
//  Meal.swift
//  FoodTracker
//
//  Created by Xiaoli Shen on 2017/10/10.
//  Copyright © 2017 furixturi. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Archiving Paths
    // For saving and reading data in the file system
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")

    // MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
    // MARK: NSCoding Methods
    // Prepares the class's information to be archived
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    // Unarchives the data when the class is created
    // convenience modifier means that this is a secondary initializer, and that it must call a designated initializer from the same class
    // ? means it is failable, i.e., it might return nil
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. Return nil if we cannot decode a name string
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
            else {
                os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
                return nil
        }
        
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        // Must call designated initializer
        self.init(name: name, photo: photo, rating: rating)
    }
}
