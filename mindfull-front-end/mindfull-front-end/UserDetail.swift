//
//  UserDetail.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/12/21.
//

import Foundation

class UserDetail: Codable {
    var user_name:String
    var male_or_female: String
    var weight: Int
    var height: Int
    var age: Int
    var activity_level: Int
    
    init(user_name: String, male_or_female: String, weight: Int, height: Int, age: Int, activity_level: Int) {
        self.user_name = user_name
        self.male_or_female = male_or_female
        self.weight = weight
        self.height = height
        self.age = age
        self.activity_level = activity_level
    }
    
}

class UserResponse: Codable {
    //REVIEW: might have include more variables
    var bmr: Int
    var calToMaintain: Int
    var calToLose: Int
    var macros: Int
}
