//
//  RepositoryDetailParam.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/17.
//

import Foundation

struct RepositoryDetailParam: QueryParameters {
    
    var owner: String
    var repo: String
    
    var queryParam: [String : String?] {
        var param: [String: String?] = [:]
        param.updateValue(self.owner, forKey: "owner")
        param.updateValue(self.repo, forKey: "repo")
        
        return param
    }
}
