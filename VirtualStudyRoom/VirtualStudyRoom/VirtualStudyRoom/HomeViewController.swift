//
//  HomeViewController.swift
//  VirtualStudyRoom
//
//  Created by Anthony Chuang on 4/23/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func enterCodeButtonTapped(_ sender: UIButton) {
        print("Enter Code tapped")  // This should appear in the console when the button is tapped.

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let codePopupVC = storyboard.instantiateViewController(withIdentifier: "CodePopupViewController") as? CodePopupViewController {
            codePopupVC.modalPresentationStyle = .overCurrentContext
            codePopupVC.modalTransitionStyle = .crossDissolve
            self.present(codePopupVC, animated: true, completion: nil)
        } else {
            print("Could not instantiate CodePopupViewController")
        }
    }
    override func viewDidLoad() {
     
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
