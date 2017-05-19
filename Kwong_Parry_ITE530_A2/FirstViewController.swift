//
//  FirstViewController.swift
//  Kwong_Parry_ITE530_A2
//
//  Created by Parry Kwong on 31/3/2017.
//  Copyright © 2017 Parry Kwong. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var myInfo = CVInfo() //create instance of CV information
   
    override func viewDidLoad() {
        super.viewDidLoad()

        //layout for text
        let attributedString = NSMutableAttributedString(string: myInfo.printInfo())
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        attributedString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        overview.attributedText = attributedString
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) { //Screen rotation handling
        
       switch (UIDevice.current.orientation.isLandscape){
       case (true):
            photo.isHidden = true //hide personal photo
            
            let viewHeight = self.view.frame.size.width //change background image and imageView constraints
            background.image = UIImage(named: "backg_landscape")
            bottomConstraint.constant = -viewHeight/2
          
       case(false):
        
            photo.isHidden = false //show personal photo
            bottomConstraint.constant = 0
            background.image = UIImage(named: "backg")
            print (background.constraints)
        }
    }
}

