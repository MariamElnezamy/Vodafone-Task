//
//  AddNewAirlineViewModel.swift
//  Vodafone Task
//
//  Created by Admin on 22/09/2021.
//

import Foundation

class AddNewAirlineViewModel {
    
    var airlineDetailsModel: AirlineModel?
    var success: (() -> Void)?
    var error: ((Error?) -> Void)?
    var massage: ((String) -> Void)?
    
    func addNewAirlineFun(name: String, country: String, headquarters: String, slogan: String, cancel: String){
        let parameters = ["name": name,
                          "country": country,
                          "head_quaters": headquarters,
                          "slogan": slogan,
                          "cancel": cancel]
        Services.shared.PostData(url: allAirlineURL, parameters: parameters, headers: header) { (data: AddNewAirlineModel?, error: Error?) in
            if error != nil {
                self.error?(error)
            }else{
                if data?.message != nil {
                    self.massage?(data?.message ?? "Someting Wrong")
                }else{
                    self.success?()
                }
            }
        }
    }
}
