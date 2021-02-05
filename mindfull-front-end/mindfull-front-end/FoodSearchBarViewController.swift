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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //API call?
//        if searchText.characters.count == 0 {
//            isSearch = false
//            self.searchResultsTable.reloadData()
//        } else {
//            resultsArr
//        }
        filteredData = searchText.isEmpty ? resultsArr : resultsArr.filter { (item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        searchResultsTable.reloadData()

    }

//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        isSearch = false
//    }
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//        isSearch = true
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//        isSearch = false
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//        isSearch = false
//    }
    

}
