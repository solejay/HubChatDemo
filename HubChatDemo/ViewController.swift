//
//  ViewController.swift
//  HubChatDemo
//
//  Created by Segun Solaja on 1/24/17.
//  Copyright © 2017 Segun Solaja. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class ViewController: UIViewController {
  var postTable :UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  var postViewModel:PostViewModel =  PostViewModel()
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  func configureView(){
    self.view.addSubview(postTable)
    postTable.delegate = self
    postTable.dataSource = self
    postTable.tableFooterView = UIView(frame: CGRect.zero)
    postTable.estimatedRowHeight = 300
    postTable.rowHeight = UITableViewAutomaticDimension
    postTable.register(PostCell.self, forCellReuseIdentifier: "postCell")
    self.setupConstraints()
    
    NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name("reload"), object: nil)
  }
  
  func reloadTable(){
    postTable.reloadData()
  }
  

  func setupConstraints(){
    postTable.snp.makeConstraints { (make) in
      make.edges.equalTo(self.view)
    }
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()

  }
  deinit {
    NotificationCenter.default.removeObserver(self)
  }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let count = self.postViewModel.posts?.count{
      return count
    }else{
      return 0
    }
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = postTable.dequeueReusableCell(withIdentifier: "postCell") as! PostCell
    let post = self.postViewModel.posts?[indexPath.row]
    cell.usernameLabel.text = post?.user?.username
    cell.userAvatarImage.sd_setImage(with: URL(string:post!.user!.avatar!), placeholderImage: nil)
    if let media = post!.media{
      if media.count != 0 {
        cell.showImage()
        cell.postImageContent.sd_setImage(with: URL(string:post!.media!.first!), placeholderImage: nil)
      }else{
        cell.hideImage()
      }
    }
    cell.postContentLabel.text = post?.content
    if let upvotes = post?.upvotes{
      cell.upVoteLabel.text = "\(upvotes) Up Votes"
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
   return 280
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = PostHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 280))
    if let forum = postViewModel.forum {
      header.coverImage.sd_setImage(with: URL(string:forum.forumHeaderImage!), placeholderImage: nil)
      header.logoImage.sd_setImage(with: URL(string:forum.forumLogo!), placeholderImage: nil)
      header.titleLabel.text = forum.forumTitle
      header.descriptionLabel.text = forum.forumDescription
    }
    return header
  }

}

