//
//  WorkoutListVC.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-11.
//

import UIKit
import Firebase
import FirebaseDatabase
class WorkoutListVC: UIViewController {
    
    var ref: DatabaseReference!
var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        configureTableView()

    }
    
    func configureTableView(){
        
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 100
        tableView.pin(to: view)
    }
    func setTableViewDelegate(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func observeData()
    {
        self.ref.observe(<#T##eventType: DataEventType##DataEventType#>, with: <#T##(DataSnapshot) -> Void#>)
        
    }
}

extension WorkoutListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}
