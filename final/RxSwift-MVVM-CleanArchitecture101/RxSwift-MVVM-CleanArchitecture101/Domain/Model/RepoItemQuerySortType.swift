//
//  RepoItemQuerySortType.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Jae-hoon Sim on 2022/05/13.
//

import Foundation

enum RepoItemQuerySortType {
    case stars
    case forks
    case helpWantedIssues
    case updated

    var urlParam: String {
        switch self {
        case .stars:
            return "stars"
        case .forks:
            return "forks"
        case .helpWantedIssues:
            return "help-wanted-issues"
        case .updated:
            return "updated"
        }
    }
}
