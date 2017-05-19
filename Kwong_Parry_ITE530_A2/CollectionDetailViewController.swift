//
//  CollectionDetailViewController.swift
//  Kwong_Parry_ITE530_A2
//
//  Created by Parry Kwong on 8/4/2017.
//  Copyright © 2017 Parry Kwong. All rights reserved.
//

import UIKit

class CollectionDetailViewController: UIViewController {

    @IBOutlet weak var photoImageEnlarged: UIImageView!
    
    var imageName: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageEnlarged.image = imageName //sets enlarged image
    }

}

extension CollectionDetailViewController : ZoomingViewController //extension for zoom animation of image
{
    func zoomingBackgroundView(for transition: ZoomTransitioningDelegate) -> UIView? {
        return nil
    }
    
    func zoomingImageView(for transition: ZoomTransitioningDelegate) -> UIImageView? {
        return photoImageEnlarged
    }
}
