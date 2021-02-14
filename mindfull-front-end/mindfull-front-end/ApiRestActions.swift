//
//  ApiRestActions.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/10/21.
//

import Foundation

class ApiRestActions {
    
    func saveToDatabase(_ foodToSave: FoodDetail) {
    
        let url = URL(string: "http://127.0.0.1:8000/food/")
        guard let requestUrl = url else {
            print("URL is invalid")
            return
        }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
    
    //Post request to user
    func saveToUserDB(_ userToSave: UserDetail) {
        let url = URL(string: "http://127.0.0.1:8000/user/")
        guard let requestUrl = url else {
            print("URL is invalid")
            return
        }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONEncoder().encode(userToSave)

        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            guard let data = data else { return }

            do {
                let responseModel = try JSONDecoder().decode(UserResponse.self, from: data)
                var bmrResponse = responseModel.rec_bmr
                print("BMR", bmrResponse)
                var maintainResponse = responseModel.rec_calories
                var toLoseResponse = responseModel.rec_cal_lose
                
                print("Response data:\n \(bmrResponse)")
                print("Response data:\n \(maintainResponse)")
                print("Response data:\n \(toLoseResponse)")
//                print("responseModel date: \(responseModel.date)")
//                print("responseModel name: \(responseModel.bmr)")
//                print("responseModel calories: \(responseModel.rec_daily_cal)")
//                print("responseModel carbs: \(responseModel.to_lose_weight)")
                
//                let responseModel = try JSONDecoder().decode(UserDetail.self, from: data)
//                print("Response data:\n \(responseModel)")
////                print("responseModel date: \(responseModel.date)")
//                print("responseModel name: \(responseModel.user_name)")
//                print("responseModel calories: \(responseModel.male_or_female)")
//                print("responseModel carbs: \(responseModel.weight)")
//                print("responseModel fat: \(responseModel.height)")
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
