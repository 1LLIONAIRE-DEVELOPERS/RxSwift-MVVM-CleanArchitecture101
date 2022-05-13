//
//  RepoListUseCase.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Jae-hoon Sim on 2022/05/13.
//

import Foundation
import RxSwift

class RepoListUseCase {

    let repoItemRepository: RepoItemRepository

    init(repoItemRepository: RepoItemRepository) {
        self.repoItemRepository = repoItemRepository
    }

    func fetch(
        query: String,
        sortBy: RepoItemQuerySortType?,
        isDescending: Bool,
        itemsPerPage: Int,
        pageNumber: Int
    ) -> Observable<[RepoItem]> {
        return self.repoItemRepository.fetch(
            query: query,
            sortBy: sortBy,
            isDescending: isDescending,
            itemsPerPage: itemsPerPage,
            pageNumber: pageNumber
        )
    }
}
