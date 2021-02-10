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
    

    var foodData: FoodListViewController!
    var food: BackendData!
    //holds a list of saved food items
    var foods: [BackendData] = []
    
        //nutrition pages
    var nutritionPageIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if food == nil {
//            food = BackendData(name: "current food", calories: 0, fat: 0.0, carbs: 0.0, protein: 0.0)
//            foods.append(food)
//        }
        
        updateUserInterface()
        
    }
    
    func updateUserInterface() {
        let nutritionPageViewController = UIApplication.shared.windows.first!.rootViewController as!  NutritionPageViewController
//        _ = nutritionPageViewController.food[nutritionPageIndex]
   
           //Need to edit this later once i can scroll to different nutrition info entries
//        foodData = FoodDetail()
        foodData = FoodListViewController()
   
           //calling data here
        foodData.getSavedData()
//        print(foodData.getSavedData())
    
           DispatchQueue.main.async {

                   //Change later with data
                self.nutritionLabel.text = self.foodData.name
                self.caloriesLabel.text = "\(self.foodData.calories)"
//            print("\(self.foodData.calories)")
                self.fatLabel.text = "\(self.foodData.fat)"
                self.carbsLabel.text = "\(self.foodData.carbs)"
                self.proteinLabel.text = "\(self.foodData.protein)"
            }
       }
   
       //built in segue function to be able to exit out of *soon to be search page through add button*
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let foodToSearch = segue.destination as! FoodListViewController
        let nutritionPageViewController = UIApplication.shared.windows.first!.rootViewController as!  NutritionPageViewController
        foodToSearch.savedFoodArray = nutritionPageViewController.food
       }

       @IBAction func unwindFromFoodListViewController(segue: UIStoryboardSegue) {
           let source = segue.source as! FoodListViewController
//           nutritionPageIndex = source.selectedSavedFoodIndex
        foods = source.savedFoodArray
        food = foods[source.selectedSavedFoodIndex]
        updateUserInterface()
//
//            let nutritionPageViewController = UIApplication.shared.windows.first!.rootViewController as!  NutritionPageViewController
//
//            nutritionPageViewController.food = source.food
//            nutritionPageViewController.setViewControllers([nutritionPageViewController.createNutritionDetailViewController(forPage: nutritionPageIndex)], direction: .forward, animated: false, completion: nil)
       }
   
   }

