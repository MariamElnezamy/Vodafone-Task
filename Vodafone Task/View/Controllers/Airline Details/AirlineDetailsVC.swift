//
//  AirlineDetailsVC.swift
//  Vodafone Task
//
//  Created by Admin on 21/09/2021.
//

import UIKit
import Kingfisher

class AirlineDetailsVC: UIViewController {

   
    let viewModel = AirlineDetailsViewModel()
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sloganLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var visitButton: UIButton!
    @IBOutlet weak var imageAirline: UIImageView!

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.title = "Countries"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAirlineDetails()
        setupMainViewUI()
        setupVisitButton()
        bindUI()
        viewModel.getAirlineData()
    }

    @IBAction func visitButton(sender: UIButton) {
        openURL(url: viewModel.websiteURL)
    }

    func setupMainViewUI(){
        mainView.roundCorners(radius: 6)
        mainView.getShadow(yourView: mainView)
    }
    func setupVisitButton(){
        visitButton.clipsToBounds = true
        visitButton.roundCorners(radius: 6)
    }
    func bindUI(){
        viewModel.bindData = { [weak self] in
            self?.bindData()
        }
    }
    
    func bindData(){
        nameLabel.text = viewModel.airlineDetails?.name
        countryLabel.text = viewModel.airlineDetails?.country
        sloganLabel.text = viewModel.airlineDetails?.slogan
        viewModel.websiteURL = viewModel.airlineDetails?.website ?? ""
        let url = Foundation.URL(string: viewModel.airlineDetails?.logo ?? "")
        imageAirline.kf.indicatorType = .activity
        imageAirline.kf.setImage(with: url)
    }
    
}
