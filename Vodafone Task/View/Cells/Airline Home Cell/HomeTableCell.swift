//
//  HomeTableCell.swift
//  Vodafone Task
//
//  Created by Admin on 20/09/2021.
//

import UIKit

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        mainViewUI()
    }

    func bind(airline: AirlineModel?){
        nameLabel.text = airline?.name
    }
    func setupUI(){
        selectionStyle = .none
        backgroundColor = .clear
    }
    func mainViewUI(){
        mainView.roundCorners(radius: 5)
        getShadow(yourView: mainView)
    }
}
