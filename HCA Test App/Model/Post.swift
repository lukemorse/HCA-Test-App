//
//  Post.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/18/20.
//


import Foundation

struct Post: Encodable {
    let answerCount: Int
    let title: String
    let score: Int
    let user: User
    
    init(answerCount: Int = 0, title: String = "", score: Int = 0, user: User = User(reputation: 0, profile_image: "", display_name: "")) {
        self.answerCount = answerCount
        self.title = title
        self.score = score
        self.user = user
    }

    private enum CodingKeys: String, CodingKey {
        case answerCount = "answer_count"
        case username = "display_name"
        case title = "title"
        case score = "score"
        case user = "owner"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(answerCount, forKey: .answerCount)
    }
}

extension Post: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        answerCount = try container.decode(Int.self, forKey: .answerCount)
        title = try container.decode(String.self, forKey: .title)
        score = try container.decode(Int.self, forKey: .score)
        user = try container.decode(User.self, forKey: .user)
    }
}
