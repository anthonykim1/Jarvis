//
//  ViewController.swift
//  Jarvis
//
//  Created by Anthony Kim on 1/20/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioplayer = AVAudioPlayer()
    
    private let arcButton: UIImageView = {
       let arc = UIImageView()
        arc.image = UIImage(named: "arc")
        return arc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(arcButton)
        arcButton.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapArc))
        arcButton.addGestureRecognizer(gesture)
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        arcButton.frame = CGRect(x: 100, y: 300, width: 200, height: 100)
    }
    @objc private func didTapArc(){
        do {
            let path = Bundle.main.path(forResource: "JarvisHello", ofType: "mp3")!
            let url = URL(fileURLWithPath: path)
            audioplayer = try AVAudioPlayer(contentsOf: url)
            audioplayer.play()
        }catch{
            print(error)
        }
        
    }


}

