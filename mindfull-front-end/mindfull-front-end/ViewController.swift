//
//  ViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/3/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var foodProps: [FoodData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var foodProp = FoodData(calories: 205)
        foodProps.append(foodProp)
        foodProp = FoodData(calories: 300)
        foodProps.append(foodProp)
        foodProp = FoodData(calories: 540)
        foodProps.append(foodProp)
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodProps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String("\(foodProps[indexPath.row].calories)")
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
