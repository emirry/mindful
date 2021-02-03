//
//  ContentView.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 1/30/21.
//

import SwiftUI

//struct EnergyObj: Decodable {
//    var label: String
//    var quantity: Int
//    var unit: String
//}
//struct NutrientsObj: Decodable {
//    var ENERC_KCAL: EnergyObj
//}
//
//struct ParsedArray: Decodable, Identifiable {
//    let id: String
//    var nutrients: NutrientsObj
//    
//    private enum CodingKeys: String, CodingKey {
//        case id = "foodId"
//        case nutrients = "nutrients"
//    }
//}
//
//struct Ingredients: Decodable {
//    var text: String
//    var measure: String
//    var parsed: [ParsedArray]
//}
//
//
//struct Response: Decodable {
//    var ingredients: [Ingredients]
//}



struct ContentView: View {
    @State private var ingredientsObj = [Ingredients]()
//    @ObservedObject var fetchData =
//    @State var searchString = String()


    var body: some View {
        List(ingredientsObj, id: \.text) { response in
            VStack(alignment: .leading) {
                Text(response.text)
//                Spacer()
//                Text(response.measure)
//                Spacer()
//                Text(response.parsed[0].nutrients.ENERC_KCAL.label)
                    .font(.headline)
            }
        }
        .onAppear(perform: loadData)

    }
    
    func loadData() {
        //guard is saying that this is not an emtpy string, if it is, print "invalid URL"
        guard let url = URL(string: "https://api.mocki.io/v1/8aff7ed9") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    print(decodedResponse)
                    DispatchQueue.main.async {
                        // update our UI
                        self.ingredientsObj = decodedResponse.ingredients
//
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error)")
        }.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
