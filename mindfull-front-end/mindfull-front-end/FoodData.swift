//
//  FoodData.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/3/21.
//

import Foundation

class FoodData: Decodable {
    let text: String
    var calories: Int
    
    init(text: String, calories: Int) {
        self.text = text
        self.calories = calories
    }
    
}

