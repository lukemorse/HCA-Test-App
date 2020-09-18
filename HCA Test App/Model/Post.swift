//
//  Post.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/18/20.
//


import Foundation

struct Post: Encodable {
    let answerCount: Int
    let displayName: String
    let title: String
    let score: Int

    private enum CodingKeys: String, CodingKey {
        case answerCount = "answer_count"
        case displayName = "display_name"
        case title = "title"
        case score = "score"
        
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
        displayName = try container.decode(String.self, forKey: .displayName)
        title = try container.decode(String.self, forKey: .title)
        score = try container.decode(Int.self, forKey: .score)
    }
}
