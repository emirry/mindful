//
//  FoodListViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/3/21.
//

import UIKit

class FoodListViewController: UIViewController {
//    var foods: [BackendData] = []
//    var foods = [BackendData]()
    
    var savedFoodsArray = [BackendData]()

//    var savedFoods: [DatabaseApi] = []
    var selectedSavedFoodIndex = 0
//    var databaseApi = DatabaseApi()
    
    var savedFoodIndex = 0
    var name = ""
    var calories = 0
    var fat = 0.0
    var carbs = 0.0
    var protein = 0.0

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addEditButton: UIToolbar!
    @IBOutlet weak var addBarbutton: UIBarButtonItem!
//    
//    var newFoodData: BackendData!
//    var food: [BackendData] = []
//    var selectedFoodIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.navigationController?.navigationBar.isHidden = true

//        hardcoded data
//        var food = BackendData(name: "Test", calories: 0, fat: 0.0, carbs: 0.0, protein: 0.0)
//        foods.append(food)
//        food = BackendData(name: "Test2", calories: 0, fat: 0.0, carbs: 0.0, protein: 0.0)
//        foods.append(food)
//        food = BackendData(name: "Test", calories: 0, fat: 0.0, carbs: 0.0, protein: 0.0)
//        foods.append(food)
        tableView.dataSource = self
        tableView.delegate = self
        self.getSavedData()
//        tableView.tableHeaderView = foodSearchBar
    }
        
    func loadSavedData() {
        self.getSavedData()
        tableView.reloadData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Detail" {
            selectedSavedFoodIndex = tableView.indexPathForSelectedRow!.row
            var nutritionDetailViewController = segue.destination as! NutritionDetailViewController
            let backendData = savedFoodsArray[selectedSavedFoodIndex]
            nutritionDetailViewController.backendData = backendData
        }
        else if segue.identifier == "Search" {
            
        }

    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let indexPath = IndexPath(item: 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    

    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
            sender.title = "Edit"
            addBarbutton.isEnabled = true
        } else {
            tableView.setEditing(true, animated: true)
            sender.title = "Done"
            addBarbutton.isEnabled = false
        }
    }
    
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
                    let result = try jsonDecoder.decode([BackendData].self, from: data)
                    for item in result {
                        self.name = item.food_log_item.name
                        self.calories = item.food_log_item.calories
                        print(self.name)
                        print(self.calories)
                        self.savedFoodsArray.append(item)
//                        self.savedFoodsArray.append(BackendData(food_log_item: FoodInfo(name: item.food_log_item.name, calories: item.food_log_item.calories, fat: item.food_log_item.fat, protein: item.food_log_item.protein, carbs: item.food_log_item.carbs)))

//                    print(self.savedFoodArray)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch {
                    print("\(error.localizedDescription)")
                }
//                delegate?.itemsDownloaded(foods: savedFoodArray)

            }
            task.resume()
        }
}

extension FoodListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(savedFoodsArray)

        return savedFoodsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = savedFoodsArray[indexPath.row].food_log_item.name
        cell.detailTextLabel?.text = "Calories:\(savedFoodsArray[indexPath.row].food_log_item.calories)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            savedFoodsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //call delete func?
            //tableView.reload()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = savedFoodsArray[sourceIndexPath.row]
        savedFoodsArray.remove(at: sourceIndexPath.row)
        savedFoodsArray.insert(itemToMove, at: destinationIndexPath.row)

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let foodToSearch = segue.destination as!
//            FoodSearchBarViewController
//        let foodPageViewController = UIApplication.shared.windows.first!.rootViewController as! FoodPageViewController
//        foodToSearch.resultsArr = foodPageViewController.savedFood
//
//    }
//
//   @IBAction func unwindFromFoodSearchBarViewController(segue: UIStoryboardSegue) {
//       let source = segue.source as! FoodSearchBarViewController
//        savedFoodIndex = source.selectedFoodIndex
//
//       let foodListViewController = UIApplication.shared.windows.first!.rootViewController as! FoodListViewController
//
//    foodPageViewController.savedFood = source.savedFood
//    foodPageViewController.setViewControllers([foodListViewController.createFoodListViewController(forPage: savedFoodIndex)], direction: .forward, animated: false, completion: nil)
//   }

}


