//
//  LoginViewController.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/11/22.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseEmailAuthUI

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        let authUI = FUIAuth.defaultAuthUI()
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        authUI?.delegate = self
        
        let providers: [FUIAuthProvider] = [
          FUIGoogleAuth(authUI: FUIAuth.defaultAuthUI()!),
          FUIEmailAuth()
        ]
        authUI?.providers = providers
        
        let authViewController = (authUI?.authViewController())!
       
        self.present(authViewController, animated: false, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print("error = \(e)")
                } else {
                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}

extension LoginViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        let email = authDataResult?.user.email
        var firstName = ""
        var lastName = ""
        
        if let displayName = authDataResult?.user.displayName {
            let nameArray = displayName.components(separatedBy: " ")
            firstName = String(nameArray[0])
            lastName = String(nameArray[1])
        }
        
      // val pubKey = it.get("publicKey").toString()
//                           val signingKey = it.get("signingKey").toString()
//                           val localPubKey = CryptoUtils.getKey(PUBLIC_KEY)
//                           val localSigningKey = CryptoUtils.getKey(SIGNING_KEY)

        
        let docRef = db.collection(K.FStore.users).document((authDataResult?.user.uid)!)
        let cryptoUtils = CryptoUtils()
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                var user = User(document: document)
                
                
                if user?.publicKey == nil {
                    user?.publicKey = cryptoUtils.generateEncryptionKey()
                }
                
                if user?.signingKey == nil {
                    user?.signingKey = cryptoUtils.generateSigningKey()
                }
                saveUserToFirestore(user)               
            } else {
               // let publicKey = CryptoUtils.generateEncryptionKey()
                let signingKey = cryptoUtils.generateSigningKey()
                let pubKey = cryptoUtils.generateEncryptionKey()
                let user = User(firstName: firstName, lastName: lastName, email: email, publicKey: pubKey, signingKey: signingKey, invitations: nil, blockedUsers: nil)
                saveUserToFirestore(user)
            }
        }
    }
}
