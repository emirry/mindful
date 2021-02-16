//
//  NutritionDetailViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/5/21.
//

import UIKit
import Keys

private let key = MindfullFrontEndKeys()

class NutritionDetailViewController: UIViewController {

    @IBOutlet weak var nutritionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    

//    var foodData: FoodListViewController!
    var food: BackendData!
    //holds a list of saved food items
    var foods: [BackendData] = []
    var backendData: BackendData?
        //nutrition pages
    var nutritionPageIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 246/225.0, green: 141/225.0, blue: 95/225.0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Thasadith-Regular", size: 20)!]
        
        updateUserInterface()
        
    }
    
    func updateUserInterface() {
//        let nutritionPageViewController = UIApplication.shared.windows.first!.rootViewController as!  NutritionPageViewController
//        _ = nutritionPageViewController.food[nutritionPageIndex]

        
        if let foodData = self.backendData {
        
                   //Change later with data
            self.nutritionLabel.text = foodData.food_entries[0].name
            self.caloriesLabel.text = "\(foodData.food_entries[0].calories)"
            print("HERE: \(foodData.food_entries[0].name)")
            self.fatLabel.text = "\(foodData.food_entries[0].fat.rounded())"
            self.carbsLabel.text = "\(foodData.food_entries[0].carbs.rounded())"
            self.proteinLabel.text = "\(foodData.food_entries[0].protein.rounded())"
        }
       }
   
       //built in segue function to be able to exit out of *soon to be search page through add button*
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let foodToSearch = segue.destination as! FoodListViewController
        let nutritionPageViewController = UIApplication.shared.windows.first!.rootViewController as!  NutritionPageViewController
        foodToSearch.savedFoodsArray = nutritionPageViewController.food
       }

       @IBAction func unwindFromFoodListViewController(segue: UIStoryboardSegue) {
           let source = segue.source as! FoodListViewController
           nutritionPageIndex = source.selectedSavedFoodIndex
//        foods = source.savedFoodsArray
//        food = foods[source.selectedSavedFoodIndex]
//        updateUserInterface()
//
            let nutritionPageViewController = UIApplication.shared.windows.first!.rootViewController as!  NutritionPageViewController

            nutritionPageViewController.food = source.savedFoodsArray
            nutritionPageViewController.setViewControllers([nutritionPageViewController.createNutritionDetailViewController(forPage: nutritionPageIndex)], direction: .forward, animated: false, completion: nil)
       }
   
    @IBAction func backButtonPresssed(_ sender: UIBarButtonItem) {
    }
}

