//
//  PostCell.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit
import SnapKit

class PostCell: UITableViewCell {
  let userAvatarImage:UIImageView! = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 25
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let usernameLabel:UILabel! = {
    let label = UILabel()
    label.text = "username"
    label.font = UIFont(name: "Avenir-Medium", size: 17)
    label.textColor = UIColor(colorLiteralRed: 0.16, green: 0.49, blue: 1, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let postContentLabel:UILabel! = {
    let label = UILabel()
    label.font = UIFont(name: "Avenir", size: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }()
  
  let postImageContent:UIImageView! = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let upVoteLabel:UILabel! = {
    let label = UILabel()
    label.text = "14"
    label.font = UIFont(name: "Avenir", size: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    self.addSubview(userAvatarImage)
    self.addSubview(usernameLabel)
    self.addSubview(postContentLabel)
    self.addSubview(postImageContent)
    self.addSubview(upVoteLabel)
    self.setupConstraints()
  }
  
  func setupConstraints(){
    userAvatarImage.snp.makeConstraints { (make) in
      make.left.equalTo(self).offset(16)
      make.top.equalTo(self).offset(16)
      make.width.equalTo(50)
      make.height.equalTo(50)
    }
    
    usernameLabel.snp.makeConstraints { (make) in
      make.left.equalTo(userAvatarImage.snp.right).offset(16)
      make.centerY.equalTo(userAvatarImage)
      make.right.equalTo(self.snp.right).offset(-16)
      make.height.equalTo(20)
    }
    
    postContentLabel.snp.makeConstraints { (make) in
      make.left.equalTo(userAvatarImage.snp.left)
      make.top.equalTo(userAvatarImage.snp.bottom).offset(16)
      make.right.equalTo(self.snp.right).offset(-16)
    }
   
    self.showImage()
  
    upVoteLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.snp.left).offset(16)
      make.top.equalTo(postImageContent.snp.bottom).offset(8)
      make.bottom.equalTo(self.snp.bottom).offset(-16)
    }
    
  }
  
  func showImage(){
    postImageContent.snp.updateConstraints { (make) in
      make.left.equalTo(self.snp.left).offset(16)
      make.right.equalTo(self.snp.right).offset(-16)
      make.top.equalTo(postContentLabel.snp.bottom).offset(8)
      make.height.equalTo(200)
    }
  }
  
  func hideImage(){
    postImageContent.snp.updateConstraints { (make) in
      make.left.equalTo(self.snp.left).offset(16)
      make.right.equalTo(self.snp.right).offset(-16)
      make.top.equalTo(postContentLabel.snp.bottom).offset(8)
      make.height.equalTo(0)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}
