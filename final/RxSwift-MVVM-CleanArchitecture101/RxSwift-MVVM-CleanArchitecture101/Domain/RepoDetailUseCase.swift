//
//  RepoDetailUseCase.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Jae-hoon Sim on 2022/05/13.
//

import Foundation
import RxSwift

class RepoDetailUseCase {

    let repoDetailRepository: RepoDetailRepository

    init(repoDetailRepository: RepoDetailRepository) {
        self.repoDetailRepository = repoDetailRepository
    }

    func fetch(
        owner: String,
        repo: String
    ) -> Observable<[RepoDetailItem]> {
        return self.repoDetailRepository.fetch(
            owner: owner,
            repo: repo
        )
    }
}

