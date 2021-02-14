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
    
    var rec_bmr = 0
    var rec_calories = 0
    var rec_cal_lose = 0
    
    var responseArr: [UserResponse] = []
    //Post request to user
    func saveToUserDB(_ userToSave: UserDetail, completed: @escaping () -> ()) {

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
            guard let data = data else {
                return
            }
            

            do {
                let responseModel = try JSONDecoder().decode(UserResponse.self, from: data)
                
                self.rec_bmr = responseModel.rec_bmr
                print("WORKING BMR", self.rec_bmr)
                self.rec_calories = responseModel.rec_calories
                self.rec_cal_lose = responseModel.rec_cal_lose
                
                self.responseArr.append(responseModel)
                
                DispatchQueue.main.sync {
                    
                }
//
            }
            catch let jsonErr {
                print(jsonErr)
            }

        }
        task.resume()
        print("!!!!", rec_bmr)

    }
    
    
    func deleteItem() {
        
    }
}
