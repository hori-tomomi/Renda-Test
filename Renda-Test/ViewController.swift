//
//  ViewController.swift
//  Renda-Test
//
//  Created by Tomomi Hori on 2022/02/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var timeCountLabel: UILabel!
    @IBOutlet var buildingImageView: UIImageView!
    @IBOutlet var tapButton: UIButton!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var finishButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
   
    
    
    var tapCount = 0
    var levelArray:[String] = ["Level1", "Level2", "Level3", "Level4", "Level5", "Level6"]
    var changeNo = 0
    var timeCount: Float = 0.0
    var timer:Timer = Timer()
    
   // var buildingsArray:[String] = ["building1", "building2", "buiding3", "building4"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       
    }
    
    @IBAction func tapTapButton() {
        
        if tapCount < 51{
            tapCount = tapCount + 1
        }
        
        countLabel.text = String(tapCount)
        levelLabel.text = String(levelArray[changeNo])
        
        
        if tapCount < 10{
            buildingImageView.image = UIImage(named: "Building1")
        } else if tapCount < 20{
            changeNo = 1
            buildingImageView.image = UIImage(named: "Building2")
        } else if tapCount < 30{
            changeNo = 2
            buildingImageView.image = UIImage(named: "Building3")
        } else if tapCount < 40{
            changeNo = 3
            buildingImageView.image = UIImage(named: "Building4")
        } else if tapCount < 51{
            changeNo = 4
            buildingImageView.image = UIImage(named: "Building5")
        } else if tapCount < 60{
            changeNo = 5
            buildingImageView.image = UIImage(named: "Building6")
        }
        
        
        
    }
    
    @IBAction func start() {
        
        if !timer.isValid {
            
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            
        }
     
    }
    
    @IBAction func finish() {
        
        if timer.isValid {
            timer.invalidate()
        }
        result()
        
    }
    
    @objc func up(){
        timeCount = timeCount + 0.01
        timeCountLabel.text = String(format: "%.2f", timeCount)
    }
    
    func result() {
        resultLabel.text = String(format: "%.2f", timeCount) + "年かかりました！"
    }


}

