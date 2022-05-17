//
//  DefaultRepoDetailRepository.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/17.
//

import Foundation
import RxSwift

final class DefaultRepoDetailRepository: RepoDetailRepository {
    
    let service = URLSessionService()
    
    func fetch(
           owner: String,
           repo: String
    ) -> Observable<RepoDetailItem> {
        let param = RepositoryDetailParam(owner: owner, repo: repo)
        let request = RepositoryDetailRequest(method: .GET, params: param, requestType: .path
        return self.service.requestRx(request: request).map { $0.toDomain() }
    }
}




