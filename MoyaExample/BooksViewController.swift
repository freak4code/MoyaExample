//
//  BooksViewController.swift
//  MoyaExample
//
//  Created by Shahriar Nasim Nafi on 6/11/20.
//

import UIKit

class BooksViewController: UITableViewController {
    
    var books = [Book]()
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let nib = UINib(nibName: "BookCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BookCell")
                
//        tableView.dataSource = self
//        tableView.delegate = self
        
        for i in 1...12{
            networkManager.getAllBooks(page: i) { [weak self] books in
                self?.books.append(contentsOf: books)
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        
        cell.setUpBook(for: books[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
}
