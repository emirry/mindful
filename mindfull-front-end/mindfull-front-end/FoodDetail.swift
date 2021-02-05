//
//  FoodDetail.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/4/21.
//

import Foundation

class FoodDetail: FoodData {
    
    struct Result: Codable {
        var calories: Int
        var ingredients: [IngredientInfo]
    }
    
    struct IngredientInfo: Codable {
        var text: String
//        var parsed: CalorieInfo
    }
//
//    struct CalorieInfo {
//        var nutrients: NutrientInfo
//    }
//
//    struct NutrientInfo: Codable {
//        var FAT: FatInfo
//        var CHOCDF: CarbInfo
//        var PROCNT: ProteinInfo
//    }
    
    //declaring class properties of type Result
    var text = ""
    
    func getData(completed: @escaping () -> ()) {
        //change to actual api url once I can parse through the JSON data successfully
        let urlString = "https://api.mocki.io/v1/8aff7ed9"
        
        print("URL: \(urlString)")
        
        //Creating a URL
        guard let url = URL(string: urlString) else {
            print("Error: Could not create a URL from \(urlString)")
            completed()
            return
          }
        
        //Create session
        let session = URLSession.shared
        
        //get data wth .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            //deal with the data
            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                let result = try JSONDecoder().decode(Result.self, from: data!)
//                print(" \(result)")
//                print("The Result is: \(result.calories)")
                self.text = result.ingredients[0].text
            } catch {
                print("JSON Error: \(error.localizedDescription)")
            }
            completed()
        }
        
        task.resume()
    }
}
