//
//  CaptureViewController.swift
//  Instagram
//
//  Created by Tom H on 3/6/16.
//  Copyright © 2016 Tom Horvath. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var captionField: UITextField!
    @IBOutlet weak var selectPhotoButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectPhotoAction(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // Get the image captured by the UIImagePickerController
        photoImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        photoImageView.hidden = false
        
        submitButton.hidden = false
        selectPhotoButton.hidden = true
            
        // Dismiss UIImagePickerController to go back to your original view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func submitAction(sender: AnyObject) {
        Post.postUserImage(photoImageView.image, withCaption: captionField.text) { (success: Bool, error: NSError?) -> Void in
            if success {
                print("Submitted user image to parse")
                
                // Reset Capture tab state
                self.photoImageView.image = nil
                self.photoImageView.hidden = true
                self.captionField.text = ""
                self.submitButton.hidden = true
                self.selectPhotoButton.hidden = false
            
                // Go to Home tab
                self.tabBarController?.selectedIndex = 0
            } else {
                print("Error submitting user image to parse")
                print(error?.localizedDescription)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
