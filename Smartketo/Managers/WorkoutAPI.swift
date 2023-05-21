//
//  //WorkoutAPI.swift
//  //Smartketo
//
// // Created by Pubudu Dilshan on 2023-05-21.
//
//
//import Foundation
//
//final class WorkoutAPI {
//
//static let shared = WorkoutAPI()
//
//func fetchworkoutList(onComplete: @escaping ([Amiibo]){
//
//    let urlString = "https://firestore.googleapis.com/v1/projects/appworkingout/databases/(default)/documents/Weightloss"
//    let url = URL(string: urlString)!
//    let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
//
//        guard let data = data else {
//            print("Data was nil")
//            return
//        }
//        guard let amiiboList = try? JSONDecoder().decode(workoutList.self, from: data) else {
//                       print("Couldn't decode JSON")
//                       return
//                   }
//
//                   print(amiiboList.documents)
//
//               }//end task
//
//               task.resume()
//
//    }
//
//
//}
//
//struct workoutList:Codable {
//
//    let documents:[Workout]
//}
//
//struct Workout: Codable {
//    let WorkoutName: String?
//    let Category: String?
//    let Desc: String?
//    let url: String?
//    // let Calories: String
//
//}
