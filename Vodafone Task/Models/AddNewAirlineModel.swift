//
//  AddNewAirlineModel.swift
//  Vodafone Task
//
//  Created by Admin on 22/09/2021.
//

import Foundation


struct AddNewAirlineModel : Codable {
    let id : String?
    let name : String?
    let country : String?
    let slogan : String?
    let head_quaters : String?
    let v : Int?
    let message: String?

    enum CodingKeys: String, CodingKey {

        case id = "_id"
        case name = "name"
        case country = "country"
        case slogan = "slogan"
        case head_quaters = "head_quaters"
        case v = "__v"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        slogan = try values.decodeIfPresent(String.self, forKey: .slogan)
        head_quaters = try values.decodeIfPresent(String.self, forKey: .head_quaters)
        v = try values.decodeIfPresent(Int.self, forKey: .v)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
