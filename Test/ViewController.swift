//
//  ViewController.swift
//  Test
//
//  Created by Ahren on 3/30/19.
//  Copyright © 2019 Hack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var photo: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate=self
        // Do any additional setup after loading the view.
        let image1 : UIImageView = self.view.viewWithTag(200) as! UIImageView;
        image1.image = UIImage(named:"bg.jpg");
    }

    @IBAction func Photo(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    
}
extension ViewController{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            myImage.image = img
            let label1 : UILabel = self.view.viewWithTag(300) as! UILabel;
            label1.text = "Image Loaded";
            let button1 : UIButton = self.view.viewWithTag(100) as! UIButton;
            view.bringSubviewToFront(button1);
            view.bringSubviewToFront(label1);
        }
        dismiss(animated: true, completion: nil)
    }
}
