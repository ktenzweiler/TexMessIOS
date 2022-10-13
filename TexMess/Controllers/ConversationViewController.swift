//
//  ConversationViewController.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 10/4/22.
//

import UIKit
import Firebase

class ConversationViewController: UIViewController {
    
    @IBOutlet weak var conversationTable: UITableView!
    
    let db = Firestore.firestore()
    let me = Auth.auth().currentUser
    
    var convos : [Conversation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conversationTable.dataSource = self
        conversationTable.register(UINib(nibName:K.convoCellId, bundle: nil),
                                   forCellReuseIdentifier: K.convoCellId)
        loadConversations()
    }
    
    func loadConversations() {
        //db.collection(K.FStore.)
    }
}

extension ConversationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return convos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conversation = convos[indexPath.row]
        if conversation.originator == Auth.auth().currentUser?.email {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.convoCellId, for: indexPath) as! ConversationCell
            cell.leftAvatar.isHidden = true
            cell.conversationBubble.backgroundColor = UIColor(named:K.BrandColors.lightPurple)
            cell.label.text = convos[indexPath.row].recipients
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.convoCellId, for: indexPath) as! ConversationCell
            cell.leftAvatar.isHidden = false
            cell.conversationBubble.backgroundColor = UIColor(named:K.BrandColors.purple)
            cell.label.text = convos[indexPath.row].recipients
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
            return cell
        }
    }
}
