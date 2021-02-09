//
//  FoodListViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/3/21.
//

import UIKit

class FoodListViewController: UIViewController {
    var foods: [BackendData] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addEditButton: UIToolbar!
    @IBOutlet weak var addBarbutton: UIBarButtonItem!
    
    var newFoodData: FoodSearchBarViewController!
    var food: [BackendData] = []
//    var selectedFoodIndex = 0
    var selectedSavedFoodIndex = 0
    
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
//        tableView.tableHeaderView = foodSearchBar
    }
    
//    TO SAVE DATA in UserDefaults
//    func saveFoodItems() {
//      let encoder = JSONEncoder()
//      if let encoded = try? encoder.encode(foodProps) {
//          UserDefaults.standard.set(encoded, forKey: "foodProps")
//      } else {
//        print("Erro: Saving encoded didn't work")
//      }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        selectedSavedFoodIndex = tableView.indexPathForSelectedRow!.row
//        saveFoodItems()
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
    
}

extension FoodListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String("\(foods[indexPath.row].name)")
        cell.detailTextLabel?.text = "Calories:\(foods[indexPath.row].calories)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            foods.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //saveData()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = foods[sourceIndexPath.row]
        foods.remove(at: sourceIndexPath.row)
        foods.insert(itemToMove, at: destinationIndexPath.row)
        //saveData()
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


