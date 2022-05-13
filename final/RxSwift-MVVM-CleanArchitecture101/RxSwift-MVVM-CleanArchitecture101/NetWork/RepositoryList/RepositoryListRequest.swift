//
//  RepositoryListRequest.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/13.
//

import Foundation

struct RepositoryListRequest: APIRequest {
    
    typealias ResponseType = Welcome
    
    var method: HTTPMethod
    var header: QueryParameters
    var urlString: String
}
