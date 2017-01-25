//
//  ForumConverter.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit

class ForumConverter: NSObject {
  class func convertToForum(forumJson:Dictionary<String,AnyObject>) -> Forum{
    let forum = Forum()
    forum.forumTitle = forumJson["title"] as? String
    forum.forumDescription = forumJson["description"] as? String
    forum.forumLogo =  (forumJson["image"] as? [String:AnyObject])?["url"] as? String
    forum.forumHeaderImage = (forumJson["headerImage"] as? [String:AnyObject])?["url"] as? String
    return forum
  }

}
