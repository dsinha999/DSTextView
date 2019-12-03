//
//  ViewController.swift
//  DSTextView
//
//  Created by Faiz Ashraf on 12/3/19.
//  Copyright © 2019 AIG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DSTextViewDelegate {
    
    @IBOutlet weak var textView: DSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Accessible Properties
        textView.padding = 12 // Same padding will be used for all sides | by default padding is 12
        textView.font = UIFont.systemFont(ofSize: 15) // Font for placeholder and DSTextView | by defaulr system font of size 15
        textView.editingAllowed = true // Editing is allowed or not | by default allowed
        textView.emojiAllowed = true // Emojis are allowed or not | by default allowed
        textView.maxLength = 200 // Max length of text | default is 200
        textView.returnKeyType = .default // Return type of the keyboard
        textView.keyboardType = .default // Keyboard type of the DSTextView
        textView.showDoneButton = true // Show toolbar or not with done button to dismiss DSTextView

        // Designable Properties
        textView.placeholder = "Write Something..." // Placeholder Text
        textView.placeholderColor = UIColor(white: 0.4, alpha: 1.0) // Placeholder Text
        textView.textColor = UIColor(white: 0.9, alpha: 1.0) // DSTextView Color
        
        textView.delegate = self // You can set through Storyboard also
        
        // Add border and rounded corner
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.borderWidth = 2
    }
    
    func dsTextViewDidChange(_ textView: UITextView) {
        print("Text Did Change")
    }
    
    func dsTextViewDidEndEditing(_ textView: UITextView) {
        print("Text Did End")
    }
    
    func dsTextViewDidBeginEditing(_ textView: UITextView) {
        print("Text Did Begin Editing")
    }
    
    func dsTextViewCharactersCount(_ count: Int) {
        print("Characters Count : \(count)")
    }
    

    @IBAction func resignAction(_ sender: Any) {
        textView.removeFirstResponder()
    }
    
    @IBAction func bocomeAction(_ sender: Any) {
        textView.makeFirstResponder()
    }
    
    
}

