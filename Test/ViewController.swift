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
    }

    @IBAction func Photo(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    
}

func recommandMusic(image:UIImage){
    var imageData: Data?
    imageData = image.jpegData(compressionQuality: 0.5)
    let url = URL(string: "http://45.33.47.131:3000/image")!
    let json: [String: String] = ["image": imageData!.base64EncodedString()]
    let jsonData = try? JSONSerialization.data(withJSONObject: json)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = jsonData
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
        var responseURL = String(data: data, encoding: .utf8)!
        responseURL = String(responseURL.prefix(responseURL.count - 1))
        
        print(responseURL)
        guard let url = URL(string: responseURL) else {
            print("Error");
            return;
        }
        DispatchQueue.main.async {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
    task.resume()
}

extension ViewController{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            myImage.image = img
            recommandMusic(image: img)
        }
        dismiss(animated: true, completion: nil)
    }
}
