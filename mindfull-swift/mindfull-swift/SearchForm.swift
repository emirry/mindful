//
//  SearchForm.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 2/1/21.
//

import SwiftUI

struct SearchForm: View {
    let foods = ["tacos", "cheeseburger", "pizza"]
    @State private var searchText: String = ""
    
    var body: some View {

            NavigationView {
                VStack {
                    SearchBar(text: $searchText, placeHolder: "Search for food")
                    //Where do I add the Api.swift?
    
                List {
                    ForEach(self.foods.filter { self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased()) }, id: \.self) { food in
                        Text(food)
                    }
                }.navigationBarTitle(Text("What did you eat today?"))
            }
                
        }
            
    }
}

struct SearchForm_Previews: PreviewProvider {
    static var previews: some View {
        SearchForm()
    }
}
