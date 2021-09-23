//
//  SearchTableCell.swift
//  Vodafone Task
//
//  Created by Admin on 21/09/2021.
//

import UIKit

class SearchTableCell: UITableViewCell, UITextFieldDelegate {

    var onTextEdit: ((String)->())?
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        searchButton.roundCorners(radius: 10)
    }

    @IBAction func searchButton(sender: UIButton) {
        let text = searchTextField.text ?? ""
        onTextEdit?(text)
    }
    
}
