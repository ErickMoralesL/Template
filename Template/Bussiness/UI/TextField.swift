//
//  TextField.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 18/02/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class TextField: UITextField, UITextFieldDelegate
{
    var scroll: UIScrollView!
    var valueYPosition: CGFloat!
    var lblErrorMessage: UILabel?
    
//    init()
//    {
//        //self.delegate = self
//    }
    
    public func addViewContent(view: UIView, scroll: UIScrollView)
    {
        self.scroll = scroll
        
        valueYPosition = view.frame.origin.y
        
        self.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    //MARK: TextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Keyboard event
    
    @objc func keyboardWillShow(notification: NSNotification)
    {
        self.clearTextFieldValidation()
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        {
            scroll.setContentOffset(CGPoint(x: 0, y: self.frame.origin.y - keyboardSize.height + self.frame.size.height), animated:true)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification)
    {
        scroll.setContentOffset(CGPoint.zero, animated:true)
    }
    
    //MARK: -Validations Results
    public func showValidationError(errorMessage: String)
    {
    self.clearTextFieldValidation()
    
    lblErrorMessage = UILabel(frame: CGRect(x: 0, y: self.frame.size.height + 8, width: self.frame.size.width, height: 25))
        lblErrorMessage?.textAlignment = NSTextAlignment.right
        lblErrorMessage?.font = UIFont.systemFont(ofSize: 10.0)
        lblErrorMessage?.textColor = UIColor.red
        lblErrorMessage?.text = errorMessage;
    
        lblErrorMessage?.alpha = 0.0;
    
    UIView.animate(withDuration: 1.0) {
        self.lblErrorMessage?.alpha = 1.0
    }
    
        self.addSubview(lblErrorMessage!)
    }

    public func clearTextFieldValidation()
    {
        lblErrorMessage?.removeFromSuperview()
        lblErrorMessage = nil
    }
}
