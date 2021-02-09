//
//  BackendData.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/8/21.
//

import Foundation

class BackendData: UIViewController {
    
    struct BackendData: Codable {
        var text: String
        var calories: Int
        var fat: Double
        var carbs: Double
        var protein: Double
        
       private enum CodingKeys: Sting, CodingKey {
            case text = "name"
            case calories
            case fat
            case carbs
            case protein
            
        }
        
    }
}

