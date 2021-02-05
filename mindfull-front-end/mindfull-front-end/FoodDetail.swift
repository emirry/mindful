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
        var parsed: [CalorieInfo]
    }

    struct CalorieInfo: Codable {
        var nutrients: NutrientInfo
    }

    struct NutrientInfo: Codable {
        var FAT: FatInfo
        var CHOCDF: CarbInfo
        var PROCNT: ProteinInfo
    }

    struct FatInfo: Codable {
        var label: String
        var quantity: Double
        var unit: String
    }

    struct CarbInfo: Codable {
        var label: String
        var quantity: Double
        var unit: String
    }

    struct ProteinInfo: Codable {
        var label: String
        var quantity: Double
        var unit: String
    }

    //declaring class properties of type Result
    var name = ""
    var fatLabel = ""
    var carbLabel = ""
    var proteinLabel = ""
    
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
            let jsonDecoder = JSONDecoder()
            if let error = error {
                print(error)
                completed()
                return
            }
            guard let data = data else {
                print("data was nil")
                completed()
                return
            }
            do {
                let resultStruct = try jsonDecoder.decode(Result.self, from: data)
                self.name = resultStruct.ingredients[0].text
                self.calories = resultStruct.calories
                self.proteinLabel = resultStruct.ingredients[0].parsed[0].nutrients.PROCNT.label
                self.carbLabel = resultStruct.ingredients[0].parsed[0].nutrients.CHOCDF.label
                self.fatLabel = resultStruct.ingredients[0].parsed[0].nutrients.FAT.label

                completed()
            } catch {
                print(error)
                completed()
            }
        }
        task.resume()
    }
}

