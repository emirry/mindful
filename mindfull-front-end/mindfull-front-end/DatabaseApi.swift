//
//  DatabaseApi.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/8/21.
//

import UIKit

//PARSING SAVED DATA

protocol DatabaseApiDelegate {
    func itemsDownloaded(foods: [BackendData])
}

class DatabaseApi: NSObject {
    var savedFoodArray = [BackendData]()

    var delegate: DatabaseApiDelegate?
//    var food: [BackendData] = []
    var savedFoodIndex = 0
    var name = ""
    var calories = 0
    var fat = 0.0
    var carbs = 0.0
    var protein = 0.0
    
    func getSavedData() {
        //Hit the backend api URL
        let apiURL = "http://localhost:8000/food/"
        print(apiURL)
        
        //download json data
        if let url = URL(string: apiURL) {
            //checking that url is no nil
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error {
                    print("\(error.localizedDescription)")
                    return
                } else {
                    print(self.parseJson(data!))
                }
//                guard let data = data else {
//                    print("data was nil")
//                    return
//                }
    
            })
            task.resume()
//            let url = url {
//                let session = URLSession(configuration: .default)
//                let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
//                    if error == nil {
//                        //calling parse json function on the data
//                        self.parseJson(data: data!)
//                    }
//                    else {
//
//                    }
//                })
//                task.resume()
            }
        }
        
        //parse it out into food info structs
        
        //notify the view controller and pass data back

    func parseJson(_ data: Data) {
        //Parse data into food structs
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            print(jsonArray)
            
            for jsonResult in jsonArray {
                let jsonDict = jsonResult as! [String:Any]
                
                let food = BackendData(name: jsonDict["name"]! as! String,
                                     calories: jsonDict["calories"]! as! Int,
                                     fat: jsonDict["fat"]! as! Double,
                                     carbs: jsonDict["carbs"]! as! Double,
                                     protein: jsonDict["protein"]! as! Double)
                
                savedFoodArray.append(food)
                
                self.name = food.name
                self.calories = food.calories
                self.fat = food.fat
                self.carbs = food.carbs
                self.protein = food.protein
            
            }
            delegate?.itemsDownloaded(foods: savedFoodArray)
        }
        catch {
                print("Error: \(error.localizedDescription)")
        }
    
    }
    
    //function to s

}
