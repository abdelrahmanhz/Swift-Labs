//
//  AddMovieViewController.swift
//  Task2
//
//  Created by abdelrahmanhz on 4/18/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate  {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var imgTF: UITextField!
    @IBOutlet weak var ratingTF: UITextField!
    @IBOutlet weak var releaseYearTF: UITextField!
    @IBOutlet weak var genreTF: UITextField!
    var delegate: AddMovieProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let testUIBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.addMovie))
        self.navigationItem.rightBarButtonItem  = testUIBarButtonItem
        self.imgTF.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    @objc func addMovie(){
        if(self.titleTF.text?.count ?? 0 > 0 && self.imgTF.text?.count ?? 0 > 0 && self.ratingTF.text?.count ?? 0 > 0
            && self.releaseYearTF.text?.count ?? 0 > 0 && self.genreTF.text?.count ?? 0 > 0){
            let genre = self.genreTF.text!
            let movie = Movie(title: self.titleTF.text!, image: self.imgTF.text!,
                              rating: Float(self.ratingTF.text!)!, releaseYear: Int(self.releaseYearTF.text!)!, genre: genre)
            delegate?.addMovie(movie: movie)
            self.navigationController?.popViewController(animated: true)
        }
        else{
            print("please fill all fields")
        }
    }
    
    @IBAction func chooseImg(_ sender: Any) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
            
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imgPicker.sourceType = .camera
            self.present(imgPicker, animated: true, completion: nil)
        }
        else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imgPicker.sourceType = .photoLibrary
            //imgPicker.allowsEditing = true
            self.present(imgPicker, animated: true, completion: nil)
        }
        else{
            print("Sorry!")}
            
        }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let imgUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL
        print(imgUrl?.path)
        
        self.imgTF.text = imgUrl?.path
        picker.dismiss(animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
