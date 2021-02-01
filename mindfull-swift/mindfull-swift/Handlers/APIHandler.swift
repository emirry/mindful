//
//  ViewModel.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 1/30/21.
//

import Foundation
import Combine
import Alamofire

class APIHandler {
    
    var statusCode = Int.zero
    
    func handleResponse<T: Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
        switch response.result {
        case .success:
            return response.value
        case .failure:
            return nil
        }
    }
    
}
