//
//  DetailViewController.swift
//  Project-1-Storm-Viewer
//
//  Created by verebes on 05/06/2018.
//  Copyright © 2018 A&D Progress. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String? {
        didSet{
            print("NOW IT HAS A VALUE")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let pictureToShow = selectedImage {
            imageView.image = UIImage(named: pictureToShow)
        }
        title = selectedImage
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .action, target: self,
                            action: #selector(shareTapped))
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems:[imageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        //below not working
//        if let vc = SLComposeViewController(forServiceType:
//            SLServiceTypeFacebook) {
//            vc.setInitialText("Look at this great picture!")
//            vc.add(imageView.image!)
//            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
//            present(vc, animated: true)
//        }
    }
}
