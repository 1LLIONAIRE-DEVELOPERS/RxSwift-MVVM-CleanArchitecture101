//
//  RepoDetailRepository.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Jae-hoon Sim on 2022/05/13.
//

import Foundation

protocol RepoDetailRepository {

    func fetch(
        owner: String,
        repo: String
    ) -> Observable<[RepoDetailItem]>

}
