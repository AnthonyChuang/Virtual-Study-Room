//
//  PublicRoomViewController.swift
//  VirtualStudyRoom
//
//  Created by Anthony Chuang on 4/23/24.
//

import UIKit
import AVFoundation

class PublicRoomViewController: UIViewController, RoomSettingsPopupDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer: Timer?
    var workInterval: TimeInterval = 0.2 * 60
    var restInterval: TimeInterval = 0.1 * 60
    var isWorkTime = true
    var remainingTime: TimeInterval = 0
    
    var audioPlayer: AVAudioPlayer?
    var songs = [String]() // This will hold the names of your mp3 files
    var currentSongIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songs = [
            "lofisong.mp3"
        ]

        
        remainingTime = workInterval // Start with the work interval
        setupBackground()
        setupStartStopButton()
        setupResetButton()
    }
    
    func setupAudioPlayer() {
        let songName = songs[currentSongIndex]
        guard let url = Bundle.main.url(forResource: "Songs/\(songName)", withExtension: nil) else {
            print("Song file \(songName) not found.")
            proceedToNextSong()
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            playMusic()
        } catch let error {
            print("Could not load file: \(error.localizedDescription)")
            proceedToNextSong()
        }
    }



    
    func setupResetButton() {
        // Set the button's appearance to be circular and filled
        resetButton.layer.cornerRadius = resetButton.bounds.size.height / 2
        resetButton.backgroundColor = UIColor.black
        resetButton.setTitleColor(UIColor.white, for: .normal)
        resetButton.setTitle("Reset", for: .normal) // Set the default state title
        resetButton.clipsToBounds = true
    }

    
    func setupStartStopButton() {
        // Set the button's appearance to be circular and filled
        startStopButton.layer.cornerRadius = startStopButton.bounds.size.height / 2
        startStopButton.backgroundColor = UIColor.black
        startStopButton.setTitleColor(UIColor.white, for: .normal)
        startStopButton.setTitle("Start", for: .normal) // Set the default state title
        startStopButton.clipsToBounds = true
    }
    
    
    func setupBackground(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
           backgroundImage.image = UIImage(named: "Background")
           backgroundImage.contentMode = .scaleAspectFill // or .scaleAspectFit
           view.insertSubview(backgroundImage, at: 0) // Ensure the image is behind other subviews
    }
    @IBAction func resetTimerTapped(_ sender: UIButton) {
        if isWorkTime {
            remainingTime = workInterval
        } else {
            remainingTime = restInterval
        }
        updateTimerDisplay()
    }
    
    func updateTimerDisplay() {
        timerLabel.text = formatTime(seconds: remainingTime)
    }
    
    func restartTimer() {
        stopTimer() // Ensure the current timer is stopped before restarting
        startTimer()
    }
    
    @IBAction func toggleTimer(_ sender: UIButton) {
        if timer == nil {
            startTimer()
            sender.setTitle("Stop", for: .normal)
            sender.backgroundColor = UIColor.systemRed // Stop color
        } else {
            stopTimer()
            sender.setTitle("Start", for: .normal)
            sender.backgroundColor = UIColor.systemGreen // Start color
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        if isWorkTime {
            setupAudioPlayer()
            playMusic()
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerLabel.text = formatTime(seconds: remainingTime)
        audioPlayer?.stop() // Stop the music when timer stops
    }

    @objc func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
            timerLabel.text = formatTime(seconds: remainingTime)
        } else {
            completeTimerCycle()
        }
    }

    func completeTimerCycle() {
        if isWorkTime {
            remainingTime = restInterval
            audioPlayer?.stop()  // Stop the music during rest interval
            showNotification(title: "Work time ended, start rest!")
        } else {
            remainingTime = workInterval
            setupAudioPlayer()  // Prepare to play music for the next work cycle
            playMusic()  // Start playing music
            showNotification(title: "Rest time ended, back to work!")
        }
        isWorkTime.toggle()
        timerLabel.text = formatTime(seconds: remainingTime)
    }

    func showNotification(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func formatTime(seconds: TimeInterval) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func playMusic() {
        if !audioPlayer!.isPlaying {
            audioPlayer?.play()
        }
    }
    
    func proceedToNextSong() {
        currentSongIndex += 1
        if currentSongIndex >= songs.count {
            currentSongIndex = 0  // Loop back to the first song if at the end
        }
        setupAudioPlayer() // Attempt to setup the next song
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

extension PublicRoomViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        currentSongIndex += 1
        if currentSongIndex >= songs.count {
            currentSongIndex = 0 // Loop back to the first song
        }
        setupAudioPlayer() // Setup the next song
        playMusic() // Play the next song
    }
}

