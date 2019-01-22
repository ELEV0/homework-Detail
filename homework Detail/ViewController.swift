//
//  ViewController.swift
//  homework Detail
//
//  Created by Admin on 22.01.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol Sendable {
    func passData(data: Quote)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            if textView.text == "Entry your note" {
                textView.textColor = .gray
            }
            textView.textColor = .black
        }
    }
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.text = ""
        }
    }
    
    @IBOutlet weak var saveButton: UIButton!
    
    var quote: Quote!
    var bool = true
    
    var textFromTextView = ""
    var textFromTextField = ""
    
    var delegate: Sendable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        delegate = navigationController?.viewControllers.first as? Sendable
        updateUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
    

    func updateUI() {
        if let quote = quote {
            textView.text = quote.text
            textField.text = quote.author
        } else {
            textField.placeholder = "Author"
        }
    }

    @IBAction func saveAction(_ sender: UIButton) {
        setting()
    }
    
    func setting() {
        textFromTextView = textView.text
        textFromTextField = textField.text!
        
        if textFromTextView.isEmpty || textFromTextField.isEmpty {
            alert(text: "Заполни поля", action: "Cancel")
            
        } else if !textFromTextView.isEmpty && !textFromTextField.isEmpty {
            quote = Quote(text: textView.text, author: textField.text!)
            delegate.passData(data: quote)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    func alert(text: String, action: String) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default))
        present(alert, animated: true)
    }
    
}


extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Entry your note" {
            textView.text.removeAll()
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Entry your note"
            textView.textColor = .gray
        }
        textView.textColor = .black
    }
}
