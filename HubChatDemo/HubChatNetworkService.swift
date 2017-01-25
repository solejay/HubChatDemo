//
//  HubChatNetworkService.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit
import Alamofire

class HubChatNetworkService: NSObject {
  
  class func getForum(resultCallBack:@escaping (_ forum:Forum?) -> Void,errorCallback:@escaping (_ err:Error) -> Void ){
    Alamofire.request(URLHelper.getURL("FORUM"), method: .get, parameters: nil).responseJSON { (res) in
      if(res.result.isSuccess){

        let result = res.result.value as! Dictionary<String,AnyObject>
        let forumJson = result["forum"] as! Dictionary<String,AnyObject>
        let forum = ForumConverter.convertToForum(forumJson: forumJson)
        resultCallBack(forum)
      }else{
        errorCallback( res.result.error!)
      }
      
    }
    
  }
  
  class func getPosts(resultCallBack:@escaping (_ post:[Post]?) -> Void,errorCallback:@escaping (_ err:Error) -> Void ){
    Alamofire.request(URLHelper.getURL("POST_LIST"), method: .get, parameters: nil).responseJSON { (res) in
      if(res.result.isSuccess){
        let result = res.result.value as! Dictionary<String,AnyObject>
        let postsJson = result["posts"] as! [Dictionary<String,AnyObject>]
        let post  = postsJson.map({ (item) -> Post in
          return PostConverter.convertToPost(postJson: item)
        })
        
        resultCallBack(post)
       
      }else{
        errorCallback( res.result.error!)
      }
      
    }
    
  }
  
  

}
