//
//  RepositoryParams.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/13.
//

import Foundation

struct RepositoryParams: QueryParameters {
    
    var searchName: String
    var sortType: RepoItemQuerySortType?
    var order: Bool
    var per_page: Int
    var page: Int
    
    var queryParam: [String: String?] {
        var dictionary: [String: String?] = [:]
        let q = self.searchName
        let sort = self.sortType?.urlParam
        let order = self.order ? "dsc" : "asc"
        let per_page = self.per_page.description
        let page = self.page.description
        
        dictionary.updateValue(q, forKey: "q")
        dictionary.updateValue(sort, forKey: "sort")
        dictionary.updateValue(order, forKey: "order")
        dictionary.updateValue(per_page, forKey: "per_page")
        dictionary.updateValue(page, forKey: "page")
        
        return dictionary
    }
}


enum SortType: String {
    case stars
    case forks
    case updated
}

enum OrderType: String {
    case desc, asc 
}
