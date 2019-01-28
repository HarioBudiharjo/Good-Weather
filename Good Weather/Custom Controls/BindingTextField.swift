//
//  BindingTextField.swift
//  Good Weather
//
//  Created by Hario Budiharjo on 28/01/19.
//  Copyright © 2019 Hario Budiharjo. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = {_ in}
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func bind(callback: @escaping (String)->()){
        self.textChangeClosure = callback
    }
    
    private func commonInit(){
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc func textFieldChange(_ textField: UITextField){
        if let text = textField.text{
            self.textChangeClosure(text)
        }
    }
}
