//
//  DownloadController.swift
//  AWS S3 TransferUtility
//
//  Created by Ameenah Burhan on 9/4/17.
//  Copyright © 2017 Ameenah Burhan. All rights reserved.
//

import UIKit
import AWSS3

class DownloadController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!

    let s3Bucket = "YOUR BUCKET HERE"
    let s3Key = "YOUR FILE KEY HERE"
    var image = UIImage(){
        didSet{
            updateUI()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        //TODO: Create an instance of TransferUtility
        //TODO: Create a expression instance to update progress
        //TODO: Request to download the data from S3
        
    }
    func updateUI(){
        label.text = "Done!"
        activityIndicator.stopAnimating()
        imageView.image = image
    }
}

