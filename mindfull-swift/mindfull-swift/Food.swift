//
//  Food.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 2/2/21.
//

import SwiftUI

struct Nutrients: Decodable {
    var name: String
    var kcal: Int
    var protein: String
    var carbs: String
    var fat: String
    var label: String
    var quantity: Int
    var unit: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "text"
        case kcal = "ENERC_KCAL"
        case protein = "PROCNT"
        case carbs = "CHOCDF"
        case fat = "FAT"
        case label = "label"
        case quantity = "quantity"
        case unit = "unit"
    }
        
}

struct Food: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Food_Previews: PreviewProvider {
    static var previews: some View {
        Food()
    }
}
