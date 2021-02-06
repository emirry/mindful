//
//  FoodDetail.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/4/21.
//

import Foundation
import Keys

private let key = MindfullFrontEndKeys()

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
    //TODO: name will become the search query
    var name = ""
    var fatLabel = ""
    var carbLabel = ""
    var proteinLabel = ""
        
    func getData(_ url: String, parameters: [String: String], completed: @escaping () -> ()) {
        //change to actual api url once I can parse through the JSON data successfully
//        let urlString = "https://api.mocki.io/v1/8aff7ed9"
        //let urlString = "https://api.edamam.com/api/nutrition-data?app_id=bd6a05e8&app_key=a2e67c21cf15d4af86bea5f0b20836c5&ingr=1%20large%20apple"

        let urlString = "https://api.edamam.com/api/nutrition-data"

//        print("URL: \(urlString)")
        
        var urlComponents = URLComponents(string: urlString)!
        
//        urlComponent.queryItems = [
//            URLQueryItem(name: "Edamam-App-ID", value: "\(key.edamamAppId)"),
//            URLQueryItem(name: "Edamam-App-Key", value: "\(key.edamamApplicationKey)"),
//            URLQueryItem(name: "ingr", value: "1+cup+cookedrice")
//        ]
        
        urlComponents.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
//
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%20")
        let request = URLRequest(url: urlComponents.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let jsonDecoder = JSONDecoder()
            if let error = error {
                print(error)
                completed()
                return
            }
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  (200..<300) ~= response.statusCode,
                  error == nil else {
                completed()
                return
            }
            do {
                let resultStruct = try jsonDecoder.decode(Result.self, from: data)
                self.name = resultStruct.ingredients[0].text
                print("\(resultStruct.ingredients[0].text)")
                self.calories = resultStruct.calories
                self.proteinLabel = resultStruct.ingredients[0].parsed[0].nutrients.PROCNT.label
                self.carbLabel = resultStruct.ingredients[0].parsed[0].nutrients.CHOCDF.label
                self.fatLabel = resultStruct.ingredients[0].parsed[0].nutrients.FAT.label

                completed()
            } catch {
                print("\(error.localizedDescription)")
                completed()
            }
        }
        print("It didn't work")
        task.resume()
                
    
    }
}

        
        //        Creating a URL
//         guard let url = URL(string: urlString) else {
//            print("Error: Could not create a URL from \(urlString)")
//            completed()
//            return
//          }
        
        //Edamam query params
//        url.queryItems = [
//            URLQueryItem
//        ]
//        var request = URLRequest(url: url)
//        request.addValue("\(key.edamamAppId)", forHTTPHeaderField: "Edamam-App-ID")
//        request.addValue("\(key.edamamApplicationKey)", forHTTPHeaderField: "Edamam-App-Key")
//        request.addValue("1%20cup%20cookedrice", forHTTPHeaderField: "Ingr")
        
        //Create session
//        let session = URLSession.shared
        
        //get data wth .dataTask method
//        let task = session.dataTask(with: url) { (data, response, error) in
//            let jsonDecoder = JSONDecoder()
//            if let error = error {
//                print(error)
//                completed()
//                return
//            }
//            guard let data = data else {
//                print("data was nil")
//                completed()
//                return
//            }
//            do {
//                let resultStruct = try jsonDecoder.decode(Result.self, from: data)
//                self.name = resultStruct.ingredients[0].text
//                self.calories = resultStruct.calories
//                self.proteinLabel = resultStruct.ingredients[0].parsed[0].nutrients.PROCNT.label
//                self.carbLabel = resultStruct.ingredients[0].parsed[0].nutrients.CHOCDF.label
//                self.fatLabel = resultStruct.ingredients[0].parsed[0].nutrients.FAT.label
//
//                completed()
//            } catch {
//                print(error)
//                completed()
//            }
//        }
//        task.resume()
//    }
//}

