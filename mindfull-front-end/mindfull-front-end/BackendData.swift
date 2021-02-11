//
//  BackendData.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/8/21.
//

import Foundation

struct BackendData: Codable {
    var journal_items: [FoodInfo]
//        var name: String
//        var calories: Int
//        var fat: Double
//        var carbs: Double
//        var protein: Double
}

struct FoodInfo: Codable {
        var name: String
        var calories: Int
        var fat: Double
        var protein: Double
        var carbs: Double
}




//class BackendData {
//    var name: String
//    var calories: Int
//    var fat: Double
//    var carbs: Double
//    var protein: Double
//
//    init(self, name, calories, fat, carbs, protein) {
//        self.name = name
//        self.calories = calories
//        self.fat = fat
//        self.carbs = carbs
//        self.protein = protein
//    }
//
//
//
//}
