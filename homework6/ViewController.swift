//
//  ViewController.swift
//  homework6
//
//  Created by Hong Cheng Yen on 2021/8/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var testButton: UISwitch!
    
    var index = 0
    var timer = Timer()
    let cover = ["play1", "play2", "play3", "play4", "play5", "play6"]
    let textlabel = ["1/6", "2/6", "3/6", "4/6", "5/6", "6/6"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "play1.jpg")
//        imageView.contentMode = .scaleAspectFill
        Label.text = "1/6"
    }
    @objc func chagetime() {
        print("hi")
    }
    
    func updateUI() {
        imageView.image = UIImage(named: cover[index])
        segmentedControl.selectedSegmentIndex = index
        PageControl.currentPage = index
        Label.text = textlabel[index]
    }
    @IBAction func plusControl(_ sender: Any) {
        index += 1
        if index == cover.count {
            index = 0
        }
        updateUI()
    }
    
    @IBAction func deductConyrol(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = 5
        }
        updateUI()
    }
    
    @IBAction func changeImageView(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            index = 0
        case 1:
            index = 1
        case 2:
            index = 2
        case 3:
            index = 3
        case 4:
            index = 4
        case 5:
            index = 5
        default :
            index = 6
        }
        updateUI()
    }
    

    @IBAction func cangeView(_ sender: Any) {
        switch PageControl.currentPage {
        case 0:
            index = 0
        case 1:
            index = 1
        case 2:
            index = 2
        case 3:
            index = 3
        case 4:
            index = 4
        case 5:
            index = 5
        default :
            index = 6
        }
        updateUI()
    }
    @IBAction func test(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            index += 1
            if index == cover.count {
                index = 0
            }
        }else {
            index -= 1
            if index < 0 {
                index = 5
            }
        }
        updateUI()
    }
    
    @IBAction func LongPress(_ sender: Any) {
        index = Int.random(in: 0...5)
        print(index)
        updateUI()
    }
    
    
    
    @IBAction func testt(_ sender: Any) {
        if testButton.isOn == true {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                self.index += 1
                if self.index == self.cover.count {
                    self.index = 0
                }
                self.updateUI()
            })
        }else {
            timer.invalidate()
        }
    }
}


