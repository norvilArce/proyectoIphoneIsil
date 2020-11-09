//
//  ViewController.swift
//  ProyectoIphoneIsil
//
//  Created by user178680 on 9/26/20.
//

import UIKit

class ViewController: UIViewController {
    
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
           print("EL TECLADO APARECE")
           
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

}

