//
//  APIService.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/13.
//

import Foundation

final class URLSessionService {
    
    let session = URLSession.shared
    
    func request<T: APIRequest>(request: T,
        completion: @escaping (Result<T.ResponseType, NetworkError>) -> Void
    ) -> URLSessionDataTask? {
        
    }
}


enum NetworkError: Error {
    case pasingError
    case wrongReponse
    case errorExist
}
