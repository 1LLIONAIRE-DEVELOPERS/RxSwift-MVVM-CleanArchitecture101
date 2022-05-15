//
//  RepoItem.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Jae-hoon Sim on 2022/05/13.
//

import Foundation

struct RepoItem {
    let name: String
    let description: String
    let ownerName: String
    let ownerAvatarURL: String
    let starCount: Int
    let language: String
}

struct RepoDetailItem {
    let name: String
    let htmlURL: String
    let ownerName: String
    let ownerAvatarURL: String
    let ownerType: String
    let description: String
    let forksCount, starCount: Int
    let createdAt, updatedAt: Date
}
