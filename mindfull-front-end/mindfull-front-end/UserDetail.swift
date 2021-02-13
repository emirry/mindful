//
//  UserDetail.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/12/21.
//

import Foundation

class UserDetail: Codable {
    var user_name:String
    var maleOrFemale: String
    var weight: Int
    var height: Int
    var age: Int
    var activityLevel: Int
    
    init(user_name: String, maleOrFemale: String, weight: Int, height: Int, age: Int, activityLevel: Int) {
        self.user_name = user_name
        self.maleOrFemale = maleOrFemale
        self.weight = weight
        self.height = height
        self.age = age
        self.activityLevel = activityLevel
    }
    
}

class UserResponse: Codable {
    //REVIEW: might have include more variables
    var bmr: Int
    var calToMaintain: Int
    var calToLose: Int
    var macros: Int
}
