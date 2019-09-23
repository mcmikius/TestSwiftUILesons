//
//  ViewController.swift
//  CombineFramework5Webinar
//
//  Created by Mykhailo Bondarenko on 23.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit
import Combine

struct BlogPost {
    let title: String
    let url: URL
}

extension Notification.Name {
    static let newBlogPost = Notification.Name("newBlogPost")
}

class ViewController: UIViewController {

    @IBOutlet weak var acceptTermsSwitch: UISwitch!
    @IBOutlet weak var makePostButton: UIButton!
    @IBOutlet weak var postLabel: UILabel!
    
    @Published var canMakePost: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        $canMakePost.receive(on: DispatchQueue.main).assign(to: \.isEnabled, on: makePostButton)
        
        setupCombine()
    }
    
    private func setupCombine() {
        let blogPostPublisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil).map( {
            (notification) -> String? in
            return (notification.object as? BlogPost)?.title ?? ""
        })
        
        let postLabelSubscriber = Subscribers.Assign(object: postLabel, keyPath: \.text)
        
        blogPostPublisher.subscribe(postLabelSubscriber)
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        canMakePost = sender.isOn
    }
    @IBAction func makePostTapped(_ sender: UIButton) {
        let blogPost = BlogPost(title: "New Post\nThe Current Time is \(Date())", url: URL(string: "fdfd")!)
        NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
        print("Last post is: \(postLabel.text!)")
    }
    

}

