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
    
        //variable to hold food data
        var foodDetail: FoodDetail!
    
        //nutrition pages
        var nutritionPageIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()
    }
    
    func updateUserInterface() {
           let nutritionPageViewController = UIApplication.shared.windows.first!.rootViewController as!
               NutritionPageViewController
//           let foodProp = nutritionPageViewController.foodProps[nutritionPageIndex]
//           print("foodProp: \(String(describing: foodProp))")
   
           //Need to edit this later once i can scroll to different nutrition info entries
           foodDetail = FoodDetail(text: "alga", calories: 0)
   
           //calling data here
        foodDetail.getData("\(URLComponents())", parameters: ["app_id" : "\(key.edamamAppId)", "app_key" : "\(key.edamamApplicationKey)", "ingr" : "1 cup cooked rice"]) {
               DispatchQueue.main.async {
   
                   //Change later with data
                   self.nutritionLabel.text = self.foodDetail.name
                   self.caloriesLabel.text = "\(self.foodDetail.calories)"
                   self.fatLabel.text = self.foodDetail.fatLabel
                   self.carbsLabel.text = self.foodDetail.carbLabel
                   self.proteinLabel.text = self.foodDetail.proteinLabel
               }
           }
       }
   
       //built in segue function to be able to exit out of *soon to be search page through add button*
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let foodToSearch = segue.destination as! FoodListViewController
           let nutritionPageViewController = UIApplication.shared.windows.first!.rootViewController as! NutritionPageViewController
           foodToSearch.foodProps = nutritionPageViewController.foodProps
       }
   
       @IBAction func unwindFromFoodDetailViewController(segue: UIStoryboardSegue) {
           let source = segue.source as! FoodListViewController
           nutritionPageIndex = source.selectedFoodIndex
   
           let nutritionPageViewController = UIApplication.shared.windows.first!.rootViewController as! NutritionPageViewController
   
           nutritionPageViewController.foodProps = source.foodProps
           nutritionPageViewController.setViewControllers([nutritionPageViewController.createNutritionDetailViewController(forPage: nutritionPageIndex)], direction: .forward, animated: false, completion: nil)
       }
   
   
   }

