//
//  InvitationViewController.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 10/9/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class InvitationsViewController: UIViewController {
    
    @IBOutlet weak var invitationsTable: UITableView!
    
    let db = Firestore.firestore()
    
    var invitations: [Invitation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invitationsTable.dataSource = self
        invitationsTable.register(UINib(nibName: K.invitationCellNibName, bundle: nil), forCellReuseIdentifier: K.invitationCellId)
    }
}

extension InvitationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return invitations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let invitation = invitations[indexPath.row]
        if invitation.originatorId == Auth.auth().currentUser?.uid {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.invitationCellId, for: indexPath) as! InvitationCell
            var names = ""
            invitation.recipientsNames?.forEach { recipient in
                names = names + (recipient ?? "") + ", "
            }
            cell.invitationLable.text = "from: " + invitation.originatorName + " to: " + names
            
            cell.invitationLable.backgroundColor = UIColor(named:K.BrandColors.lightPurple)
            
            cell.invitationLable.textColor = UIColor(named: K.BrandColors.purple)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.invitationCellId, for: indexPath) as! InvitationCell
            var names = ""
            invitation.recipientsNames?.forEach { recipient in
                names = names + (recipient ?? "") + ", "
            }
            cell.invitationLable.text = "from: " + invitation.originatorName + " to: " + names
            
            cell.invitationLable.backgroundColor = UIColor(named:K.BrandColors.lightPurple)
            
            cell.invitationLable.textColor = UIColor(named: K.BrandColors.purple)
            return cell
        }
    }
}
