//
//  ViewController.swift
//  reproductorAudio
//
//  Created by SebasFiol on 4/9/16.
//  Copyright © 2016 SebasFiol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var selectSong: UIPickerView!
    @IBOutlet weak var volumen: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play() {
    }

    @IBAction func pause() {
    }
    @IBAction func stop() {
    }

    @IBAction func shuffle() {
    }

}

