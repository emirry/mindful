////
////  BackEndApiViewController.swift
////  mindfull-front-end
////
////  Created by Emily Nagai on 2/8/21.
////
//
//import UIKit
//
//class BackEndApiViewController: UIViewController, DatabaseApiDelegate {
//    
//    
//    //initiating DatabaseApi
//    var databaseApi = DatabaseApi()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //initiate calling the items download
//        databaseApi.getSavedData()
//        databaseApi.delegate = self
//
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    func itemsDownloaded(foods: [BackendData]) {
//    }
//
//}
