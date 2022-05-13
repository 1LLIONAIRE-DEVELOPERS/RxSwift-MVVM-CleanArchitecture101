//
//  Entity.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/13.
//

import Foundation

struct List: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Item: Codable {
    let name, fullName: String
    let owner: Owner
    let itemDescription: String
    let stargazersCount: Int
    let language: String?

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case owner
        case itemDescription = "description"
        case stargazersCount = "stargazers_count"
        case language
    }
}

extension List {
    func toDomain() -> RepoItem {
        
    }
}
//struct RepoItem {
//    let name: String
//    let description: String
//    let ownerName: String
//    let ownerAvatarURL: String
//    let starCount: Int
//    let language: String
//}

