//
//  ContentView.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 1/30/21.
//

import SwiftUI


struct Response: Codable {
    var ingredients: [Ingredients]
}

struct Ingredients: Codable {
    var text: String
}

struct ContentView: View {
    @State private var ingredients = [Ingredients]()


    var body: some View {
        List(ingredients, id: \.text) { item in
            VStack(alignment: .leading) {
                Text(item.text)
                    .font(.headline)
//                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)

    }
    
    func loadData() {
        guard let url = URL(string: "https://api.edamam.com/api/nutrition-data?app_id=bd6a05e8&app_key=a2e67c21cf15d4af86bea5f0b20836c5&ingr=1%20cup%20cookedrice") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.ingredients = decodedResponse.ingredients
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
