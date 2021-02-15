//
//  BackendData.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/8/21.
//

import Foundation

struct BackendData: Codable {
    var food_entries: [FoodInfo]
}

struct FoodInfo: Codable {
        var name: String
        var calories: Int
        var fat: Double
        var protein: Double
        var carbs: Double
}

