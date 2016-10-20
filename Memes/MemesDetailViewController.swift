//
//  MemesDetailViewController.swift
//  Memes
//
//  Created by IT on 10/13/16.
//  Copyright © 2016 z0s. All rights reserved.
//

import UIKit

class MemesDetailViewController: UIViewController {
    
    let detailImageView = UIImageView()
    
    var selectedMeme: Meme!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(detailImageView)
        
        detailImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        detailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        detailImageView.image = selectedMeme.memedImage
        detailImageView.contentMode = .scaleAspectFit
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
