//
//  Airline+TableView.swift
//  Vodafone Task
//
//  Created by Admin on 20/09/2021.
//

import UIKit

extension AirlineVC {
    
    func setUpCardTableView(){
        airlineTableView.delegate = self
        airlineTableView.dataSource = self
        airlineTableView.separatorStyle = .none
        let headerNib = UINib(nibName: searchTableCell, bundle: nil)
        airlineTableView.register(headerNib, forCellReuseIdentifier: searchTableCell)
        let mainNib = UINib(nibName: airlineCell, bundle: nil)
        airlineTableView.register(mainNib, forCellReuseIdentifier: airlineCell)
        let nibAddCell = UINib(nibName: addTableCell, bundle: nil)
        airlineTableView.register(nibAddCell, forCellReuseIdentifier: addTableCell)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: searchTableCell) as! SearchTableCell
        headerCell.onTextEdit = { [weak self] (text) in
            self?.viewModel.getSearchItem(text: text)
        }
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.airlinesFilterResultArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = airlineTableView.dequeueReusableCell(withIdentifier: airlineCell, for: indexPath) as! HomeTableCell
        cell.bind(airline: viewModel.airlinesFilterResultArray?[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(identifier: "AirlineDetailsVC") as! AirlineDetailsVC
            vc.viewModel.airlineDetails = viewModel.airlinesFilterResultArray?[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
