//
//  DefaultRepoItemRepository.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/13.
//

import Foundation
import RxSwift

final class DefaultRepoItemRepository {
    
    let service: URLSessionService
    
    init(service: URLSessionService) {
        self.service = service
    }
    
    func fetch(
        query: String,
        sortBy: SortType,
        isDescending: OrderType,
        itemsPerPage: Int,
        pageNumber: Int
    ) -> Observable<[RepoItem]> {
        let queryParam = RepositoryParams(
            searchName: query,
            sortType: sortBy,
            order: isDescending,
            per_page: itemsPerPage,
            page: pageNumber
        )
        let repoList = RepositoryListRequest(method: .GET, params: queryParam)
        let repoItem = self.service.requestRx(request: repoList)  // observable<Item>
            .map { $0.map{ $0.toDomain() } }
        
        return repoItem
    }
}
