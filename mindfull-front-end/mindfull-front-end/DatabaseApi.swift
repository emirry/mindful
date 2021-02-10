//
//  DatabaseApi.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/8/21.
//

import UIKit

//PARSING SAVED DATA

//protocol DatabaseApiDelegate {
//    func itemsDownloaded(foods: [BackendData])
//}

class DatabaseApi: UIViewController {
    var savedFoodArray = [BackendData]()
//    var delegate: DatabaseApiDelegate?
    
//    var food: [BackendData] = []
    var savedFoodIndex = 0
    var name = ""
    var calories = 0
    var fat = 0.0
    var carbs = 0.0
    var protein = 0.0
    
    func getSavedData() {
        //Hit the backend api URL
        let apiURL = "http://127.0.0.1:8000/foodjournal/"
        print(apiURL)
        //download json data
        guard let url = URL(string: apiURL) else {
            print("Could not create URL")
            return
        }
            //checking that url is no nil
//            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                let jsonDecoder = JSONDecoder()
                print("HELLO")

                if let error = error {
                    print("\(error.localizedDescription)")
                    return
                }
//                else {
//                    self.parseJson(data!)
//                }
                guard let data = data else {
                    print("data was nil")
                    return
                }
                do {
                    print("HELLO AGAIN")

                    let result = try jsonDecoder.decode([BackendData].self, from: data)
                    print(result)
                    self.savedFoodArray.append(contentsOf: result)

//                    DispatchQueue.main.async {
//                        self.savedFoodArray.append(result)
//
                }
                catch {
                    print("\(error.localizedDescription)")
                }
    
            }
            task.resume()

        }
        
        //parse it out into food info structs
        
        //notify the view controller and pass data back

//    func parseJson(_ data: Data) {
//        //Parse data into food structs
//
//        do {
//            let jsonResults = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
////
////            print(jsonArray)
//
////                print(jsonResult)
//                let food_log_item = FoodInfo(name: jsonResults["name"] as! String,
//                                             calories: jsonResults["calories"] as! Int,
//                                             fat: jsonResults["fat"]! as! Double,
//                                             carbs: jsonResults["carbs"]! as! Double,
//                                             protein: jsonResults["protein"]! as! Double)
////                let food = BackendData(food_log_item: food_log_item)
////                self.savedFoodArray.append(food)
//
////                DispatchQueue.main.async {
////
////                    self.savedFoodArray.append(food)
////                    print(food)
////                }
//
////
////                self.name = food.name
////                self.calories = food.calories
////                self.fat = food.fat
////                self.carbs = food.carbs
////                self.protein = food.protein
////                print(savedFoodArray)
//
//            }
//            delegate?.itemsDownloaded(foods: savedFoodArray)
//        }
//        catch {
//                print("Error: \(error.localizedDescription)")
//        }
//    print(savedFoodArray)
//
    
    //function to s

}
