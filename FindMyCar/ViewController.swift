//
//  ViewController.swift
//  FindMyCar
//
//  Created by Abdul Manaam on 9/29/21.
//

import UIKit

class ViewController: UIViewController {
  let location = Location()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  @IBAction func hereCar(_ sender: UIButton) {
    location.getCurrentLocation()
    let alert = UIAlertController(title: "Saved", message: generateMessage(), preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
    present(alert, animated: true, completion: nil)
    location.saveLocation()
    
  }
  
  func generateMessage() -> String {
    let message = "Your car is currently at: \n( \(location.latitude), \(location.longitude) )\n\nWhen you want a map to this location, simply press the 'Where is my car?' button."
    return message
  }


}

