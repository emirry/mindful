////
////  JournalViewController.swift
////  mindfull-front-end
////
////  Created by Emily Nagai on 2/3/21.
////
//
import UIKit
//
////NEED TO CHANGE TO JOURNALDETAILVIEWCONTROLLER
//
class JournalViewController: UIViewController {

    @IBOutlet weak var firstFoodItem: UILabel!
    @IBOutlet weak var secondFoodItem: UILabel!
    @IBOutlet weak var thirdFoodItem: UILabel!
    @IBOutlet weak var fourthFoodItem: UILabel!
    
    let shapeLayer = CAShapeLayer()


    //variable to hold food data
//    var foodDetail: FoodDetail!
//    var journalPages = JournalPages!
    //journal entries
//    var journalIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
            
        let center = view.center
        //track layer
        let trackLayer = CAShapeLayer()
        
        let circlePath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circlePath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)

        shapeLayer.path = circlePath.cgPath
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc private func handleTap() {
        print("animating")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 1.5
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "someString")
    }


    //built in segue function to be able to exit out of *soon to be search page through add button*
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let foodEntryToView = segue.destination as! FoodListViewController
//        foodEntryToView.journalPages = journalPages
//    }

//    @IBAction func unwindFromFoodDetailViewController(segue: UIStoryboardSegue) {
//        let source = segue.source as! FoodListViewController
//        foodProps = source.foodProps
//        foodProp = foodProps[source.selectedFoodIndex]
//        updateUserInterface()
//    }


}
