//
//  DatabaseManager.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-17.
//
import Foundation
import FirebaseFirestore

final class DatabaseManager{
    static let shared = DatabaseManager()
    
    
    private let database = Firestore.firestore()
    private init() {}
    
    public func insert(
        blogpost: BlogPost,
        email: String,
        completion: @escaping (Bool) -> Void
    ){
        let userEmail = email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        let data:[String:Any] = [
            "id": blogpost.identifier,
            "title": blogpost.title,
            "body": blogpost.text,
            "created":blogpost.timestamp,
            "headerImageUrl": blogpost.headerImageUrl?.absoluteString ?? ""      ]
        database
            .collection("users")
            .document(userEmail)
            .collection("posts")
            .document(blogpost.identifier)
            .setData(data){error in
                completion(error == nil)
                
                
            }
        
    }
    
    
    
    public func getAllPosts(
        
        completion: @escaping ([BlogPost]) -> Void
    ){
        
        
    }
    
    
    public func getPosts(
        for email: String,
        completion: @escaping ([BlogPost]) -> Void
    ){
        let userEmail = email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        database
            .collection("users")
            .document(userEmail)
            .collection("posts")
            .getDocuments{snapshot, error in
                
                guard let documents = snapshot?.documents.compactMap({$0.data()}),
                        error == nil else {
                    return
                    }
                
                let posts: [BlogPost] = documents.compactMap({ dictionary in
                    guard let id = dictionary["id"] as? String,
                          let title = dictionary["title"] as? String,
                          let body = dictionary["body"] as? String,
                          let created = dictionary["created"] as? TimeInterval,
                          let ImageUrlString = dictionary["headerImageUrl"] as? String else {
                        
                        print("invalid post fetch convertion")
                        return nil
                    }
//                    [
//                        "id": blogpost.identifier,
//                        "title": blogpost.title,
//                        "body": blogpost.text,
//                        "created":blogpost.timestamp,
//                        "headerImageUrl": blogpost.headerImageUrl?.absoluteString ?? ""      ]
                    
                    let post = BlogPost(identifier: id,
                                        title: title,
                                        timestamp: created,
                                        headerImageUrl: URL(string: ImageUrlString),
                                        text: body)
                    
                    return post
                })
                completion(posts)
            }
        
    }
    
    // inserting user
    public func inser(
        user: User,
        completion: @escaping (Bool) -> Void
    ){
        let documentId = user.email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        
        let data = [
            
            "email": user.email,
            "name": user.name
        ]
        database
            .collection("users")
            .document(documentId)
            .setData(data){ error in completion(error == nil)
                
            }
        
    }
    
    public func getUser(email: String, completion: @escaping(User?) -> Void){
        
        let documentId = email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        database
            .collection("users")
            .document(documentId).getDocument{snapshot, error in
                
                guard let data = snapshot?.data() as? [String: String],
                      let name = data["name"],
                      error == nil else {
                    return
                }
                
                let ref = data["profile_photo"]
                
                let user = User(name: name, email: email, profilePictureRef: ref)
                
                completion(user)
                
            }
        
    }

    func updateProfilePhoto(email: String, completion: @escaping(Bool) -> Void ){
      
        let path = email.replacingOccurrences(of: "@", with: "_")
            .replacingOccurrences(of: ".", with: "_")
        let photoRefernce = "profile_pictures/\(path)/photo.png"
        
        let dbRef = database.collection("users").document(path)
        
        dbRef.getDocument{snapshot, error in
            guard var data = snapshot?.data(), error == nil else {
                
                return
            }
            data["profile_photo"] = photoRefernce
            
            dbRef.setData(data){error in completion(error == nil)
                
            }
        }
    }
    
    
}
