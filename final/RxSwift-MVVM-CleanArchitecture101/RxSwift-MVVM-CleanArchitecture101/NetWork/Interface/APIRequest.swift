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
    var params: QueryParameters { get }
    var urlString: String { get }
}

extension APIRequest {
    
    var url: URL? {
        
        return URL(string: self.urlString)
    }
    
    var urlRequest: URLRequest? {
       
        var urlComponents = URLComponents(string: self.urlString)
        let urlQueries = self.params.queryParam.map { URLQueryItem(name: $0.key, value: $0.value)}
        
        urlComponents?.queryItems = urlQueries
        let url = urlComponents?.url
        var request = URLRequest(url: url!)
        request.httpMethod = self.method.rawValue
        
        return request
    }
}

enum HTTPMethod: String {
    case GET,POST,PATCH,DELETE
}
