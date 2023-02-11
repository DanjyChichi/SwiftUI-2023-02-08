//  ViewModel.swift

import Foundation

//모델 : struct
//뷰(SwiftUI) : struct
//뷰모델(통신과 데이타 제공) : class

//통신과 데이타 제공의 역할을 하는 클래스
class ViewModel: ObservableObject {
    //포스트 데이타 배열
    @Published var items = [PostModel]() //빈배열 생성
    let prefixUrl = "http://localhost:3000"
    
    //생성자함수
    init(){
        fetchPosts() //통신을 통해 서버에서 데이타 가져오기
    }
    //MARK: - 포스트 목록 가져오기
    func fetchPosts(){
        guard let url = URL(string: "\(prefixUrl)/posts") else {
            print("Not Found URL!")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                //통신에러발생!
                print("error", error?.localizedDescription ?? "")
                return
            }
            do {
                if let new_data = data {
                    //data가 nil이 아니면,
                    let result = try JSONDecoder().decode(DataModel.self, from: new_data)
                    DispatchQueue.main.async {
                        self.items = result.data
                        print("self.items:\(self.items)")
                    }
                }else{
                    print("No data")
                }
            }
            catch let JsonError {
                //JSON 디코딩(파싱) 오류발생시
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume() //URLSession
    }//func
    
    //MARK: - 포스트 삭제하기
    func deletePost(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/deletePost") else {
            print("Not Found URL!")
            return
        }
        
        //키-밸류 객체를 JSON객체로 만들어줌.
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {
            (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            do {
                if let new_data = data {

                    let result = try JSONDecoder().decode(DataModel.self, from: new_data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }else{
                    print("No data")
                }
            } catch let JsonError {
                print("fetch json error", JsonError.localizedDescription)
            }
        }.resume()
    }//func
    
    //Mark: - create date
    func cratePost(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/createPost") else {
            print("Not Founc url")
            return
        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            do {
                if let new_data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: new_data)
                    DispatchQueue.main.async {
                        print( result )
                    }
                }
                else{
                    print("No data")
                }
            }
            catch let JsonError {
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }//func
    
    //Mark: - update data
    func updatePost(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/updatePost") else {
            print("Not Found url")
            return
        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            do {
                if let new_data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: new_data)
                    DispatchQueue.main.async {
                        print( result )
                        self.fetchPosts()
                    }
                }
                else{
                    print("No data")
                }
            }
            catch let JsonError {
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }//func
    
}//class
