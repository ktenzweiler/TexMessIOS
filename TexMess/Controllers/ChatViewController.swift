//
//  ChatViewController.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/11/22.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    let db = Firestore.firestore()
    
    var messages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName:K.cellNibName, bundle: nil), forCellReuseIdentifier: K.messageCellId)
        navigationItem.title = K.appName
        navigationItem.hidesBackButton = true
        loadMessages()
    }
    
    func loadMessages() {
        db.collection(K.FStore.messages)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
                self.messages = []
                if let e = error {
                    print("error fetching messages \(e)")
                } else {
                    if let snapshotDocs = querySnapshot?.documents {
                        for doc in snapshotDocs {
                            let data = doc.data()
                            if let sender = data[K.FStore.senderField] as? String, let body = data[K.FStore.bodyField] as? String {
                                let message = Message(sender: sender, body: body)
                                self.messages.append(message)
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                }
                            }
                        }
                    }
                }
            }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let user = Auth.auth().currentUser?.email {
            db.collection(K.FStore.messages)
                .addDocument(data: [K.FStore.senderField : user,
                                    K.FStore.bodyField: messageBody,
                                    K.FStore.dateField: Date.init().timeIntervalSince1970]) { (error) in
                    if let e = error {
                        print("issue saving data to firestore \(e)")
                    } else {
                        print("Successfully saved data")
                        self.messageTextfield.text = ""
                    }
                }
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        if message.sender == Auth.auth().currentUser?.email {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.messageCellId, for: indexPath) as! MessageCell
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named:K.BrandColors.lightPurple)
            cell.label.text = messages[indexPath.row].body
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.messageCellId, for: indexPath) as! MessageCell
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named:K.BrandColors.purple)
            cell.label.text = messages[indexPath.row].body
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
            return cell
        }
    }
}
