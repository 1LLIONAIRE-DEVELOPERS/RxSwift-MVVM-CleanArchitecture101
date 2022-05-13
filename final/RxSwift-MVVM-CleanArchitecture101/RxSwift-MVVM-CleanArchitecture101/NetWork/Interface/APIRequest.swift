//
//  APIRequest.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/13.
//

import Foundation

protocol APIRequest {
    
    associatedtype ResponseType: Decodable
    
    var method: HTTPMethod { get }
    var header: QueryParameters { get }
    var urlString: String { get }
}

extension APIRequest {
    
    var url: URL? {
        
        return URL(string: self.urlString)
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        self.header.queryParam.forEach { request.addValue($1 as String, forHTTPHeaderField: $0)}
        
        return request
    }
}

enum HTTPMethod: String {
    case GET,POST,PATCH,DELETE
}
