//
//  CodePopupViewController.swift
//  VirtualStudyRoom
//
//  Created by Anthony Chuang on 4/23/24.
//

import UIKit

class CodePopupViewController: UIViewController {

    @IBAction func submitButton(_ sender: UIButton) {
        print("Submit tapped")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        print("Cancel tapped")
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var popupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
            view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        // Round the corners of the popupView
        popupView.layer.cornerRadius = 10 // You can adjust the value to what looks best
        popupView.layer.masksToBounds = true
        popupView.layer.shadowColor = UIColor.black.cgColor
        popupView.layer.shadowOpacity = 0.2
        popupView.layer.shadowOffset = CGSize(width: 0, height: 2)
        popupView.layer.shadowRadius = 4
        popupView.layer.masksToBounds = false

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
