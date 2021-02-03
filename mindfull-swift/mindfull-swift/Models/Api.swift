////
////  SearchForm.swift
////  mindfull-swift
////
////  Created by Emily Nagai on 1/30/21.
////
//
//import Foundation
//import SwiftUI
//import Keys
//
//private let keys = MindfullSwiftKeys()
//
////struct Nutrients: Decodable {
////    var name: String
////    var kcal: Int
////    var protein: String
////    var carbs: String
////    var fat: String
////    var label: String
////    var quantity: Int
////    var unit: String
////    
////    private enum CodingKeys: String, CodingKey {
////        case name = "text"
////        case kcal = "ENERC_KCAL"
////        case protein = "PROCNT"
////        case carbs = "CHOCDF"
////        case fat = "FAT"
////        case label = "label"
////        case quantity = "quantity"
////        case unit = "unit"
////    }
////        
////}
////
////struct Nutrition: Decodable {
////    var nutrients: [Nutrients]
////    
////    private enum CodingKeys: String, CodingKey {
////        case ingredients
////    }
////    
////    private enum CollectionCodingKeys: String, CodingKey {
////        case nutrients
////    }
////    
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        
////        let ingredients = try container.nestedContainer(keyedBy: CollectionCodingKeys.self, forKey: .ingredients)
////        
////        nutrients = try ingredients.decode([Nutrients].self, forKey: .nutrients)
////    }
////    
//////    func encode(to encoder: Encoder) throws {
//////        var container = encoder.container(keyedBy: CodingKeys.self)
//////
//////        var ingredients = container.nestedContainer(keyedBy: CollectionCodingKeys.self, forKey: .ingredients)
//////        try ingredients.encode(nutrients, forKey: .nutrients)
//////    }
////}
//struct FoodData: Decodable {
//    var ingredients: Ingredients
//}
//
//struct Ingredients: Decodable {
//    let name: String
//    let parsed: Parsed
//
//    private enum CodingKeys: String, CodingKey {
//        case name = "text"
//        case parsed = "parsed"
//
//    }
//}
//
//struct Parsed: Decodable {
//    let foodId: String
//    let nutrients: Nutrients
//
//}
//
//struct Nutrients: Decodable {
//    let kcal: Kcal
//    let carbs: Carbs
//    let protein: Protein
//    let fat: Fat
//
//    private enum CodingKeys: String, CodingKey {
//        case kcal = "ENERC_KCAL"
//        case carbs = "CHOCDF"
//        case protein = "PROCENT"
//        case fat = "FAT"
//    }
//}
//
//struct Kcal: Decodable {
//    let label: String
//    let quantity: Int
//    let unit: String
//}
//
//struct Carbs: Decodable {
//    let label: String
//    let quantity: Int
//    let unit: String
//}
//
//struct Protein: Decodable {
//    let label: String
//    let quantity: Int
//    let unit: String
//}
//
//struct Fat: Decodable {
//    let label: String
//    let quantity: Int
//    let unit: String
//}
//
//
//struct Food: View {
//
//    var body: some View {
//        Text("Food:")
//    }
//}
//
//struct Api: View {
////    var body: some View {
////        Form {
////            Text("Search")
////                .foregroundColor(Color("searchFontColor"))
////        }
////    }
//    @State var ingredients = [Ingredients]()
////    @Binding var text = String
//    
//    var body: some View {
//        let url = URL(string: "https://reqres.in/api/users")!
//        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//            guard let data = data else { return }
//            print(String(data: data, encoding: .utf8)!)
//
//        }.resume()
//
////        List(name, id: \.name) { item in
////            VStack(alignment: .leading) {
////                Text(item.name)
////                    .font(.headline)
////                //Why !? Come back to this. Not sure how to parse through JSON data..
////
////            }
////        }
////        .onAppear(perform: loadData)
//    }
// 
////    func loadData() {
////        let url = URL(string: "https://api.edamam.com/nutrition-data")
////
////        if let unwrappedURL = url {
////            var request = URLRequest(url: unwrappedURL)
////            request.addValue(keys.edamamApplicationKey, forHTTPHeaderField: "Edamam-App-key")
////            request.addValue(keys.edamamAppId, forHTTPHeaderField: "Edamam-App-ID")
////            request.addValue("1 cup cooked rice", forHTTPHeaderField: "Food-item")
////
////            URLSession.shared.dataTask(with: request) { data, response, error in
////                if let data = data {
////                    if let decodedResponse = try?
////                        JSONDecoder().decode(Nutrition.self, from: data) {
////                        DispatchQueue.main.async {
////                            self.nutrients = decodedResponse.nutrients
////                        }
////                        return
////                    }
////                }
////                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
////            }.resume()
////        }
////    }
//}
//
//
//
//struct Api_Previews: PreviewProvider {
//    static var previews: some View {
//        Api()
//    }
//}
