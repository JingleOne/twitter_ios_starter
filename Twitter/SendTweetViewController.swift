//
//  SendTweetViewController.swift
//  Twitter
//
//  Created by Jimmy LI on 2/1/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class SendTweetViewController: UIViewController {
    
    @IBOutlet weak var tweetTextView: UITextView!

    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onSend(_ sender: Any) {
        if (!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetContent: tweetTextView.text, success: {self.dismiss(animated: true, completion: nil)}, failure: {(error) in print("Can't send, something went wron")
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.layer.cornerRadius = 10.0
        tweetTextView.clipsToBounds = true
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
