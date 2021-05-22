//
//  DetailViewController.swift
//  Project1_HWS
//
//  Created by Mac_Admin on 06/04/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    var totalImages = 0
    var selectedImageCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \(selectedImageCount) of \(totalImages)"
        navigationItem.largeTitleDisplayMode = .never
        if let imageToLoad = selectedImage {
            print(imageToLoad)
            imageView.image = UIImage(named: imageToLoad)
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
