//
//  PublicRoomViewController.swift
//  VirtualStudyRoom
//
//  Created by Anthony Chuang on 4/23/24.
//

import UIKit

class PublicRoomViewController: UIViewController, RoomSettingsPopupDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var timerTextField: UITextField!
    @IBOutlet weak var startTimerButton: UIButton!
    
    var pomodoroTimer: Timer?
    var timeLeft: TimeInterval = 25 * 60 // Default 25 minutes
    
    @IBOutlet weak var roomNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerTextField.delegate = self
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func settingsButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let settingsVC = storyboard.instantiateViewController(withIdentifier: "RoomSettingsPopupViewController") as? RoomSettingsPopupViewController {
            settingsVC.modalPresentationStyle = .overCurrentContext
            settingsVC.modalTransitionStyle = .crossDissolve
            settingsVC.delegate = self  // Set the delegate to communicate changes back
            self.present(settingsVC, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func startTimerButtonTapped(_ sender: UIButton) {
        if let timeText = timerTextField.text, let time = TimeInterval(timeText) {
            timeLeft = time * 60 // Convert minutes to seconds
            timerTextField.isEnabled = false // Disable the text field while timer is running
            startPomodoroTimer()
        }
    }
    
    func startPomodoroTimer() {
        pomodoroTimer?.invalidate() // Invalidate any existing timer
        pomodoroTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
            updateTimerTextField()
        } else {
            pomodoroTimer?.invalidate()
            timerTextField.isEnabled = true
            alertTimeUp()
        }
    }
    
    func updateTimerTextField() {
        let minutes = Int(timeLeft) / 60
        let seconds = Int(timeLeft) % 60
        timerTextField.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    func alertTimeUp() {
        let alert = UIAlertController(title: "Time's up!", message: "Your Pomodoro session has ended.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.timerTextField.text = "25" // Reset timer text field
        })
        present(alert, animated: true, completion: nil)
    }
    
    func didChangeRoomName(_ name: String) {
        roomNameLabel.text = name
    }

    func didChangeBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
    func didCancelChanges() {
            // Actions to take when changes are canceled. This can be empty.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
