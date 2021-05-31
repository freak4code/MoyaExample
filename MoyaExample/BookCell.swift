//
//  BookCell.swift
//  MoyaExample
//
//  Created by Shahriar Nasim Nafi on 6/11/20.
//

import UIKit
import AARatingBar

class BookCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var totalRead: UILabel!
    @IBOutlet weak var rating: AARatingBar!
    
    var downloadTask: URLSessionDownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  setUpBook(for book: Book) {
        bookName.text = book.bookName
        bookAuthor.text = book.bookWriter
        totalRead.text = "সর্বমোট পড়েছেনঃ \(Helper.toBangla(of: book.totalread)) জন"
        let downloadTask = bookImage.loadImage(url: URL(string: book.bookImage)!)
        rating.value = CGFloat(Float(book.bookAverageReview)!)
        rating.isEnabled = false
    }
    
    deinit {
        downloadTask = nil
        print("deinit")
    }

}
