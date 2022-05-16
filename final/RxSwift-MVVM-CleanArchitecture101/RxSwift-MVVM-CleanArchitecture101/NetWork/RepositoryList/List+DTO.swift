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
    let name, fullName: String?
    let owner: Owner?
    let itemDescription: String?
    let stargazersCount: Int?
    let language: String?

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case owner
        case itemDescription = "description"
        case stargazersCount = "stargazers_count"
        case language
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try value.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.fullName = try value.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        self.itemDescription = try value.decodeIfPresent(String.self, forKey: .itemDescription) ?? ""
        self.stargazersCount = try value.decodeIfPresent(Int.self, forKey: .stargazersCount) ?? .zero
        self.language = try value.decodeIfPresent(String.self, forKey: .language) ?? ""
        self.owner = try value.decodeIfPresent(Owner.self, forKey: .owner) ?? Owner.init(login: "", avatarURL: "", type: "")
    }
}

extension Item {
    func toDomain() -> RepoItem {
        let name = self.name ?? ""
        let description = self.itemDescription ?? ""
        let ownerName = self.owner?.login ?? ""
        let starCount = self.stargazersCount ?? 0
        let language = self.language ?? ""
        let ownerURL = self.owner?.avatarURL ?? ""
        
        return RepoItem(
            name: name,
            description: description,
            ownerName: ownerName,
            ownerAvatarURL:ownerURL,
            starCount: starCount,
            language: language
        )
    }
}

