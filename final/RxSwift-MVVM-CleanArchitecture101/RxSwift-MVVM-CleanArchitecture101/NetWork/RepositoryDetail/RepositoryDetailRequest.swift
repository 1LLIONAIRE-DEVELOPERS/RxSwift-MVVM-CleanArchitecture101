//
//  RepositoryDetailRequest.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/17.
//

import Foundation

struct RepositoryDetailRequest: APIRequest {
    
    typealias ResponseType = Repository
    
    var method: HTTPMethod
    var params: QueryParameters
    var urlString =  "https://api.github.com/repos"
    var requestType: RequestType
}
