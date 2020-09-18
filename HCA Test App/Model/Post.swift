//
//  Post.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/18/20.
//


import Foundation

struct Post: Encodable {
    var answerCount: Int
    
    init(answer_count: Int) {
        self.answerCount = answer_count
    }

    private enum CodingKeys: String, CodingKey {
        case answer_count = "answer_count"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(answerCount, forKey: .answer_count)
    }
}

extension Post: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        answerCount = try container.decode(Int.self, forKey: .answer_count)
    }
}
