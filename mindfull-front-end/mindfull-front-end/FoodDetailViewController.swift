//
//  FoodDetailViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/3/21.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var firstFoodItem: UILabel!
    @IBOutlet weak var secondFoodItem: UILabel!
    @IBOutlet weak var thirdFoodItem: UILabel!
    @IBOutlet weak var fourthFoodItem: UILabel!
    
    
    //variable to hold food data
    var foodProp: FoodData!
    //Array to hold each food item info
    var foodProps: [FoodData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //checking if there's any data in foodProps. if it's empty, display current food item
        if foodProp == nil {
            foodProp = FoodData(name: "Current food item", calories: 0)
            foodProps.append(foodProp)
        }
        
        updateUserInterface()

    }
    
    func updateUserInterface() {
        //Change later with data
        firstFoodItem.text = ""
        secondFoodItem.text = ""
        thirdFoodItem.text = ""
        fourthFoodItem.text = ""
        
        //calling data here 
        foodProp.getData()

    }
    
    //built in
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let foodToSearch = segue.destination as! FoodListViewController
        foodToSearch.foodProps = foodProps
    }
    
    @IBAction func unwindFromFoodDetailViewController(segue: UIStoryboardSegue) {
        let source = segue.source as! FoodListViewController
        foodProps = source.foodProps
        foodProp = foodProps[source.selectedFoodIndex]
        updateUserInterface()
    }


}
