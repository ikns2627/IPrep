//
//  Models.swift
//  IPrep
//
//  Created by IKNS on 7/4/18.
//  Copyright © 2018 Satish Kumar R Kancherla. All rights reserved.
//

import Foundation
import ObjectMapper

class QModel: Mappable{
    required init?(map: Map) {}
    var goodStuff: [CModel]?
    func mapping(map: Map) {
        goodStuff    <- map["goodStuff"]
    }
}

class CModel: Mappable{
    required init?(map: Map) {}
    var category: String?
    var questions: [SModel]?
    func mapping(map: Map) {
        category    <- map["category"]
        questions       <- map["questions"]
    }
}

class SModel: Mappable{
    required init?(map: Map) {}
    var name: String?
    var link: String?
    func mapping(map: Map) {
        name    <- map["name"]
        link       <- map["link"]
    }
}
