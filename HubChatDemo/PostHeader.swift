//
//  PostHeader.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/25/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit
import SnapKit

class PostHeader: UIView {

  let logoImage:UIImageView! = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.borderColor = UIColor.white.cgColor
    imageView.layer.borderWidth = 4
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let coverImage:UIImageView! = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let titleLabel:UILabel! = {
    let label = UILabel()
    label.font = UIFont(name: "Avenir-Medium", size: 17)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let descriptionLabel:UILabel! = {
    let label = UILabel()
    label.font = UIFont(name: "Avenir", size: 14)
    label.textColor = .black
    label.numberOfLines = 2
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
     self.addSubview(coverImage)
    self.addSubview(logoImage)
   
    self.addSubview(titleLabel)
    self.addSubview(descriptionLabel)
    setupConstraint()
  }
  
  func setupConstraint(){
    coverImage.snp.makeConstraints { (make) in
      make.left.equalTo(self)
      make.right.equalTo(self)
      make.top.equalTo(self)
      make.height.equalTo(200)
    }
    
    logoImage.snp.makeConstraints { (make) in
      make.left.equalTo(self).offset(16)
      make.centerY.equalTo(coverImage.snp.bottom)
      make.width.equalTo(65)
      make.height.equalTo(65)

    }
    
    titleLabel.snp.makeConstraints { (make) in
      make.left.equalTo(logoImage.snp.right).offset(16)
      make.top.equalTo(coverImage.snp.bottom).offset(8)
    }
    descriptionLabel.snp.makeConstraints { (make) in
      make.left.equalTo(titleLabel.snp.left)
      make.top.equalTo(titleLabel.snp.top).offset(8)
      make.right.equalTo(self.snp.right).offset(-8)
      make.bottom.equalTo(self)
    }
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }




}
