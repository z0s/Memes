//
//  MemesEditorViewController.swift
//  Memes
//
//  Created by IT on 9/22/16.
//  Copyright © 2016 z0s. All rights reserved.
//

import UIKit

class MemesEditorViewController: UIViewController, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    lazy var imagePickerView: UIImageView = {
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        return imageView
    }()
    
    lazy var takePhoto: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem()
        return barButtonItem
    }()
    
    lazy var topText: UITextField = {
        let textField = UITextField()
        return textField
    }()
    lazy var bottomText: UITextField = {
        let textField = UITextField()
        return textField
    }()
    lazy var shareButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem()
        return barButtonItem
    }()
    lazy var toolBar: UIToolbar = {
        let bar = UIToolbar()
        self.view.addSubview(bar)
        return bar
    }()
//    lazy var navBar: UINavigationBar = {
//        let bar = UINavigationBar()
//        self.view.addSubview(bar)
//        return bar
//    }()
    
    let memeTextAttributes  = [NSStrokeColorAttributeName: UIColor.black,
                               NSForegroundColorAttributeName: UIColor.white,
                               NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!, NSStrokeWidthAttributeName: -3, NSBackgroundColorAttributeName: UIColor.clear] as [String:Any]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        
        shareButton.isEnabled = false
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let backItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        let shareItem = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
        

        navigationItem.leftBarButtonItem = shareItem
        navigationItem.rightBarButtonItem = backItem
        
        
        
        let cameraItem = UIBarButtonItem(barButtonSystemItem: .camera, target: nil, action: nil)
        let albumItem = UIBarButtonItem(title: "Album", style: .done, target: nil, action: nil)
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 100
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
            takePhoto.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        
        
        
//
        toolBar.items = [fixedSpace, cameraItem, spaceItem, albumItem, fixedSpace]

        
        imagePickerView.translatesAutoresizingMaskIntoConstraints  = false
        imagePickerView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        imagePickerView.bottomAnchor.constraint(equalTo: toolBar.topAnchor).isActive = true
        imagePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imagePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        imagePickerView.backgroundColor = UIColor.brown
        
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.topAnchor.constraint(equalTo: imagePickerView.bottomAnchor).isActive = true
        toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        toolBar.backgroundColor = UIColor.cyan
        
        
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Keyboard Notifications
    
//    func subscribeToKeyboardNotifications() {
//        NotificationCenter.default.addObserver(self, selector: #selector(MemeEditorViewController.keyBoardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(MemeEditorViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//    }
//    
//    func unsubscribeToKeyboardNotifications() {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//    }
//    
//    func keyBoardWillShow(_ notification: Notification) {
//        let userInfo = (notification as NSNotification).userInfo
//        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
//        let keyboardHeight = keyboardSize.cgRectValue.height
//        
//        //if editing is started in bottom textfield, frame moves up to avoid textfield being covered by the keyboard, if not already moved up
//        if bottomText.isFirstResponder && view.frame.origin.y == 0 {
//            view.frame.origin.y = keyboardHeight * (-1)
//        }
//    }
//    
//    func keyboardWillHide(_ notification: Notification) {
//        if bottomText.isFirstResponder && view.frame.origin.y != 0 {
//            view.frame.origin.y = 0
//        }
//    }
//    
//    
//    
    
    //MARK: TextField Functions
    func setupTextfield(textField:UITextField, withText text: String){
        //establish current class as delegate
        textField.delegate = self
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .center
        textField.text = text
        textField.placeholder = text
        
    }
    
    
    
    //MARK: Logic functions
    
    
    func generateMeme() -> UIImage {
        //TODO
        return UIImage()
    }
    func saveMeme() {
        //TODO
    }
    
    func selectImage() {
        //TODO
    }
    
    func takePhotoNow(sender: UIBarButtonItem) {
        
        //TODO
    }
    
    func pickImage() {
        //TODO
    }
    
    func setFirstScence() {
        //TODO
    }
    
    func shareImage() {
        //TODO
    }
    
    func cancelAction(sender: UIBarButtonItem) {
        
    }


}

