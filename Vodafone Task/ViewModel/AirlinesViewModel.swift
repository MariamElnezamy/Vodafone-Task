//
//  AirlinesViewModel.swift
//  Vodafone Task
//
//  Created by Admin on 21/09/2021.
//

import Foundation

class AirlinesViewModel {
    
    var airlinesFilterResultArray: [AirlineModel]?
    var airlinesModel: [AirlineModel]?
    var success: (() -> Void)?
    var error: ((Error?) -> Void)?
    var refreshData: (() -> Void)?
    
    func getAirlines(){
        Services.shared.GetData(url: allAirlineURL, parameters: nil, headers: header) { (data: [AirlineModel]?,error: Error?) in
            if let error = error {
                self.localData()
                self.error?(error)
                print(error.localizedDescription)
            }else{
                DatabaseManager.shared.addAirlineListItems(data ?? [])
                self.airlinesModel = data
                self.airlinesFilterResultArray = self.airlinesModel
                self.success?()
            }
        }
    }
    
    func getSearchItem(text: String) {
        if text.isEmpty {
            airlinesFilterResultArray = airlinesModel
        }else{
            let airlineSearchArray = airlinesModel?.filter {
                $0.name?.contains(text) == true || $0.country?.contains(text) == true || $0.id?.description.contains(text) == true
            }
            airlinesFilterResultArray = airlineSearchArray
        }
        
        refreshData?()
    }
    
    func localData(){
        let data = DatabaseManager.shared.getMapAirlineItem()
        self.airlinesModel = data
        self.airlinesFilterResultArray = self.airlinesModel
        self.success?()
    }
}
