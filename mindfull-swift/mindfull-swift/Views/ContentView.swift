//
//  ContentView.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 1/30/21.
//

import SwiftUI
import Keys

private let keys = MindfullSwiftKeys()

struct Response: Decodable {
//    var calories: [Calorie]
    var nutritionInfo: [NutritionInfo]
}

//struct Calorie: Codable {
//    var calories: Int
//}

struct NutritionInfo: Decodable {
    var ENERC_KCAL: String?
    var FAT: String?
    var CHOCDF: String?
    var PROCENT: String?
}


struct ContentView: View {
    @State var nutritionInfo = [NutritionInfo]()
    @State var ingr = String()
    
    var body: some View {
        List(nutritionInfo, id: \.ENERC_KCAL) { item in
            VStack(alignment: .leading) {
                Text(item.FAT!)
                    .font(.headline)
                
                Text(item.CHOCDF!)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        let url = URL(string: "https://api.edamam.com/nutrition-data")
        
        if let unwrappedURL = url {
            var request = URLRequest(url: unwrappedURL)
            request.addValue(keys.edamamApplicationKey, forHTTPHeaderField: "Edamam-App-key")
            request.addValue(keys.edamamAppId, forHTTPHeaderField: "Edamam-App-ID")
            request.addValue(ingr, forHTTPHeaderField: "Food-item")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let decodedResponse = try?
                        JSONDecoder().decode(Response.self, from: data) {
                        DispatchQueue.main.async {
                            self.nutritionInfo = decodedResponse.nutritionInfo
                        }
                        return
                    }
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }.resume()
            
        }
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let decodedResponse = try?
//                    JSONDecoder().decode(Response.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.data = decodedResponse.data
//                    }
//                    return
//                }
//            }
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
