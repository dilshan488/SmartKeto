//
//  ExerciseListDataModel.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-15.
//

import Foundation
import FirebaseFirestore
///Struct for storing exercise list data.
//struct ExerciseListDataModel: Codable
//{
//    var exerciseGIF: [String]
//    var exerciseName: [String]
//    var targetMuscle: [String]
//    var exerciseEquipment: [String]
//}

struct ExerciseListDataModel {
    var id: String
    var exerciseName: String
    var exerciseGIF: String
    var imgUrl: String
    var targetMuscle: String
    var exerciseEquipment: String
    var isActive: Bool = true
    var timeStamp: Timestamp
    
    init(
        id: String,
         exerciseName: String,
         exerciseGIF: String,
         imgUrl: String,
         targetMuscle: String,
         exerciseEquipment: String,
         isActive: Bool = true,
         timeStamp: Timestamp)
    {
        self.id = id
        self.exerciseName = exerciseName
        self.exerciseGIF = exerciseGIF
        self.imgUrl = imgUrl
        self.targetMuscle = targetMuscle
        self.exerciseEquipment = exerciseEquipment
        self.isActive = isActive
        self.timeStamp = timeStamp
    }
    
    
    init(data: [String: Any]){
        
        self.id = data["id"] as? String ?? UUID().uuidString
        self.exerciseName = data["exerciseName"] as? String ?? ""
        self.exerciseGIF = data["exerciseGIF"] as? String ?? ""
        self.imgUrl = data["imgUrl"] as? String ?? ""
        self.targetMuscle = data["targetMuscle"] as? String ?? ""
        self.exerciseEquipment = data["exerciseEquipment"] as? String ?? ""
        self.isActive = data["isActive"] as? Bool ?? true
        self.timeStamp = data["timeStamp"] as? Timestamp ?? Timestamp()
    }
    
    static func modelToData(exerciseList: ExerciseListDataModel) -> [String: Any] {
        let data: [String: Any] = [
            "id": exerciseList.id,
            "exerciseName" : exerciseList.exerciseName,
            "exerciseGIF" : exerciseList.exerciseGIF,
            "imgUrl": exerciseList.imgUrl,
            "targetMuscle" : exerciseList.targetMuscle,
            "isActive": exerciseList.isActive,
            "exerciseEquipment" : exerciseList.exerciseEquipment,
            "timeStamp": exerciseList.timeStamp
        ]
        
        return data
        
    }
}
