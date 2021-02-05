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
//                print("IS THIS WORKING?")
//                let resultStruct = try jsonDecoder.decode(Result.self, from: data)
//                print("\(resultStruct.ingredients[0].text)")
//                self.name = resultStruct.ingredients[0].text
//                print(self.text)
//                print("\(resultStruct.ingredients[0].parsed[0].nutrients.CHOCDF.label)")
//                print("\(resultStruct.ingredients[0].parsed[0].nutrients.PROCNT.label)")
//                print("\(resultStruct.ingredients[0].parsed[0].nutrients.FAT.label)")
//                completed()
//
//            } catch {
//                print(error)
//                completed()
//            }
//        }
//        task.resume()
        /////////////////////////////////////////
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completed()
                return
            }
            guard let data = data else {
                print("data was nil")
                completed()
                return
            }
            //deal with the data
            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                let result = try JSONDecoder().decode(Result.self, from: data)
                self.name = result.ingredients[0].text
                                print("\(result.ingredients[0].text)")

//                self.fatLabel = result.ingredients[0].parsed[0].nutrients.FAT.label
//                self.carbLabel = result.ingredients[0].parsed[0].nutrients.CHOCDF.label
//                self.proteinLabel = result.ingredients[0].parsed[0].nutrients.PROCNT.label
                completed()

//            }
//            catch {
//                print("JSON Error: \(error.localizedDescription)")
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
            completed()
        }

        task.resume()
    }
}
