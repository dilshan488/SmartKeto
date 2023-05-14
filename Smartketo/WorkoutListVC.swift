//
//  WorkoutListVC.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-11.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseFirestore
class WorkoutListVC: UIViewController {
    
    var ref: DatabaseReference!
var tableView = UITableView()
// var users: [User] = []
    
    var videos:[Video] = []
    
    struct Cells {
        
        static let videoCell = "WorkoutCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videos = fetchData()
        ref = Database.database().reference()
        configureTableView()

    }
    
    func configureTableView(){
        
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 100
        tableView.register(WorkoutCell.self, forCellReuseIdentifier:Cells.videoCell)
        tableView.pin(to: view)
    }
    func setTableViewDelegate(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
//    func observeData()
//    {
//        self.ref.observe(<#T##eventType: DataEventType##DataEventType#>, with: <#T##(DataSnapshot) -> Void#>)
//
//    }
}
//
extension WorkoutListVC:UITableViewDelegate,UITableViewDataSource{
    //    struct User {
    //        let name: String
    //        let age: Int
    //        let address: String
    //        let city: String
    //        let postcode: Int
    //    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //      users.count
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! WorkoutCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        
        
        // else {
        //                  fatalError("Unable to dequeue UserCell")
        //              }
        //              let user = users[indexPath.row]
        //
        //              cell.nameLabel.text = user.name
        //              cell.ageLabel.text = String(user.age)
        //              cell.addressLabel.text = user.address
        //              cell.cityLabel.text = user.city
        //              cell.postcodeLabel.text = String(user.postcode)
        //
        //              return cell
        //    }
        //
        return cell
        
        
    }
    
}

extension WorkoutListVC{
    
    func fetchData() -> [Video]
    {
        
        
       //        let db = Firestore.firestore()
               
               //users = []  //  Empty the array
            //   db.collection("User").getDocuments { (snapshot, error) in
//                   if let error = error {
//                       print(error)
//                       return
//                   } else {
//                       for document in snapshot!.documents {
//                           let data = document.data()
//                           let newEntry = Video(
//                               name: data["name"] as! String,
//                               age: data["age"] as! Int,
//                               address: data["address"] as! String,
//                               city: data["city"] as! String,
//                               postcode: data["postcode"] as! Int)
//                           self.videos.append(newEntry)
//                       }
//                   }
//                   DispatchQueue.main.async {
//                       self.tableView.reloadData()
//                   }
//               }
//
        
        return []
        
        
    }
    
}
