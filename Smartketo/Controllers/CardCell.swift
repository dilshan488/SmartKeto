////
////  CardCell.swift
////  Smartketo
////
////  Created by Pubudu Dilshan on 2023-05-15.
////
//
//import UIKit
//
//class CardCell: UITableViewCell {
//   var cardView = UIView()
//   var cardBackgroundImageView = UIImageView()
//
//   var workoutNameLabel = UILabel()
//
//   var totalWorkoutsLabel = UILabel()
//   
//    // Function for setting up the cell.
//    func configure(image: UIImage,workoutName: String,totalWorkouts:Int)
//    {
//        cardBackgroundImageView.image = image
//        workoutNameLabel.text = workoutName
//        totalWorkoutsLabel.text = "Total workouts: \(totalWorkouts)"
//        makeRoundedCorners()
//    }
//
//    // Passes data from current tableview cell to exercise list view controller
//    public func passDataToExerciseListVC(vc: ExerciseListViewController?, VCTitle: String,image: UIImage,workoutName:String,totalWorkouts:Int,bodyPart: String)
//    {
//        vc?.viewControllerTitle = VCTitle
//        vc?.image = image
//        vc?.workoutName = workoutName
//        vc?.totalWorkouts = totalWorkouts
//        vc?.bodyPart = bodyPart
//    }
//
//    private func makeRoundedCorners()
//    {
//        cardView.layer.cornerRadius = 10.0 // Make cell rounded
//        cardView.layer.borderWidth = 0.5 // Set a line along the border
//        cardView.layer.borderColor = UIColor.gray.cgColor // Set the color of border line
//
//        cardBackgroundImageView.layer.cornerRadius = 10.0 // Setting card image corner radius
//    }
//
//
//}
