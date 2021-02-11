//
//  FoodListViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/3/21.
//

import UIKit

class FoodListViewController: UIViewController {
//    var foods: [BackendData] = []
//    var foods = [BackendData]()
    
    var savedFoodsArray = [BackendData]()

//    var savedFoods: [DatabaseApi] = []
    var selectedSavedFoodIndex = 0
//    var databaseApi = DatabaseApi()
    
    var savedFoodIndex = 0
    var name = ""
    var calories = 0
    var fat = 0.0
    var carbs = 0.0
    var protein = 0.0

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addEditButton: UIToolbar!
    @IBOutlet weak var addBarbutton: UIBarButtonItem!
//    
//    var newFoodData: BackendData!
//    var food: [BackendData] = []
//    var selectedFoodIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.navigationController?.navigationBar.isHidden = true

//        hardcoded data
//        var food = BackendData(name: "Test", calories: 0, fat: 0.0, carbs: 0.0, protein: 0.0)
//        foods.append(food)
//        food = BackendData(name: "Test2", calories: 0, fat: 0.0, carbs: 0.0, protein: 0.0)
//        foods.append(food)
//        food = BackendData(name: "Test", calories: 0, fat: 0.0, carbs: 0.0, protein: 0.0)
//        foods.append(food)
        tableView.dataSource = self
        tableView.delegate = self
        self.getSavedData()
//        tableView.tableHeaderView = foodSearchBar
    }
        
    func loadSavedData() {
        self.getSavedData()
        tableView.reloadData()

    }
    


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let indexPath = IndexPath(item: 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    

    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
            sender.title = "Edit"
            addBarbutton.isEnabled = true
        } else {
            tableView.setEditing(true, animated: true)
            sender.title = "Done"
            addBarbutton.isEnabled = false
        }
    }
    
    func getSavedData() {
        //Hit the backend api URL
        let apiURL = "http://127.0.0.1:8000/foodjournal/"
        print(apiURL)
        //download json data
        guard let url = URL(string: apiURL) else {
            print("Could not create URL")
            return
        }
            //checking that url is no nil
//            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                let jsonDecoder = JSONDecoder()

                if let error = error {
                    print("\(error.localizedDescription)")
                    return
                }
//                else {
//                    self.parseJson(data!)
//                }
                guard let data = data else {
                    print("data was nil")
                    return
                }
                do {
                    let result = try jsonDecoder.decode([BackendData].self, from: data)
                    for item in result {
                        self.name = item.journal_items[0].name
                        self.calories = item.journal_items[0].calories
                        print(self.name)
                        print(self.calories)
                        self.savedFoodsArray.append(item)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch DecodingError.keyNotFound(let key, let context) {
                                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
                            } catch DecodingError.valueNotFound(let type, let context) {
                                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
                            } catch DecodingError.typeMismatch(let type, let context) {
                                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                            } catch DecodingError.dataCorrupted(let context) {
                                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
                            } catch let error as NSError {
                            }
                catch {
                    print("\(error.localizedDescription)")
                }
//                delegate?.itemsDownloaded(foods: savedFoodArray)

            }
            task.resume()
        }
}

extension FoodListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(savedFoodsArray)

        return savedFoodsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = savedFoodsArray[indexPath.row].journal_items[0].name
        cell.detailTextLabel?.text = "Calories:\(savedFoodsArray[indexPath.row].journal_items[0].calories)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            savedFoodsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //call delete func?
            //tableView.reload()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = savedFoodsArray[sourceIndexPath.row]
        savedFoodsArray.remove(at: sourceIndexPath.row)
        savedFoodsArray.insert(itemToMove, at: destinationIndexPath.row)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Detail" {
            selectedSavedFoodIndex = tableView.indexPathForSelectedRow!.row
            var nutritionDetailViewController = segue.destination as! NutritionDetailViewController
            let backendData = savedFoodsArray[selectedSavedFoodIndex]
            nutritionDetailViewController.backendData = backendData
        }
        else if segue.identifier == "Search" {
            
        }

    }

}


