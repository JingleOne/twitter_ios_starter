//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Jimmy LI on 1/25/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    var favState: Bool = false
    
    var tweetID: Int = -1

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBOutlet weak var retweet: UIButton!
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet_request(tweetID: tweetID, success: {self.setRetweeted(_isRetweeted: true)}, failure: { (error) in
            print("Error in retweeting")
        })
    }
    
    @IBAction func onClickFav(_ sender: Any) {
        let toBeFavorited = !favState
        if (toBeFavorited){
            TwitterAPICaller.client?.fav_tweet(tweetID: tweetID, success:{ self.setFavorite(true)}, failure: {(error) in print("failed to like")})
        }
        else{
            TwitterAPICaller.client?.unfav_tweet(tweetID: tweetID, success:{self.setFavorite(false)}, failure: {(error) in print("failed to unlike")})
        }
        
    }
    
    func setRetweeted(_isRetweeted: Bool){
        if (_isRetweeted){
            retweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweet.isEnabled = false
        }
        else{
            retweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweet.isEnabled = true
        }
    }
    
    func setFavorite(_ isFavorited: Bool){
        favState = isFavorited
        if (isFavorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
