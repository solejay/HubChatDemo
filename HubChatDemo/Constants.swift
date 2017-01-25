//
//  Constants.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit

class Constants: NSObject {
  
    
  class func baseURL () ->String{
    return "https://api.hubchat.com/v1"
  }
  
  class func relativeURL()->Dictionary<String,String>{
    return [
      "FORUM" :"/forum/photography",
      "POST_LIST":"/forum/photography/post"
      ]
  }
    


}
