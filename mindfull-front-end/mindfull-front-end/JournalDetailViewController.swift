////
////  FoodDetailViewController.swift
////  mindfull-front-end
////
////  Created by Emily Nagai on 2/3/21.
////
//
//import UIKit
//
//NEED TO CHANGE TO JOURNALDETAILVIEWCONTROLLER 

//class FoodDetailViewController: UIViewController {
//
//    @IBOutlet weak var firstFoodItem: UILabel!
//    @IBOutlet weak var secondFoodItem: UILabel!
//    @IBOutlet weak var thirdFoodItem: UILabel!
//    @IBOutlet weak var fourthFoodItem: UILabel!
//
//
//    //variable to hold food data
//    var foodDetail: FoodDetail!
//
//    //journal entries
//    var journalIndex = 0
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //checking if there's any data in foodProps. if it's empty, display current food item
////        if foodProp == nil {
////            foodProp = FoodData(name: "Current food item", calories: 0)
////            foodProps.append(foodProp)
////        }
//        updateUserInterface()
//    }
//
//    func updateUserInterface() {
//        //Need to edit this later once i can scroll to different journal entries
//        foodDetail = FoodDetail(name: "Update", calories: 0)
//
//        //Change later with data
//        firstFoodItem.text = ""
//        secondFoodItem.text = ""
//        thirdFoodItem.text = ""
//        fourthFoodItem.text = ""
//
//        //calling data here
//        foodDetail.getData()
//    }
//
//    //built in segue function to be able to exit out of *soon to be search page through add button*
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let foodToSearch = segue.destination as! FoodListViewController
//        foodToSearch.foodProps = foodProps
//    }
//
//    @IBAction func unwindFromFoodDetailViewController(segue: UIStoryboardSegue) {
//        let source = segue.source as! FoodListViewController
//        foodProps = source.foodProps
//        foodProp = foodProps[source.selectedFoodIndex]
//        updateUserInterface()
//    }
//
//
//}
