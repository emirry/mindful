//
//  FoodDetail.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/4/21.
//

import Foundation
import Keys

class FoodDetail: Codable {
    var name: String
    var calories: Int
    var fat: Double
    var carbs: Double
    var protein: Double
    
    init(name: String, calories: Int, fat: Double, carbs: Double, protein: Double) {
        self.name = name
        self.calories = calories
        self.fat = fat
        self.carbs = carbs
        self.protein = protein
    }
}
