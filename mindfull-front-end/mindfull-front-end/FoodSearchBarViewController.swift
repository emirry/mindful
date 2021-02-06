//
//  FoodSearchBarViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/5/21.
//

import UIKit

class FoodSearchBarViewController: UIViewController {
    
//    @State var isSearch = false
//    @State var searchText = ""
    
    var resultsArr = ["taco", "Pizza", "Fries"]
    var filteredData: [String]!
//    var isSearch : Bool = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultsTable: UITableView!
    //TODO: link back button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchResultsTable.delegate = self
        searchResultsTable.dataSource = self
        filteredData = resultsArr
    }
    
}

extension FoodSearchBarViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //TableViewDataSource
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
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
        self.getData("\(URLComponents())", parameters: ["app_id" : "\(key.edamamAppId)", "app_key" : "\(key.edamamApplicationKey)", "ingr" : "\(searchText)"]) {
            print(searchText)
        }
//            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
//            self.perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 2.0)
//            self.searchResultsTable.reloadData()
        
        
//        let publisher = NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: searchBar.searchTextField)
//        publisher.map {
//            ($0.object as! UISearchTextField).text
//        }
//        .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
//        .sink { (searchText) in
//            self.getData("\(URLComponents())", parameters: ["app_id" : "\(key.edamamAppId)", "app_key" : "\(key.edamamApplicationKey)", "ingr" : "\(searchText)"]) {
//
//            }

    }
    
//    @objc func reload(_ searchBar: UISearchBar) {
//        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
//            print("Nothing to search")
//            return
//        }
//        print(query)
//    }

//        filteredData = searchText.isEmpty ? resultsArr : resultsArr.filter { (item: String) -> Bool in
//            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
//        }
//        searchResultsTable.reloadData()
//
//    }
    
//    fileprivate func setupSearchBarListeners() {
//        let publisher = NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: searchBar.searchTextField)
//        publisher.map {
//            ($0.object as! UISearchTextField).text
//        }
//        .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
//        .sink { (searchText) in
//            self.getData("\(URLComponents())", parameters: ["app_id" : "\(key.edamamAppId)", "app_key" : "\(key.edamamApplicationKey)", "ingr" : "\(searchText)"]) {
//
//            }
//        }
//
//    }
    
    //API CALL
    fileprivate func getData(_ url: String, parameters: [String: String], completed: @escaping () -> ()) {

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
        task.resume()
            
    
    }


}
