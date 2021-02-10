////
////  DatabaseApi.swift
////  mindfull-front-end
////
////  Created by Emily Nagai on 2/8/21.
////
//
//import UIKit
//
////PARSING SAVED DATA
//
////protocol DatabaseApiDelegate {
////    func itemsDownloaded(foods: [FoodListViewController])
////}
//
//class DatabaseApi: UIViewController {
//    var savedFoodArray = [BackendData]()
////    var delegate: DatabaseApiDelegate?
//    
////    var food: [BackendData] = []
//    var savedFoodIndex = 0
//    var name = ""
//    var calories = 0
//    var fat = 0.0
//    var carbs = 0.0
//    var protein = 0.0
//    
//    func getSavedData() {
//        //Hit the backend api URL
//        let apiURL = "http://127.0.0.1:8000/foodjournal/"
//        print(apiURL)
//        //download json data
//        guard let url = URL(string: apiURL) else {
//            print("Could not create URL")
//            return
//        }
//            //checking that url is no nil
////            let request = URLRequest(url: url)
//            let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                let jsonDecoder = JSONDecoder()
//
//                if let error = error {
//                    print("\(error.localizedDescription)")
//                    return
//                }
////                else {
////                    self.parseJson(data!)
////                }
//                guard let data = data else {
//                    print("data was nil")
//                    return
//                }
//                do {
//                    let result = try jsonDecoder.decode([BackendData].self, from: data)
////                    print(result)
//                    self.savedFoodArray.append(contentsOf: result)
////                    print(self.savedFoodArray)
////                    DispatchQueue.main.async {
////                        self.savedFoodArray.append(result)
//                }
//
//                catch {
//                    print("\(error.localizedDescription)")
//                }
////                delegate?.itemsDownloaded(foods: savedFoodArray)
//
//            }
//            task.resume()
//
//        }
//        
//}
