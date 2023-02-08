//
//  NetworkManager.swift
//  Ex25_ListAndWebview
//
//  Created by 박상우 on 2023/01/14.
//

import Foundation

class NetworkManager : ObservableObject {
    @Published var posts = [Post]()
    func fetchData() {
        //IT 블로그 REST API 호출
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {
                (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        //do catch문 : 예외처리
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            //메인 스레드 안에 접근
                            DispatchQueue.main.sync {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume() // 통신을 수행한다.
        }
    }
}
