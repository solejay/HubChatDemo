//
//  HubChatDemoTests.swift
//  HubChatDemoTests
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import XCTest
@testable import HubChatDemo

class HubChatDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetForum() {
      HubChatNetworkService.getForum(resultCallBack: { (forum) in
         XCTAssertNotNil(forum)
      }) { (err) in
        XCTFail("Request Failed")
      }
      
    }
  
    func testGetPosts() {
       HubChatNetworkService.getPosts(resultCallBack: { (posts) in
         XCTAssertNotNil(posts)
         XCTAssertTrue(posts!.count > 0)
       }) { (err) in
         XCTFail("Request Failed")
      }
   }
  
      
}
