//
//  SearchForm.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 1/30/21.
//

import Foundation
import SwiftUI

struct SearchForm: View {

    
    var body: some View {
        Form {
            Text("Search")
                .foregroundColor(Color("searchFontColor"))
        }
    }
}




struct SearchFrom_Previews: PreviewProvider {
    static var previews: some View {
        SearchForm()
    }
}
