//
//  FoodData.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/3/21.
//

import Foundation

class FoodData: Decodable {
    let name: String
    let calories: Int
    
    init(name: String, calories: Int) {
        self.name = name
        self.calories = calories
    }
    
    func getData() {
        //change to actual api url once I can parse through the JSON data successfully
        let urlString = "https://api.mocki.io/v1/8aff7ed9"
        
        print("URL: \(urlString)")
        
        //Creating a URL
        guard let url = URL(string: urlString) else {
            print("Error: Could not create a URL from \(urlString)")
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
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("\(json)")
            } catch {
                print("JSON Error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}

//struct FatInfo: Decodable {
//    let label: String
//    let quantity: Int
//    let unit: String
//}

//struct NutrientsObj: Decodable {
//    let kcal: CalorieInfo
//    let protein: ProteinInfo
//    let carbs: CarbInfo
//    let fat: FatInfo
//
//    private enum CodingKeys: String, CodingKey {
//        case kcal = "ENERC_KCAL"
//        case protein = "PROCNT"
//        case carbs = "CHOCDF"
//        case fat = "FAT"
//    }
//}
//
//struct CalorieInfo: Decodable {
//    let label: String
//    let quantity: Int
//    let fat: String
//}
//
//struct ProteinInfo: Decodable {
//    let label: String
//    let quantity: Int
//    let fat: String
//}
//
//struct CarbInfo: Decodable {
//    let label: String
//    let quantity: Int
//    let fat: String
//}
//
//struct FatInfo: Decodable {
//    let label: String
//    let quantity: Int
//    let fat: String
//}

