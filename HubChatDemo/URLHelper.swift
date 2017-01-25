//
//  URLHelper.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit

class URLHelper: NSObject {
    
    class func getURL(_ URLKey:String) ->String{
        return self.getURL(URLKey, withURLParam: [:])
    }
    
    class func getURL(_ URLKey:String ,withURLParam:Dictionary<String,String>) -> String{
        if (!withURLParam.isEmpty){
            var str:String!
           str =  Constants.relativeURL()[URLKey]!
            for (key,value) in withURLParam{     
               str = str.replacingOccurrences(of: ":" + key, with: value)
            }
           return Constants.baseURL() + str!
            
        }else{
            return Constants.baseURL() + Constants.relativeURL()[URLKey]!
        }
    }
    

}
