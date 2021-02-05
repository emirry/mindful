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
    
    var foodProps: [FoodData] = []
    var selectedFoodIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false

        //hardcoded data
        var foodProp = FoodData(text: "1 cup cooked rice", calories: 350)
        foodProps.append(foodProp)
        foodProp = FoodData(text: "4oz. baked salmon", calories: 300)
        foodProps.append(foodProp)
        foodProp = FoodData(text: "8oz. cup coffee", calories: 540)
        foodProps.append(foodProp)
        
        tableView.dataSource = self
        tableView.delegate = self
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
        selectedFoodIndex = tableView.indexPathForSelectedRow!.row
//        saveFoodItems()
    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        //connect search bar page here?
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
        return foodProps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String("\(foodProps[indexPath.row].text)")
        cell.detailTextLabel?.text = "Calories:\(foodProps[indexPath.row].calories)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            foodProps.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //saveData()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = foodProps[sourceIndexPath.row]
        foodProps.remove(at: sourceIndexPath.row)
        foodProps.insert(itemToMove, at: destinationIndexPath.row)
        //saveData()
    }

}


