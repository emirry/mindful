//
//  NutritionPageViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/4/21.
//

import UIKit

class NutritionPageViewController: UIPageViewController {
    
    let dataBaseApi = DatabaseApi()
    //Array to hold each food item info
    var food: [BackendData] = []
//    var nutritionPageIndex = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This code says that handles the page view controller lives here
        self.delegate = self
        self.dataSource = self
        
        loadFoodItems()
        setViewControllers([createNutritionDetailViewController(forPage: 0)], direction: .forward, animated: false, completion: nil)
        
    }
    
    //READ IN SAVED FOOD ITEMS HERE:
    func loadFoodItems() {
        dataBaseApi.getSavedData()
        food = dataBaseApi.savedFoodArray
        
//        guard let foodItemsEncoded = UserDefaults.standard.value(forKey: "food")
//            as? Data else {
//
//            print("Warning!")
//            //TODO: get current food for the first element in foodProps
//
//            food.append(FoodDetail())
//            return
//        }
//        let decoder = JSONDecoder()
//        if let food = try? decoder.decode(Array.self, from: foodItemsEncoded) as
//            [FoodDetail] {
//            self.food = food
//            print(food)
//        } else {
//            print("Error: Couldn't decode data read from UserDefaults")
//        }
//
//        if food.isEmpty {
//            //TODO: get current food for the first element in foodProps
//            food.append(FoodDetail())
//            return
//
//        }
    }
    
    //creating an instance of food item?
    //own function
    func createNutritionDetailViewController(forPage page: Int) -> NutritionDetailViewController {
        let detailViewController = storyboard!.instantiateViewController(identifier: "NutritionDetailViewController") as! NutritionDetailViewController
        detailViewController.nutritionPageIndex = page
        return detailViewController
    }

}

//This code goes with delegate and datasource
extension NutritionPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    //iOS methods:
    //on current page, if it's the first page, cannot move to the page before. if there is a page, swipe to previous page
    //viewController is what's getting passed in
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            if let currentViewController = viewController as? NutritionDetailViewController {
                if currentViewController.nutritionPageIndex > 0 {
                    return createNutritionDetailViewController(forPage: currentViewController.nutritionPageIndex - 1)
                }
            }
            return nil
    }
    
    //this function handles the swiping to look at next page
    //on the current page, if it's less than the last journal entry, go to the next page or reach the end
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            if let currentViewController = viewController as? NutritionDetailViewController {
                if currentViewController.nutritionPageIndex < food.count - 1 {
                    return createNutritionDetailViewController(forPage: currentViewController.nutritionPageIndex + 1)
                }
            }
            return nil
        }
    
    }

    
