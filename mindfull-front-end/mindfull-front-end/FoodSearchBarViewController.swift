//
//  FoodSearchBarViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/5/21.
//

import UIKit
import Keys

private let key = MindfullFrontEndKeys()

class FoodSearchBarViewController: UIViewController {
        
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

//    var selectedFood = ApiRestActions()
    var backendData: BackendData!
    var searchTimeout: Timer?
    var calories = 0
    var name = ""
    var fatLabel = ""
    var carbLabel = ""
    var proteinLabel = ""
    var isSearching = false
    var resultsArr: [Result] = []
    var selectedFoodIndex = 0
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        searchBar.delegate = self
        searchResultsTable.delegate = self
        searchResultsTable.dataSource = self
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 246/225.0, green: 141/225.0, blue: 95/225.0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Thasadith-Regular", size: 20)!]
    }
    
    //review. make sure api call gets canceled when leaving this view
    override func viewWillDisappear(_ animated: Bool) {
        cancelSearchTimeout()
        super.viewWillDisappear(animated)
    }
    
    func cancelSearchTimeout() {
        if let existingTimeout = self.searchTimeout {
         existingTimeout.invalidate()
         self.searchTimeout = nil
         }
    }    
}

extension FoodSearchBarViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath)
        
        let searchResults = resultsArr[indexPath.row]
        cell.textLabel?.text = "Name: \(searchResults.ingredients[0].text)"
        cell.detailTextLabel?.text = "Calories: \(searchResults.calories)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let foodToSave = FoodDetail(name: resultsArr[0].ingredients[0].text,
                                    calories: resultsArr[0].calories,
                                    fat: resultsArr[0].ingredients[0].parsed[0].nutrients.FAT.quantity,
                                    carbs: resultsArr[0].ingredients[0].parsed[0].nutrients.CHOCDF.quantity,
                                    protein: resultsArr[0].ingredients[0].parsed[0].nutrients.PROCNT.quantity)
        
        let postRequest = ApiRestActions()
        postRequest.saveToDatabase(foodToSave)
            self.searchResultsTable.reloadData()
        
    }
    
    
//    func configureCell(cell: UITableViewCell, forRowAtIndexPath: IndexPath) {
//        //REVIEW
//        if(isSearch) {
//            cell.textLabel?.text = resultsArr[forRowAtIndexPath.row]
//        } else {
//            cell.textLabel?.text = foodProps[forRowAtIndexPath.row]
//        }
//    }
    
    //SearchBarDelegate
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//            searchBar.resignFirstResponder()
        self.searchBar.showsCancelButton = true
        isSearching = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        isSearching = false
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//            searchBar.resignFirstResponder()
        isSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        cancelSearchTimeout()
        
        self.searchTimeout = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.performDeferedSearch), userInfo: nil, repeats: false)
    }
    
    @objc func performDeferedSearch() {
        self.getData("\(URLComponents())", parameters: ["app_id" : "\(key.edamamAppId)", "app_key" : "\(key.edamamApplicationKey)", "ingr" : self.searchBar.text!]) {
        }
    }
    

    //API CALL
     func getData(_ url: String, parameters: [String: String], completed: @escaping () -> ()) {

        let urlString = "https://api.edamam.com/api/nutrition-data"

        print("URL: \(urlString)")
        
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }

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
//                print("\(resultStruct.ingredients[0].text)")
//                self.calories = resultStruct.calories
//                self.proteinLabel = resultStruct.ingredients[0].parsed[0].nutrients.PROCNT.label
//                self.carbLabel = resultStruct.ingredients[0].parsed[0].nutrients.CHOCDF.label
//                self.fatLabel = resultStruct.ingredients[0].parsed[0].nutrients.FAT.label
                self.resultsArr.append(resultStruct)
                
                DispatchQueue.main.async {
                    self.searchResultsTable.reloadData()
                }
                
                completed()
            }
            catch {
                print("\(error.localizedDescription)")
                completed()
            }
        }
        task.resume()
    }

    
}
