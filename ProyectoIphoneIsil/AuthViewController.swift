//
//  AuthViewController.swift
//  ProyectoIphoneIsil
//
//  Created by user178680 on 9/26/20.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var forgotLabel: UILabel!
    @IBOutlet weak var rememberSwitch: UISwitch!
    
    @IBAction func clickBtnCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
        }

    override func viewDidLoad() {
           super.viewDidLoad()
           
           NotificationCenter.default.addObserver(self,
                                                  selector: #selector(self.keyboardWillShow(_:)),
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
           
           NotificationCenter.default.addObserver(self,
                                                  selector: #selector(self.keyboardWillHide(_:)),
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
       }
       
       @objc func keyboardWillShow(_ notification: Notification) {
           
           let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
           let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
           
           print(keyboardFrame)
           print(animationDuration)
       }
       
       @objc func keyboardWillHide(_ notification: Notification) {
           print("El TECLADO SE OCULTA")
       }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

    @IBAction func loginButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().signIn(withEmail: email, password: password) {
                (result, error) in
                if let result = result, error == nil {
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                }else{
                    
                    let alertController = UIAlertController(title: "Error", message: "No se pudo completar registro", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
        }
        
    }
    
    
    
}

