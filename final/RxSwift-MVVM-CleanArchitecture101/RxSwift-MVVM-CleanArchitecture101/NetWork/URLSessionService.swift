//
//  APIService.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/13.
//

import Foundation

final class URLSessionService {
    
    let session = URLSession.shared
    
    func request<T: APIRequest>(
        requestType: T,
        completion: @escaping (Result<T.ResponseType, NetworkError>) -> Void
    ) -> URLSessionDataTask? {
        
        guard let request = requestType.urlRequest else {
            completion(.failure(.invalidRequest))
            return nil
        }
        
        let task = self.session
            .dataTask(with: request) { data, response, error in
                guard error == nil else {
                    completion(.failure(.errorExist))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.wrongReponse))
                    return
                }
                
                guard (200...299) ~= httpResponse.statusCode else {
                    completion(.failure(.statusError(code: httpResponse.statusCode)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                guard let parsed = try? JSONDecoder().decode(T.ResponseType.self, from: data) else {
                    completion(.failure(.pasingError))
                    return
                }
                
                completion(.success(parsed))
            }
            
        task.resume()
        
        return task
    }
}

enum NetworkError: Error {
    case pasingError
    case wrongReponse
    case errorExist
    case invalidRequest
    case invalidData
    case statusError(code: Int)
}
