//
//  PostViewModel.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit

class PostViewModel: NSObject {
  var posts:[Post]? = []
  var forum:Forum?
  override init() {
    super.init()
    self.getPost()
    self.getForum()
  }
  
  func getPost(){
    HubChatNetworkService.getPosts(resultCallBack: { (posts) in
      self.posts = posts
       NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
    }) { (err) in
      print("An error occured")
    }
  }
  
  func getForum(){
    HubChatNetworkService.getForum(resultCallBack: { (forum) in
      self.forum = forum
      NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
    }) { (err) in
       print("An error occured")
    }
  }

}
