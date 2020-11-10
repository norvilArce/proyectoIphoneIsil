//
//  RegisterViewController.swift
//  ProyectoIphoneIsil
//
//  Created by user178680 on 10/10/20.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var apellidoTextField: UITextField!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var carreraTextField: UITextField!
    @IBOutlet weak var sedeTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       title = "Registro"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().createUser(withEmail: email, password: password) {
                (result, error) in
                if let result = result, error == nil {
                    self.navigationController?.show(AuthViewController(), sender: Any?.self)
                }else{
                    
                    let alertController = UIAlertController(title: "Error", message: "No se pudo completar registro", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
}
