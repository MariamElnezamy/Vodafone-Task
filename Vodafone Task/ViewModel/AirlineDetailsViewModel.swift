//
//  AirlineDetailsViewModel.swift
//  Vodafone Task
//
//  Created by Admin on 22/09/2021.
//

import Foundation

class AirlineDetailsViewModel {
    
    var logo = ""
    var websiteURL = ""
    var airlineDetails: AirlineModel?
    var bindData: (() -> Void)?
    var error: ((Error?) -> Void)?
    var refreshData: (() -> Void)?
    
    func getAirlineData(){
        if airlineDetails?.id == nil {
            bindData?()
        }else{
            getAirlineDetails()
        }
    }
    
    func getAirlineDetails(){
        guard let id = airlineDetails?.id else {return}
        let url = "\(allAirlineByIDURL)\(id)"

        Services.shared.GetData(url: url, parameters: nil, headers: header) { (data: AirlineModel?,error: Error?) in
            if let error = error {
                self.error?(error)
                self.offlineData()
                print(error.localizedDescription)
            }else{
                self.airlineDetails = data
                self.bindData?()
            }
        }
    }
    func offlineData(){
        bindData?()
    }
}
