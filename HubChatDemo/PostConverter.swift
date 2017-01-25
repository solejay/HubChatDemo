//
//  PostConverter.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit

class PostConverter: NSObject {
  
  class func convertToPost(postJson:Dictionary<String,AnyObject>) -> Post{
    let post = Post()
    post.content = postJson["rawContent"] as? String
    post.user = UserConverter.convertToUser(userJson: postJson["createdBy"] as! Dictionary<String,AnyObject>)
    
    let entitiesDict = postJson["entities"] as? Dictionary<String,AnyObject>
    if let _entitiesDict = entitiesDict{
      let imagesDict = _entitiesDict["images"] as? [Dictionary<String,AnyObject>]
      post.media = imagesDict?.map({ (imageItem) -> String in
            return imageItem["cdnUrl"] as! String
      })
    }
    
    post.upvotes =  (postJson["stats"] as? [String:AnyObject])?["upVotes"] as? Int
    return post
  }


}
