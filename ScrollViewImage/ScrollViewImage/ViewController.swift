//
//  ViewController.swift
//  ScrollViewImage
//
//  Created by Orest Mykha on 1/24/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var arrayImage = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.arrayImage = [#imageLiteral(resourceName: "blue-sky-and-cirrus-clouds-over-wheat-field-jupiterimages"), #imageLiteral(resourceName: "img_0885published")]
        self.mainScrollView.frame = self.view.frame
        
        for i in 0..<arrayImage.count {
            
            // Create and set imageView for naked image
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            
            // Create and set imageView for blur effect, and blurView
            let blurEffect = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            let imageViewWithBlur = UIImageView()
            imageViewWithBlur.contentMode = .scaleToFill
            
            // Create frame and xPosition for imageView
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
            imageViewWithBlur.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
            
            // Set content size for ScrollView and set frame for blurView
            self.mainScrollView.contentSize.width = self.mainScrollView.frame.width * CGFloat(i + 1)
            blurView.frame = self.mainScrollView.bounds
            
            // Set image for imageView
            imageView.image = self.arrayImage[i]
            imageViewWithBlur.image = self.arrayImage[i]
            
            imageViewWithBlur.addSubview(blurView)
            self.mainScrollView.addSubview(imageViewWithBlur)
            self.mainScrollView.addSubview(imageView)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

