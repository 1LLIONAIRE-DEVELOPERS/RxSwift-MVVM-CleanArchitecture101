//
//  RepoListViewModel.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Lee Seung-Jae on 2022/05/13.
//

import Foundation
import RxSwift

class RepoFavoriteViewModel {
    struct Input {
        let viewWillAppear: Observable<Void>
        let cellDidTap: Observable<Void>
    }

    struct Output {
        let repoItems: Observable<Void>
    }

//    func transform(input: Input) -> Output {
//        input.viewWillAppear
//            .flatMap {
//
//            }
//
//        return
//    }
}
