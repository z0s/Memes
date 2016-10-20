//
//  MemesEditorViewController.swift
//  Memes
//
//  Created by IT on 9/22/16.
//  Copyright © 2016 z0s. All rights reserved.
//

import UIKit

class MemesEditorViewController: UIViewController, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
  
    lazy var imagePickerView: UIImageView = {
        let imageView = UIImageView()
        
        self.view.addSubview(imageView)
        return imageView
    }()
    
    lazy var takePhoto: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem()
        return barButtonItem
    }()
    lazy var cancelButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem()
        return barButtonItem
    }()
    
    lazy var topText: UITextField = {
        let textField = UITextField()
        self.view.addSubview(textField)
        return textField
    }()
    lazy var bottomText: UITextField = {
        let textField = UITextField()
        self.view.addSubview(textField)
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
    

    
    let memeTextAttributes  = [NSStrokeColorAttributeName: UIColor.black,
                               NSForegroundColorAttributeName: UIColor.white,
                               NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!, NSStrokeWidthAttributeName: -3, NSBackgroundColorAttributeName: UIColor.clear] as [String:Any]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        
        setFirstScene()
        view.sendSubview(toBack: imagePickerView)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction(sender:)))
        
        
        shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage(sender:)))
        
        
        //TODO: Put up a navigation bar or Show?

        navigationItem.leftBarButtonItem = shareButton
        
        navigationItem.rightBarButtonItem = cancelButton
        
        
        
        
        takePhoto = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(takePhotoNow(sender:)))
        let albumItem = UIBarButtonItem(title: "Album", style: .done, target: self, action: #selector(pickImage(sender:)))
        
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 100
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
            takePhoto.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        

        toolBar.items = [fixedSpace, takePhoto, spaceItem, albumItem, fixedSpace]

        
        imagePickerView.translatesAutoresizingMaskIntoConstraints  = false
        imagePickerView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        imagePickerView.bottomAnchor.constraint(equalTo: toolBar.topAnchor).isActive = true
        imagePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imagePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.topAnchor.constraint(equalTo: imagePickerView.bottomAnchor).isActive = true
        toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topText.translatesAutoresizingMaskIntoConstraints = false
        topText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topText.centerYAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 100).isActive = true
        
        bottomText.translatesAutoresizingMaskIntoConstraints = false
        bottomText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomText.centerYAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -100).isActive = true
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        takePhoto.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        
        subscribeToKeyboardNotifications()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeToKeyboardNotifications()
        
    }
    
    
    //MARK: Keyboard Notifications
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(MemesEditorViewController.keyboardWillShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(MemesEditorViewController.keyboardWillHide(note:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeToKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(note: Notification) {
        let userInfo = (note as NSNotification).userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        let keyboardHeight = keyboardSize.cgRectValue.height
        
        cancelButton.isEnabled = false
        
        if bottomText.isFirstResponder && view.frame.origin.y == 0 {
            view.frame.origin.y = keyboardHeight * (-1)
        }
        
    }
    func keyboardWillHide(note: Notification) {
        if bottomText.isFirstResponder && view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
        cancelButton.isEnabled = true
        
        
    }
    
    func setFirstScene() {
        setupTextfield(textField: topText, withText: "TOP")
        setupTextfield(textField: bottomText, withText: "BOTTOM")
        
        shareButton.isEnabled = false
        
        //Reset Image
        imagePickerView.image = nil
    }
    

    //MARK: TextField Functions
    func setupTextfield(textField:UITextField, withText text: String){
        //establish current class as delegate
        textField.delegate = self
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .center
        textField.text = text
        textField.placeholder = text
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            imagePickerView.contentMode = .scaleAspectFit
            imagePickerView.image = image
            shareButton.isEnabled = true
        }
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            textField.text = ""
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.frame.size.width < (view.frame.size.width - 20) {
            textField.frame.size.width += 20
            textField.frame.origin.x -= 10
        }
        return true
    }

    

    
    //MARK: Logic functions
    

    func generateMeme() -> UIImage {
        toolBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
        
        UIGraphicsBeginImageContextWithOptions(view.layer.bounds.size, true, 0)
        //UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        toolBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
        
        return memedImage
    }
    
    func saveMeme(memedImage: UIImage) {
        
        let text1 = topText.text!
        let text2 = bottomText.text!
        
        guard let image = imagePickerView.image else {
            return print("This image is still nil.")
        }
        
        let data = UIImagePNGRepresentation(image)
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docsDirectory = paths[0]
        let fileName = docsDirectory.appendingPathComponent("test.png")
        try? data?.write(to: fileName)
        
        let meme = Meme(topText: text1, bottomText: text2, image: image, memedImage: memedImage)
        
        appDelegate.memes.append(meme)
        
    }
    
    func selectImage(source: UIImagePickerControllerSourceType) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = source
        present(pickerController, animated: true, completion: nil)
    }
    
    func takePhotoNow(sender: UIBarButtonItem) {
        selectImage(source: .camera)
    }
    
    func pickImage(sender: UIBarButtonItem) {
        selectImage(source: .photoLibrary)
    }
    
    func shareImage(sender: UIBarButtonItem) {
        
        let memedImage = generateMeme()
        let activityController = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        
   
        
        activityController.completionWithItemsHandler = {
            activity, completed, items, error in
            
            if completed {
                self.saveMeme(memedImage: memedImage)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        present(activityController, animated: true, completion: nil)
        
        
    }
    
    func cancelAction(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        setFirstScene()
    }


}


