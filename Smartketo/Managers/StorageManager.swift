//
//  StorageManager.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-17.
//

import Foundation
import FirebaseStorage
import UIKit

final class StorageManager{
    static let shared = StorageManager()
    
    
    private let container = Storage.storage()
    private init() {}
    
    public func uploadProfilePicture
        (
    email: String,
    image: UIImage?,
    completion: @escaping (Bool) -> Void
        ){
            let path = email.replacingOccurrences(of: "@", with: "_")
                .replacingOccurrences(of: ".", with: "_")
            guard let pngData = image?.pngData() else {
                return
            }
            
            
            container.reference(withPath: "profile_pictures/\(path)/photo.png")
                .putData(pngData, metadata : nil ){ metadata, error in
                    guard metadata != nil,error == nil else {
                        completion(false)
                        return
                    }
                    completion(true)
                    
                }
    }
 
    
    public func downloadUrlForProfilePicture
        (
            path: String,
            completion: @escaping (URL?) -> Void
        ){
            container.reference(withPath: path)
                .downloadURL{url, _ in
                    completion(url)
                }
    }
    
    public func uploadBlogHeaderImage
        (
            email: String,
    image: UIImage,
    postid: String,
    completion: @escaping (Bool) -> Void
        ){
            let path = email.replacingOccurrences(of: "@", with: "_")
                .replacingOccurrences(of: ".", with: "_")
            guard let pngData = image.pngData() else {
                return
            }
            
            
            container.reference(withPath: "posts/\(path)/\(postid).png")
                .putData(pngData, metadata : nil ){ metadata, error in
                    guard metadata != nil,error == nil else {
                        completion(false)
                        return
                    }
                    completion(true)
                    
                }
    }
 
    
    public func downloadUrlForPostHeader
        (
            email:String,
            postid:String,
            
            completion: @escaping (URL?) -> Void
        ){
            let emailcomponent = email.replacingOccurrences(of: "@", with: "_")
                .replacingOccurrences(of: ".", with: "_")
         
            
            container.reference(withPath: "posts/\(emailcomponent)/\(postid).png")
                .downloadURL{ url , _ in completion(url) }
    }
}
