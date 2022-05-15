//
//  Repository+DTO.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by 조영민 on 2022/05/13.
//

import Foundation

struct Repository: Codable {
    let name: String?
    let owner: Owner
    let htmlURL: String?
    let repositoryDescription: String?
    let forksCount, stargazersCount: Int?
    let createdAt, updatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case htmlURL = "html_url"
        case repositoryDescription = "description"
        case forksCount = "forks_count"
        case stargazersCount = "stargazers_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct Owner: Codable {
    let login: String?
    let avatarURL: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case type
    }
}

extension Repository {
    func toDomain() -> RepoDetailItem {
        let name = self.name ?? ""
        let htmlURL = self.htmlURL ?? ""
        let ownerName = self.owner.login ?? ""
        let ownerAvatarURL = self.owner.avatarURL ?? ""
        let ownerType = self.owner.type ?? ""
        let description = self.repositoryDescription ?? ""
        let forksCount = self.forksCount ?? 0
        let starCount = self.stargazersCount ?? 0
        let createAt = self.createdAt ?? Date()
        let updatedAt = self.updatedAt ?? Date()
        
        
        return RepoDetailItem(
            name: name,
            htmlURL: htmlURL,
            ownerName: ownerName,
            ownerAvatarURL: ownerAvatarURL,
            ownerType: ownerType,
            description: description,
            forksCount: forksCount,
            starCount: starCount,
            createdAt: createAt,
            updatedAt: updatedAt)
    }
}
