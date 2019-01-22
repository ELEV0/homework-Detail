//
//  ViewController.swift
//  homework Detail
//
//  Created by Admin on 22.01.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var quote: Quote!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    func updateUI() {
        if let quote = quote {
            textView.text = quote.text
            textField.text = quote.author
        } else {
            textField.placeholder = "Author"
        }
    }
    
    var textFromTextView = ""
    var textFromTextField = ""

    @IBAction func saveAction(_ sender: UIButton) {
        textFromTextView = textView.text
        textFromTextField = textField.text!
        
        if textFromTextView.isEmpty || textFromTextField.isEmpty {
            alert(text: "Заполни поля", action: "Cancel")
            
        } else if !textFromTextView.isEmpty && !textFromTextField.isEmpty {
            Singleton.shared.quotes?.append(Quote(text: textView.text, author: textField.text!))
            print(Singleton.shared.quotes)
//            alert(text: "Quote was saved", action: "Ok")
        }
    }
    
    
    func alert(text: String, action: String) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default))
        present(alert, animated: true)
    }
    
}

