//
//  DatabaseApi.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/8/21.
//

import UIKit

protocol DatabaseApiDelegate {
    func itemsDownloaded(foods: [BackendData])
}

class DatabaseApi: NSObject {
    
    var delegate: DatabaseApiDelegate?
    
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
        var savedFoodArray = [BackendData]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
//            print(jsonArray)
            
            for jsonResult in jsonArray {
                let jsonDict = jsonResult as! [String:Any]
                
                let food = BackendData(name: jsonDict["name"]! as! String,
                                     calories: jsonDict["calories"]! as! Int,
                                     fat: jsonDict["fat"]! as! Double,
                                     carbs: jsonDict["carbs"]! as! Double,
                                     protein: jsonDict["protein"]! as! Double)
                
                savedFoodArray.append(food)
//                print(food)
            }
            delegate?.itemsDownloaded(foods: savedFoodArray)
        }
        catch {
                print("Error: \(error.localizedDescription)")
        }
    
    }

}
