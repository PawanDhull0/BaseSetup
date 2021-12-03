//
//  ViewController.swift
//  BaseSetup
//
//  Created by iOS Dev on 03/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    let NM = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    
    @IBAction func getUsers(_ sender: UIButton) {
//        self.getUsers()
        self.getUserbyId()
    }
    
    
    func getUsers(){
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        print(urlString)
        self.NM.GetRequestWith(url: urlString) { (result : Result<UsersModel,Error>) in
            switch result {
            case .success(let model) : print(model)
            case .failure(let error) : print(error)
            }
        }
    }
    
    func getUserbyId(){
        let params = [
            "title": "foo",
            "body": "bar",
            "userId": 1,
        ] as [String : Any]
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        self.NM.PostRequestWith(url: urlString, parameters: params) { (result: Result<UserModel,Error>) in
            switch result {
            case .success(let success):print(success)
            case .failure(let failure): print(failure)
            }
        }
    }
}

