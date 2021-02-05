//
//  JournalPageViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/4/21.
//

import UIKit

class NutritionPageViewController: UIPageViewController {
    
    //Array to hold each food item info
    //initializing empty foodProps array
    var foodProps: [FoodData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This code says that handles the page view controller lives here
        self.delegate = self
        self.dataSource = self
        
        setViewControllers([createFoodDetailViewController(forPage: 0)], direction: .forward, animated: false, completion: nil)
        
    }
    
    //creating an instance of food item?
    //own function
    func createFoodDetailViewController(forPage page: Int) -> NutritionDetailViewController {
        let detailViewController = storyboard!.instantiateViewController(identifier: "FoodDetailViewController") as! NutritionDetailViewController
        detailViewController.nutritionPageIndex = page
        return detailViewController
    }

}

//This code goes with delegate and datasource
extension JournalPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    //iOS methods:
    //on current page, if it's the first page, cannot move to the page before. if there is a page, swipe to previous page
    //viewController is what's getting passed in
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            if let currentViewController = viewController as? NutritionDetailViewController {
                if currentViewController.nutritionPageIndex > 0 {
                    return createFoodDetailViewController(forPage: currentViewController.nutritionPageIndex - 1)
                }
            }
            return nil
    }
    
    //this function handles the swiping to look at next page
    //on the current page, if it's less than the last journal entry, go to the next page or reach the end
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            if let currentViewController = viewController as? NutritionDetailViewController {
                if currentViewController.nutritionPageIndex < foodProps.count - 1 {
                    return createFoodDetailViewController(forPage: currentViewController.nutritionPageIndex + 1)
                }
            }
            return nil
        }
    
    }

    
