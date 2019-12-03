//
//  DSTextView.swift
//  DSTextView
//
//  Created by Faiz Ashraf on 12/3/19.
//  Copyright © 2019 AIG. All rights reserved.
//

import UIKit


@objc protocol DSTextViewDelegate: class {
    func dsTextViewDidChange(_ textView: UITextView)
    func dsTextViewDidEndEditing(_ textView: UITextView)
    func dsTextViewDidBeginEditing(_ textView: UITextView)
    func dsTextViewCharactersCount(_ count: Int)
}

extension DSTextViewDelegate {
    func dsTextViewDidChange(_ textView: UITextView) {}
    func dsTextViewDidEndEditing(_ textView: UITextView) {}
    func dsTextViewDidBeginEditing(_ textView: UITextView) {}
    func dsTextViewCharactersCount(_ count: Int) {}
}

@IBDesignable class DSTextView: UIView {
    
    public var padding: CGFloat = 12
    public var font: UIFont = UIFont.systemFont(ofSize: 15)
    public var editingAllowed: Bool = true
    public var emojiAllowed: Bool = true
    public var maxLength: Int = 200
    public var returnKeyType: UIReturnKeyType = .default
    public var keyboardType: UIKeyboardType = .default
    public var showDoneButton: Bool = true
    
    @IBOutlet weak var delegate: DSTextViewDelegate?
    
    // MARK: - Private Variables -
    private let textView = UITextView()
    private let placeholderLabel = UILabel()
    
    private let toolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = UIBarStyle.default
        toolbar.items =   [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneButtonTapped))
        ]
        toolbar.sizeToFit()
        return toolbar
    }()
    
     @IBInspectable public var placeholder: String? {
            get {
                return self.placeholderLabel.text
            }
            set {
                self.placeholderLabel.text = newValue
            }
        }
    
    @IBInspectable public var placeholderColor: UIColor? {
               get {
                   return self.placeholderLabel.textColor
               }
               set {
                   self.placeholderLabel.textColor = newValue
               }
           }
    
    
    @IBInspectable public var textColor: UIColor? {
        get {
            return self.textView.textColor
        }
        set {
            self.textView.textColor = newValue
        }
    }
    
    
    // MARK: - Life Cycle -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViewLayoutSubViews()
        refreshViewLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViewLayoutSubViews()
        refreshViewLayout()
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        refreshViewLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        refreshViewLayout()
    }
    
    // MARK: - Private Methods -
    
    private func refreshViewLayout() {
        self.clipsToBounds = true
        self.textView.clipsToBounds = true
        self.textView.layer.masksToBounds = true
        self.textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.textView.textContainerInset = UIEdgeInsets(top: 0, left: -3, bottom: 0, right: 0)
        self.textView.backgroundColor = .clear
        self.textView.font = self.font
        self.textView.delegate = self
        self.textView.returnKeyType = self.returnKeyType
        self.textView.inputAccessoryView = self.showDoneButton ? self.toolbar : nil
        self.textView.keyboardType = self.keyboardType
        
        self.placeholderLabel.font = self.font
        self.placeholderLabel.numberOfLines = 2
        self.placeholderLabel.backgroundColor = .clear
        
    }
    
    private func addViewLayoutSubViews() {
        // add subViews
        self.addSubview(self.textView)
        self.addSubview(placeholderLabel)
        
        // add text view constraints
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: self.padding).isActive = true
        self.textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1 * self.padding).isActive = true
        self.textView.topAnchor.constraint(equalTo: topAnchor, constant: self.padding).isActive = true
        self.textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1 * self.padding).isActive = true
        
        // add placeholder label
        self.placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: self.padding).isActive = true
        self.placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1 * self.padding).isActive = true
        self.placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: self.padding).isActive = true
    }
    
    
    //MARK:- Toolbar Methods
    
    @objc func doneButtonTapped() {
        self.textView.resignFirstResponder()
    }
    
    
    public func removeFirstResponder() {
        self.textView.resignFirstResponder()
    }

    public func makeFirstResponder() {
        self.textView.becomeFirstResponder()
    }
    
}


extension DSTextView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        if (textView.text ?? "").count > 0 {
            self.placeholderLabel.alpha = 0
        } else {
            self.placeholderLabel.alpha = 1
        }
        self.delegate?.dsTextViewCharactersCount((textView.text ?? "").count)
        self.delegate?.dsTextViewDidChange(textView)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if !text.canBeConverted(to: .ascii), emojiAllowed == false {
            return false
        }
        
        return textView.text.count + (text.count - range.length) <= maxLength;
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if (textView.text ?? "").count > 0 {
            self.placeholderLabel.alpha = 0
        } else {
            self.placeholderLabel.alpha = 1
        }
        
        self.delegate?.dsTextViewDidEndEditing(textView)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if (textView.text ?? "").count > 0 {
            self.placeholderLabel.alpha = 0
        } else {
            self.placeholderLabel.alpha = 1
        }
        
        self.delegate?.dsTextViewDidBeginEditing(textView)
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return self.editingAllowed
    }

    
}

