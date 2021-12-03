//
//  NetworkManager.swift
//  BaseSetup
//
//  Created by iOS Dev on 03/12/21.
//

import Foundation

class NetworkManager {
    
    func GetRequestWith<T:Codable>(url:String,completion: @escaping ( Result<T,Error>)-> Void){
        guard let url = URL(string: url) else  { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error { completion(.failure(error));return}
            guard let data = data else {
                return
            }
            completion( Result { try JSONDecoder().decode(T.self, from: data)})
        }.resume()
    }
    
    func PostRequestWith<T:Codable>(url:String,parameters:[String:Any],completion: @escaping( Result<T,Error>)-> Void){
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = parameters.description.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {completion(.failure(error));return}
            guard let data = data else {
                return
            }
            completion(Result { try JSONDecoder().decode(T.self, from: data)})
        }.resume()
    }
    
}


/*
 func fetchData<T: Codable>(urlString: String, completion: @escaping (Result<T,Error>) -> Void) {
     guard let url = URL(string: urlString) else { return }
     URLSession.shared.dataTask(with: url) { (data, _, error) in
         if let error = error { completion(.failure(error)); return }
         completion( Result{ try JSONDecoder().decode(T.self, from: data!) })
     }.resume()
 }
 */
