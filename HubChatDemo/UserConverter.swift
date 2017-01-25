//
//  UserConverter.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit

class UserConverter: NSObject {
  class func convertToUser(userJson:Dictionary<String,AnyObject>) -> User{
    let user = User()
    user.username = userJson["username"] as? String
    user.avatar = (userJson["avatar"] as? [String:AnyObject])?["url"] as? String
    return user
  }
}
