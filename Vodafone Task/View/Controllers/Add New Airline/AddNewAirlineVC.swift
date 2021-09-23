//
//  AddNewAirlineVC.swift
//  Vodafone Task
//
//  Created by Admin on 21/09/2021.
//

import UIKit

class AddNewAirlineVC: UIViewController, KeyboardHandler, UITextFieldDelegate {
    
    var bottomInset: CGFloat = 70.0
    var viewModel = AddNewAirlineViewModel()
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sloganTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var headquartersTextField: UITextField!
    @IBOutlet weak var cancelTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var barBottomConstraint: NSLayoutConstraint!

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelTextField.delegate = self
        setupConfirmButtonUI()
        setupCancelButtonUI()
        setupMainViewUI()
        bindUI()
        addKeyboardObservers { ( state) in
            print(state)
        }
    }

    @IBAction func confirmButton(sender: UIButton) {
        checkAddNewAirlineCasses()
    }
    
    @IBAction func cancelButton(sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    func checkAddNewAirlineCasses() {
        guard let name = self.nameTextField.text else { return }
        guard let slogan = self.sloganTextField.text else { return }
        guard let country = self.countryTextField.text else { return }
        guard let headquarters = self.headquartersTextField.text else { return }
        guard let cancel = self.cancelTextField.text else { return }
        self.viewModel.addNewAirlineFun(name: name, country: country, headquarters: headquarters, slogan: slogan, cancel: cancel)
    }
    func bindUI(){
        viewModel.error = { [weak self] error in
            self?.customAlert("Error", error?.localizedDescription ?? "")
        }
        viewModel.success = { [weak self] in
            self?.navigationController?.popViewController(animated: false)
        }
        viewModel.massage = { [weak self] msg in
            self?.customAlert("Error",  msg)
        }
    }
    func setupConfirmButtonUI(){
        confirmButton.clipsToBounds = true
        confirmButton.layer.cornerRadius = 6
    }
    func setupCancelButtonUI(){
        cancelButton.clipsToBounds = true
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.layer.borderWidth = 0.5
        cancelButton.layer.cornerRadius = 6
    }
    func setupMainViewUI(){
        DispatchQueue.main.async {
            self.mainView.roundCornersToSide(corners: [.topRight, .topLeft], radius: 30)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
