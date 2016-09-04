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
    @IBOutlet weak var botonShuffle: UIButton!
    
    var reproductor: AVAudioPlayer!
    var aleatorio: Bool = false
    var tocar: Bool = false
    
    let listSongs = ["Shake it off","Knockin' on Heaven's Door","Surfin USA","is this Love","Thunderstruck"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectSong.dataSource = self
        selectSong.delegate = self
        tocar = true
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
        cancionSeleccionada(row)
        
    }
    
    func cancionSeleccionada (song: Int){
        var sonidoURL: NSURL?
        tocar = true
        switch song {
        case 0:
            self.imageCover.image = UIImage(named: "shake.jpg")
            self.titulo.text = "Shake it off - Taylor Swift"
            sonidoURL = NSBundle.mainBundle().URLForResource("Shake", withExtension: "mp3")
        case 1:
            self.imageCover.image = UIImage(named: "door.jpg")
            self.titulo.text = "Knockin' on Heaven's Door - Bob Dylan"
            sonidoURL = NSBundle.mainBundle().URLForResource("Door", withExtension: "mp3")
        case 2:
            self.imageCover.image = UIImage(named: "surfin.jpg")
            self.titulo.text = "Surfin USA - The Beach Boys"
            sonidoURL = NSBundle.mainBundle().URLForResource("Surfin", withExtension: "mp3")
        case 3:
            self.imageCover.image = UIImage(named: "love.jpg")
            self.titulo.text = "Is this Love - Bob Marley"
            sonidoURL = NSBundle.mainBundle().URLForResource("Love", withExtension: "mp3")
        case 4:
            self.imageCover.image = UIImage(named: "thunderstruck.jpg")
            self.titulo.text = "Thunderstruck - AC/DC"
            sonidoURL = NSBundle.mainBundle().URLForResource("Thunderstruck", withExtension: "mp3")
        default:
            self.imageCover.image = UIImage(named: "shake.jpg")
            self.titulo.text = "Shake it off - Taylor Swift"
            sonidoURL = NSBundle.mainBundle().URLForResource("Shake", withExtension: "mp3")
        }
        
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
        }catch{
            print("Error al cargar la canción")
        }
        
        selectSong.selectRow(song, inComponent: 0, animated: true)
        
        reproductor.volume = volumen.value
        reproductor.play()
        /*while tocar {
            if !reproductor.playing {
                tocar = false
                var num:Int
                if aleatorio {
                    num = numeroAleatorio()
                }else{
                    if song < 4 {
                        num = song + 1
                    } else {
                        num = 0
                    }
                }
                cancionSeleccionada(num)
            }
        }*/
    }
    
    func numeroAleatorio()->Int {
        return Int(arc4random_uniform(5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play() {
        reproductor.play()
    }

    @IBAction func pause() {
        if reproductor.playing {
            reproductor.pause()
        }
    }
    @IBAction func stop() {
        if reproductor.playing {
            reproductor.stop()
        }
    }
    @IBAction func controlVolumen() {
        reproductor.volume = self.volumen.value
    }

    @IBAction func shuffle() {
        let numero = numeroAleatorio
        cancionSeleccionada(numero())
    }

}

