//
//  ExerciseListDataModel.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-15.
//

import Foundation
///Struct for storing exercise list data.
struct ExerciseListDataModel: Codable
{
    var exerciseGIF: [String]
    var exerciseName: [String]
    var targetMuscle: [String]
    var exerciseEquipment: [String]
}
