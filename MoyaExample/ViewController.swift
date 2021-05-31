//
//  ViewController.swift
//  MoyaExample
//
//  Created by Shahriar Nasim Nafi on 6/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    var books = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for page in 1...12{
            networkManager.getAllBooks(page: page) { books in
                print(books)
                self.books.append(contentsOf: books)
                print("Total: \(self.books.count)")
            }
        }
    }
}
