//
//  MemesTableViewController.swift
//  Memes
//
//  Created by IT on 10/9/16.
//  Copyright © 2016 z0s. All rights reserved.
//

import UIKit

class MemesTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sent Memes"
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMeme))

        
        
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        
//        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        
//        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
   
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appDelegate.memes.count
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMeme = appDelegate.memes[(indexPath as NSIndexPath).row]
        let vc = MemesDetailViewController()
        vc.selectedMeme = selectedMeme
        navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) 
        
        let myLabel = UILabel()
        
        
        
        // Configure the cell...
        let meme = appDelegate.memes[(indexPath as NSIndexPath).row]
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = meme.topText
        cell.contentView.addSubview(myLabel)
       
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        myLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 200).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        myLabel.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        myLabel.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        myLabel.text = meme.bottomText
        return cell
    }
    
    func addMeme() {
        
        let vc = UINavigationController(rootViewController: MemesEditorViewController())
        navigationController?.present(vc, animated: true, completion: nil)
    }

 



}
