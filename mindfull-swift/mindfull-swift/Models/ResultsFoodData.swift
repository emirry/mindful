//
//  ResultsFoodData.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 2/1/21.
//

import Foundation
import SwiftUI
import Combine

struct ResultsFoodData: BindableObject {
    var didChange = PassthroughSubject<ResultsFoodData, Never>()
    
    var foodItems = foodItemData {
        didSet {
            didChange.send(self)
        }
    }
}
