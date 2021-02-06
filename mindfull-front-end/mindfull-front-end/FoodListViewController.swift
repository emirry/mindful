//
//  FoodListViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/3/21.
//

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addEditButton: UIToolbar!
    @IBOutlet weak var addBarbutton: UIBarButtonItem!
    
    var food: [FoodDetail] = []
    var selectedFoodIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.navigationController?.navigationBar.isHidden = true

        //hardcoded data
//        var foodProp = FoodDetail(text: "1 cup cooked rice", calories: 350)
//        food.append(foodProp)
//        food = FoodDetail(text: "4oz. baked salmon", calories: 300)
//        food.append(foodProp)
//        foodProp = FoodDetail(text: "8oz. cup coffee", calories: 540)
//        food.append(foodProp)
        
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        selectedFoodIndex = tableView.indexPathForSelectedRow!.row
////        saveFoodItems()
//    }

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
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String("\(food[indexPath.row].name)")
        cell.detailTextLabel?.text = "Calories:\(food[indexPath.row].calories)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            food.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //saveData()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = food[sourceIndexPath.row]
        food.remove(at: sourceIndexPath.row)
        food.insert(itemToMove, at: destinationIndexPath.row)
        //saveData()
    }

}


