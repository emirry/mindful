//
//  NutritionDetailViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/4/21.
//

import UIKit

class NutritionDetailViewController: UIViewController {

    @IBOutlet weak var nutritionTitle: UILabel!
    @IBOutlet weak var calorieInfo: UILabel!
    @IBOutlet weak var proteinInfo: UILabel!
    @IBOutlet weak var carbInfo: UILabel!
    @IBOutlet weak var fatInfo: UILabel!

    
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
//        let foodProp = nutritionPageViewController.foodProps[nutritionPageIndex]
//        print("foodProp: \(String(describing: foodProp))")
        
        //Need to edit this later once i can scroll to different nutrition info entries
        foodDetail = FoodDetail(name: "Update", calories: 0)
    
        
        //calling data here
        foodDetail.getData {
            DispatchQueue.main.async {
                //Change later with data
                self.nutritionTitle.text = self.foodDetail.text
                self.calorieInfo.text = "\(self.foodDetail.calories)"
                self.carbInfo.text = ""
                self.fatInfo.text = ""
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
