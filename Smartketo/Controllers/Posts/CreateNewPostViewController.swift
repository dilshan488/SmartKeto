//
//  CreateNewPostViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-17.
//
// inputing data to firebase
import UIKit

class CreateNewPostViewController: UITabBarController {

    //title field
    
    private let titlefield: UITextField = {
       let field = UITextField()
        field.keyboardType = .emailAddress
        field.leftView = UIView(frame: CGRect(x:0, y:0,width:10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Enter Title"
        field.autocapitalizationType = .words
        field.autocorrectionType = .yes
        field.layer.masksToBounds = true
        return field
    }()
    //image header
  

    private let headerImageview: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "photo")
        imageView.backgroundColor = .tertiarySystemBackground
        return imageView
    }()
    //text view for post
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .tertiarySystemBackground
        
        textView.isEditable = true
        textView.font = .systemFont(ofSize: 28)
        
        return textView
        
    }()
     
    private var selectedHeaderImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(headerImageview)
        view.addSubview(textView)
        view.addSubview(titlefield)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapHeader))
        
        headerImageview.addGestureRecognizer(tap)
        
        configurebuttons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titlefield.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.width - 20, height: 50)
        headerImageview.frame = CGRect(x: 0, y: titlefield.bottom+5, width: view.width, height: 160)
        textView.frame = CGRect(x: 10, y: headerImageview.bottom+10, width: view.width-20, height: view.height-210-view.safeAreaInsets.top)
    }
    
    
    @objc private func didTapHeader(){
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    private func configurebuttons(){
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didTapCancel))
      
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didTapPost))
    }
   
    @objc private func didTapCancel(){
        dismiss(animated: true, completion: nil)
        
    }

    
    @objc private func didTapPost(){
        
        //check data and post
        
        guard let title = titlefield.text, let body = textView.text,let headerImage = selectedHeaderImage,
              let email = UserDefaults.standard.string(forKey: "email"),
                !title.trimmingCharacters(in: .whitespaces).isEmpty,
        !body.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            let alert = UIAlertController(title:"Enter post details" ,
                                          message: "please enter a title",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        print("Starting post")
        let newpostid = UUID().uuidString
        //upload header
        StorageManager.shared.uploadBlogHeaderImage(email: email, image: headerImage, postid: newpostid){
            
            success in
            guard success else {
                return
            }
            
            StorageManager.shared.downloadUrlForPostHeader(email: email,
                                                           postid: newpostid){ url in
                guard let headerUrl = url else{
                    print("fail to upload url")
                    return
                }
                
                
                //insert of post in to db
                
                let post = BlogPost(
                    identifier: newpostid,
                                    title: title,
                                    timestamp: Date().timeIntervalSince1970,
                                    headerImageUrl: headerUrl,
                                    text: body)
                DatabaseManager.shared.insert(blogpost: post, email: email){[weak self]posted in
                    guard posted else {
                        
                        print("fail to post")
                        return
                    }
                    DispatchQueue.main.async {
                        self?.didTapCancel()
                    }
                }
            }
                
            }
        }
        
}

extension CreateNewPostViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true,completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
    selectedHeaderImage = image
        headerImageview.image = image
    }
}
