//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Raphael M. Hidalgo on 4/6/17.
//  Copyright © 2017 UpliftedStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var panGesture: UIScreenEdgePanGestureRecognizer!
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    let swipeRec = UISwipeGestureRecognizer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeRec.addTarget(self, action: Selector(("SwipeGestureRecognizer")))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        view.addGestureRecognizer(scrollView.panGestureRecognizer)
        
        var contentWidth: CGFloat = 0.0
        
        let scrollWidth = scrollView.frame.size.width
        for x in 0...2 {
            let icons = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: icons)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        }
    
    
}

