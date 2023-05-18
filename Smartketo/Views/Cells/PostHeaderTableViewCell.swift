//
//  PostHeaderTableViewCell.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-18.
//

import UIKit


class PostHeaderTableViewCellViewModel{
    let imageUrl: URL?
    var imageData: Data?
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
}
class PostHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "PostHeaderTableViewCell"
        
        private let postImageViews: UIImageView = {
            let imageView = UIImageView()
            
            imageView.layer.masksToBounds = true
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            return imageView
            
            
        }()
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.clipsToBounds = true
            contentView.addSubview(postImageViews)
         
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            postImageViews.frame = contentView.bounds
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            postImageViews.image = nil
        }
      
        
        func configure(with viewModel: PostHeaderTableViewCellViewModel) {
        
            
            if let data = viewModel.imageData{
                postImageViews.image = UIImage(data: data)
            }
            else if let url = viewModel.imageUrl{
               //fetch image & cache
                
                let task = URLSession.shared.dataTask(with: url)
                {[weak self] data, _ , _ in
                    
                    guard let data = data else {
                        return
                        
                    }
                    viewModel.imageData = data
                    DispatchQueue.main.async {
                        self?.postImageViews.image = UIImage(data: data)
                    }
                }
                task.resume()
                
            }
        }
    }

