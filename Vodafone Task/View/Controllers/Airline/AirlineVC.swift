//
//  ViewController.swift
//  Vodafone Task
//
//  Created by Admin on 20/09/2021.
//

import UIKit

class AirlineVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let airlineCell = "HomeTableCell"
    let addTableCell = "AddTableCell"
    let searchTableCell = "SearchTableCell"
    let viewModel = AirlinesViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.title = "Countries"
    }
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var airlineTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAirlines()
        setUpCardTableView()
        bindUI()
        setupAddAirlineButton()
    }
    @IBAction func addButton(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "AddNewAirlineVC") as! AddNewAirlineVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func bindUI() {
        viewModel.error = { [weak self] error in
            self?.customAlert("Error", error?.localizedDescription.description ?? "")
        }
        viewModel.success = { [weak self] in
            self?.airlineTableView.reloadData()
        }
        viewModel.refreshData = { [weak self] in
            self?.airlineTableView.reloadData()
        }
    }
    func setupAddAirlineButton(){
        addButton.roundCorners(radius: 40)
    }
    
}
