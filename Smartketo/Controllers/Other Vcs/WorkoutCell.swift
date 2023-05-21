////
////  WorkoutCell.swift
////  Smartketo
////
////  Created by Pubudu Dilshan on 2023-05-11.
////
//
//import UIKit
//
//
//class WorkoutCell: UITableViewCell {
//    var videoImageView = UIImageView()
//
//    var videoTitlelabel = UILabel()
//    var ageLabel = UILabel()
//    var addressLabel = UILabel()
//    var cityLabel = UILabel()
//    var postcodeLabel = UILabel()
//
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style,reuseIdentifier: reuseIdentifier)
//
//        addSubview(videoImageView)
//        addSubview(videoTitlelabel)
//        configureImageView()
//        configureTitlelabel()
//        configureageLabel()
//        configureaddressLabel()
//        configurecityLabel()
//        configurepostcodeLabel()
//        setImageConstraints()
//
//        setTitlelabelConstraints()
//
//        setageLabelConstraints()
//
//        setaddressLabelConstraints()
//
//        setcityLabelConstraints()
//
//        setpostcodeLabelConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func set(video:Video)
//    {
//
//        videoTitlelabel.text = video.name
//               ageLabel.text = String(video.age)
//                addressLabel.text = video.address
//                cityLabel.text = video.city
//                postcodeLabel.text = String(video.postcode)
//
//
//    }
//    func configureImageView(){
//
//        videoImageView.layer.cornerRadius = 10
//        videoImageView.clipsToBounds = true
//
//    }
//
//
//    func configureTitlelabel(){
//
//        videoTitlelabel.numberOfLines = 0
//        videoTitlelabel.adjustsFontSizeToFitWidth =  true
//
//    }
//
//    func configureageLabel(){
//
//        ageLabel.numberOfLines = 0
//        ageLabel.adjustsFontSizeToFitWidth =  true
//
//    }
//    func configureaddressLabel(){
//
//        addressLabel.numberOfLines = 0
//        addressLabel.adjustsFontSizeToFitWidth =  true
//
//    }
//    func configurecityLabel(){
//
//        cityLabel.numberOfLines = 0
//        cityLabel.adjustsFontSizeToFitWidth =  true
//
//    }
//
//    func configurepostcodeLabel(){
//
//        postcodeLabel.numberOfLines = 0
//        postcodeLabel.adjustsFontSizeToFitWidth =  true
//
//    }
//
//    func setImageConstraints(){
//        videoImageView.translatesAutoresizingMaskIntoConstraints = false
//        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
//        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
//
//    }
//    func setTitlelabelConstraints(){
//        videoTitlelabel.translatesAutoresizingMaskIntoConstraints = false
//        videoTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        videoTitlelabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor,constant: 20).isActive = true
//        videoTitlelabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        videoTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//
//    }
//
//    func  setageLabelConstraints(){
//        videoTitlelabel.translatesAutoresizingMaskIntoConstraints = false
//        videoTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        videoTitlelabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor,constant: 22).isActive = true
//        videoTitlelabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        videoTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14).isActive = true
//
//    }
//
//
//    func  setaddressLabelConstraints(){
//        videoTitlelabel.translatesAutoresizingMaskIntoConstraints = false
//        videoTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        videoTitlelabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor,constant: 24).isActive = true
//        videoTitlelabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        videoTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
//
//    }
//
//    func  setcityLabelConstraints(){
//        videoTitlelabel.translatesAutoresizingMaskIntoConstraints = false
//        videoTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        videoTitlelabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor,constant: 26).isActive = true
//        videoTitlelabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        videoTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18).isActive = true
//
//    }
//
//
//    func  setpostcodeLabelConstraints(){
//        videoTitlelabel.translatesAutoresizingMaskIntoConstraints = false
//        videoTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        videoTitlelabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor,constant: 20).isActive = true
//        videoTitlelabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        videoTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//
//    }
//}
