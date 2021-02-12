//
//  ApiRestActions.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/10/21.
//

import Foundation

class ApiRestActions {
    
//    func date() {
//        let dateFormatter = DateFormatter()
//        let date = dateFormatter.defaultDate
//        return
//
//    }

    
    func saveToDatabase(_ foodToSave: FoodDetail) {
        print("!!!!")
    
        let url = URL(string: "http://127.0.0.1:8000/food/")
        guard let requestUrl = url else {
            print("URL is invalid")
            return
        }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        let newFoodData = ResponseModel(name: String(), calories: Int(), fat: Double(), carbs: Double(), protein: Double())

        let jsonData = try? JSONEncoder().encode(foodToSave)

        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            guard let data = data else { return }

            do {
                let responseModel = try JSONDecoder().decode(FoodDetail.self, from: data)
                print("Response data:\n \(responseModel)")
//                print("responseModel date: \(responseModel.date)")
                print("responseModel name: \(responseModel.name)")
                print("responseModel calories: \(responseModel.calories)")
                print("responseModel carbs: \(responseModel.carbs)")
                print("responseModel fat: \(responseModel.fat)")
                print("responseModel protein: \(responseModel.calories)")
            }
            catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    
    func deleteItem() {
        
    }
}
