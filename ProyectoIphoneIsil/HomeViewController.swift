//
//  HomeViewController.swift
//  ProyectoIphoneIsil
//
//  Created by user178958 on 11/9/20.
//

import UIKit

enum ProviderType: String {
    case basic
}

class HomeViewController: UIViewController {

    private let email: String
    private let provider: ProviderType
    
    init(email:String, provider: ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
