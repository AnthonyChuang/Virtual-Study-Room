//
//  RoomSettingsPopupViewController.swift
//  VirtualStudyRoom
//
//  Created by Anthony Chuang on 4/23/24.
//

import UIKit

protocol RoomSettingsPopupDelegate: AnyObject {
    func didChangeRoomName(_ name: String)
    func didChangeBackgroundColor(_ color: UIColor)
    func didCancelChanges()
}

class RoomSettingsPopupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let colors: [(name: String, color: UIColor)] = [
        ("Blue", .blue),
        ("Red", .red),
        ("Green", .green),
        ("Yellow", .yellow),
        ("Purple", .purple)
    ]

    weak var delegate: RoomSettingsPopupDelegate?
    var selectedColor: UIColor = .white // Default color
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var colorPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPickerView.delegate = self
        colorPickerView.dataSource = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedColor = colors[row].color
    }

    @IBAction func nameTextFieldChanged(_ sender: UITextField) {
        if let name = sender.text {
            delegate?.didChangeRoomName(name)
        }
    }
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        // Assuming you have a UITextField named 'nameTextField' and a color selected from the UIPickerView.
        if let name = nameTextField.text, !name.isEmpty {
            delegate?.didChangeRoomName(name)
        }

        // Assume 'selectedColor' is the currently selected color, which needs to be stored in your class
        delegate?.didChangeBackgroundColor(selectedColor)

        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        delegate?.didCancelChanges()
        // Simply dismiss without doing anything
        self.dismiss(animated: true, completion: nil)
    }
}

