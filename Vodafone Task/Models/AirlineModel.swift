//
//  AirlineModel.swift
//  Vodafone Task
//
//  Created by Admin on 20/09/2021.
//

import Foundation

struct AirlineModel : Codable {
    var id : Int?
    var name : String?
    var country : String?
    var logo : String?
    var slogan : String?
    var head_quaters : String?
    var website : String?
    var established : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case country = "country"
        case logo = "logo"
        case slogan = "slogan"
        case head_quaters = "head_quaters"
        case website = "website"
        case established = "established"
    }

    init(){
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do{
            id = try values.decodeIfPresent(Int.self, forKey: .id)
        } catch{
            self.id = nil
        }
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        logo = try values.decodeIfPresent(String.self, forKey: .logo)
        slogan = try values.decodeIfPresent(String.self, forKey: .slogan)
        head_quaters = try values.decodeIfPresent(String.self, forKey: .head_quaters)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        established = try values.decodeIfPresent(String.self, forKey: .established)
    }

}
