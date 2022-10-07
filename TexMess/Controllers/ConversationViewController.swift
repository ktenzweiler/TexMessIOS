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
        conversationTable.register(UINib(nibName:K.convoCellIdentifier, bundle: nil),
                                   forCellReuseIdentifier: K.convoCellIdentifier)
        loadConversations()
    }
    
    func loadConversations() {
        //db.collection(K.FStore.)
    }
}
