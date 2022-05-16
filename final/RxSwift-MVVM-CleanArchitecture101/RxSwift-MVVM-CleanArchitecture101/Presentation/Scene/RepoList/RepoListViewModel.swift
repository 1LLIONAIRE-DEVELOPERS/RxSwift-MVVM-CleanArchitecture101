//
//  RepoListViewModel\.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Lee Seung-Jae on 2022/05/13.
//

import Foundation
import RxSwift
import RxCocoa

class RepoListViewModel {
    private let repoListUseCase: RepoListUseCase

    init(useCase: RepoListUseCase) {
        self.repoListUseCase = useCase
    }

    struct Input {
        let viewWillAppear: Observable<Void>
        let searchQuery: BehaviorRelay<String>
        let cellDidTap: Observable<RepoItem>
    }

    struct Output {
        let repoItems: Observable<[RepoItem]>
    }

    func transform(input: Input) -> Output {
        let repoItems = input.searchQuery
            .skip(1)
            .flatMapLatest {
                self.repoListUseCase.fetch(
                    query: $0,
                    sortBy: nil,
                    isDescending: true,
                    itemsPerPage: 40,
                    pageNumber: 1
                )
            }
          
        return Output(repoItems: repoItems)
    }
}
