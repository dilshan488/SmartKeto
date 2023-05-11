//
//  WorkoutCell.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-11.
//

import UIKit


class WorkoutCell: UITableViewCell {
    var videoImageView = UIImageView()
    
    var videoTitlelabel = UILabel()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        
        addSubview(videoImageView)
        addSubview(videoTitlelabel)
        configureImageView()
        configureTitlelabel()
        setImageConstraints()
        setTitlelabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureImageView(){
        
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
        
    }
    
    
    func configureTitlelabel(){
        
        videoTitlelabel.numberOfLines = 0
        videoTitlelabel.adjustsFontSizeToFitWidth =  true
        
    }
    
    func setImageConstraints(){
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
        
    }
    func setTitlelabelConstraints(){
        videoTitlelabel.translatesAutoresizingMaskIntoConstraints = false
        videoTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoTitlelabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor,constant: 20).isActive = true
        videoTitlelabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
    }
}
