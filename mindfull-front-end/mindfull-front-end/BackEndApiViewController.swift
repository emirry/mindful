//
//  BackEndApiViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/8/21.
//

import UIKit

class BackEndApiViewController: UIViewController, DatabaseApiDelegate {
    
    @IBOutlet weak var apiTableView: UITableView!
    
    //initiating DatabaseApi
    var databaseApi = DatabaseApi()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initiate calling the items download
        databaseApi.getSavedData()
        databaseApi.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func itemsDownloaded(foods: [BackendData]) {
        print("anything?")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
