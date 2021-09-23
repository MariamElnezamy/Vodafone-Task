//
//  Constants.swift
//  Vodafone Task
//
//  Created by Admin on 20/09/2021.
//

import Alamofire

let header: HTTPHeaders = ["accept": "application/json",
                           "Content-Type": "application/json"]

let baseURL = "https://api.instantwebtools.net/v1/"
let allAirlineURL = "\(baseURL)airlines"
let allAirlineByIDURL = "\(baseURL)airlines/"
