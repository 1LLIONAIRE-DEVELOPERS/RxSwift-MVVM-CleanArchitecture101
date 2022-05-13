//
//  RepoItemRepository.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Jae-hoon Sim on 2022/05/13.
//

import Foundation
import RxSwift

protocol RepoItemRepository {

    func fetch(
        query: String,
        sortBy: RepoItemQuerySortType?,
        isDescending: Bool,
        itemsPerPage: Int,
        pageNumber: Int
    ) -> Observable<[RepoItem]>

}
