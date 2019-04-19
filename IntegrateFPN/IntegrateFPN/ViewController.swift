//
//  ViewController.swift
//  IntegrateFPN
//
//  Created by Karina on 4/19/19.
//  Copyright © 2019 Ka Fer. All rights reserved.
//

import FlagPhoneNumber
import UIKit

class ViewController: UIViewController {
    
    var phoneNumberTextField: FPNTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextField = FPNTextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 16, height: 50))
        phoneNumberTextField.borderStyle = .roundedRect
        
       phoneNumberTextField.delegate = self
        
        phoneNumberTextField.hasPhoneNumberExample = true
        view.addSubview(phoneNumberTextField)
        
        phoneNumberTextField.center = view.center
    }

}

extension ViewController: FPNTextFieldDelegate {
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        textField.rightViewMode = .always
        textField.rightView = UIImageView(image: isValid ? #imageLiteral(resourceName: "success") : #imageLiteral(resourceName: "error"))
        
        print(
            isValid,
            textField.getRawPhoneNumber() ?? "is valid"
        )
    }
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }
    
}
