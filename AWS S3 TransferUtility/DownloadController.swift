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
        
        let transferUtility = AWSS3TransferUtility.default()
        let expression = AWSS3TransferUtilityDownloadExpression()
        expression.progressBlock = {(task, progress) in DispatchQueue.main.async(execute: {
            self.progressBar.progress = Float(progress.fractionCompleted)
            self.label.text = "\(Int(progress.fractionCompleted * 100)) %"
        })
        }
        
        transferUtility.downloadData(fromBucket: s3Bucket, key: s3Key, expression: expression) { (task, url, data, error) in
            if let error = error{
                print(error)
            }
            DispatchQueue.main.async(execute: { 
                self.image = UIImage(data: data!)!
            })
        }
    }
    func updateUI(){
        label.text = "Done!"
        activityIndicator.stopAnimating()
        imageView.image = image
    }
}

