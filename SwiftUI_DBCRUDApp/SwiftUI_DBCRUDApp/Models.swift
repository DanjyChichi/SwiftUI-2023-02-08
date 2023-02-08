//  Models.swift

import Foundation

//Decodable : JSON 문자열과 매핑될 수 있도록 한다.
//서버에서 응답하는 JSON에 매핑되는 구조체
struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [PostModel]
}
//클라에서 요청하는 JSON에 매핑되는 구조체
struct PostModel: Decodable {
    let id: Int
    let title: String
    let post: String
}
