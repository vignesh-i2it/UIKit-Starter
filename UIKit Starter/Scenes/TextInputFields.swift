//
//  TextInputFields.swift
//  UIKit Starter
//
//  Created by Vignesh on 24/07/23.
//

import Foundation
import UIKit

class TextInputFields: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var phoneError: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func emailChanged(_ sender: Any) {
    }

    @IBAction func passwordChanged(_ sender: Any) {
    }
    
    @IBAction func phoneChanged(_ sender: Any) {
    }
    
    @IBAction func submitAction(_ sender: Any) {
    }
    
}
