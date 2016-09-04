//
//  ViewController.swift
//  reproductorAudio
//
//  Created by SebasFiol on 4/9/16.
//  Copyright © 2016 SebasFiol. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var selectSong: UIPickerView!
    @IBOutlet weak var volumen: UISlider!
    @IBOutlet weak var titulo: UILabel!
    
    var listSongs = ["Shake it off","Knockin' on Heaven's Door","Surfin USA","is this Love","Thunderstruck"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectSong.dataSource = self
        selectSong.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listSongs.count
    }
    
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titulo = NSAttributedString(string: listSongs[row], attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.blueColor()])
        return titulo
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        tocarMostrarPortada(row)
        
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

