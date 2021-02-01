//
//  searchHandler.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 1/30/21.
//

import Foundation
import Combine
import Alamofire

class SearchHandler: APIHandler {
    @Published var searchResponse: SearchResponse?
    @Published var isLoading = false
    
    func getResults() {
        let url = "https://api.themoviedb.org/3"
        
        AF.request(url, method: get).responseDecodable { [weak self] (response: DataResponse<SearchResponse, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? SearchResponse else {
                weakSelf.isLoading = false
                return
            }
            
            weakSelf.isLoading = false
            weakSelf.searchResponse = response
        }
    }
}
