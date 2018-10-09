//
//  ChatViewController.swift
//  ParseChat
//
//  Created by MacBookPro9 on 10/5/18.
//  Copyright © 2018 MacBookPro9. All rights reserved.
//

import UIKit
import Parse


class ChatViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    
    

    
    @IBAction func chatSendMsg(_ sender: Any) {
        let Chatmessage = chatMessageField.text ?? ""
        let currentUser = PFUser.current()!
        
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = Chatmessage
        chatMessage["user"] = currentUser
        
        chatMessage.saveInBackground{(success: Bool, error: Error?) in
            if (success){
                print("The message was saved Successfully by \(currentUser)")
                self.messages.append(chatMessage)
                
                self.chatTableView.reloadData()
                
            }else if let error = error{
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return messages.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
        let chatMessage = messages[indexPath.row]
        
        if let user = chatMessage["user"] as? PFUser {
            // User found! update username label with username
            cell.labelUsername.text = user.username!+":"
        } else {
            // No user found, set default username
            cell.labelUsername.text = "🤖"
        }
        cell.labelMessage.text = (chatMessage["text"] as! String)
        
        return cell
    }
    
    
    var messages = [PFObject]()
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var acIndicator: UIActivityIndicatorView!
    @IBOutlet weak var chatMessageField: UITextField!
    
    @IBAction func sendmsgBtn(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatMessageField.text ?? " "
        
        chatMessage.saveInBackground{ (success, error) in
            if success{
                
            }
            
            
        }
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.estimatedRowHeight = 100
        chatTableView.rowHeight = UITableViewAutomaticDimension
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
