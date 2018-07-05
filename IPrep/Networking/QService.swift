//
//  QService.swift
//  IPrep
//
//  Created by IKNS on 7/4/18.
//  Copyright © 2018 Satish Kumar R Kancherla. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

let apikey = "$2a$10$PCXBwImpAiU2b3WtMEz18O9/WRhdZklw1zAJFBDG/BOqc/YnecmNa"

class QService: NSObject{
    static var instance = QService()
    
    func getAllQuestions(success:@escaping ([CModel]) -> Void, failure:@escaping (Error) -> Void){
        let url = "//api.jsonbin.io/b/5b3d6cdc4d5ea95c8ba09e2d/1"
        ApiClient.requestGETURL(url, success: {json in
            guard let info = Mapper<QModel>().map(JSONObject: json.rawValue), let categories = Mapper<CModel>().mapArray(JSONObject: info.goodStuff) else{
                success([])
                return
            }
            success(categories)
        }, failure: {error in
            failure(error)
        })
        
    }
    
}
