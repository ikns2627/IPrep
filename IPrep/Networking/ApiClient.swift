//
//  ApiClient.swift
//  IPrep
//
//  Created by IKNS on 7/4/18.
//  Copyright © 2018 Satish Kumar R Kancherla. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import SwiftyJSON

class ApiClient: NSObject{
    class func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        var urlRequest = URLRequest(url: URL(string: strURL)!)
        urlRequest.allHTTPHeaderFields = ["secret-key":apikey]
        Alamofire.request(urlRequest).responseJSON { (responseObject) -> Void in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                print(resJson)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    class func requestPOSTURL(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    class func requestDELURL(_ strURL: String, params : [String : AnyObject]? = [:], success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(strURL, method: .delete, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (responseObject) -> Void in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    class func requestPUTURL(_ strURL: String, params : [String : AnyObject]? = [:], headers : [String : String]? = [:], success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(strURL, method: .put, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    
    
}

