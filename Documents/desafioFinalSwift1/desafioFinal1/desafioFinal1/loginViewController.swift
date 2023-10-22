//
//  loginViewController.swift
//  desafioFinal1
//
//  Created by Gustavo Matoso on 15/10/23.
//

import UIKit
import CoreData
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        
        guard let email = emailTextField.text, let password = passwordTextField.text else{
            print("Por favor, preencha todos os campos")
                   return
        }
        
        firebaseAuth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            if let error = error{
                print("Erro ao fazer login:", error.localizedDescription)
                      } else {
                          // O login foi bem-sucedido
                          print("Login realizado com sucesso")
                          // Você pode redirecionar o usuário para a próxima tela ou executar outras ações)
                          DispatchQueue.main.async {
                              self?.performSegue(withIdentifier: "loginToTable", sender: self)
                          }
          }
        }
        
        
    }
    
    
}
