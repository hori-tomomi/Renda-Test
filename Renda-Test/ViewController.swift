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
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var buildingNameLabel: UILabel!
    
    var tapCount = 0
    var changeNo = 0
    var timeCount: Float = 0.0
    var timer:Timer = Timer()
    
    var levelArray:[String] = ["Level1", "Level2", "Level3", "Level4", "Level5", "Level6"]
    var buildingArray:[String] = ["Building1", "Building2", "Building3", "Building4","Building5"]
    var buildingNameArray:[String] = ["京都タワー　131m", "ツインアーチ　138m", "神戸ポートタワー 108m", "福岡タワー　234m", "東京タワー　333m"]
    
    var isBuilding: Bool = false;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resultLabel.isHidden = true
       
    }
    
    @IBAction func tapTapButton() {
        
        countLabel.text = String(tapCount)
        levelLabel.text = String(levelArray[changeNo])
        buildingImageView.image = UIImage(named: String(buildingArray[changeNo]))
        buildingNameLabel.text = String(buildingNameArray[changeNo])
        
        if isBuilding == false {
            return
        }
        
        tapCount = tapCount + 1
        
        if tapCount < 10{
        } else if tapCount < 20{
            changeNo = 1
        } else if tapCount < 30{
            changeNo = 2
        } else if tapCount < 50{
            changeNo = 3
        } else if tapCount < 51{
            changeNo = 4
        } else {
            isBuilding = false
            finish()
        }
    }
    
    @IBAction func start() {
        isBuilding = true
        timeCount = 0
        tapCount = 0
        changeNo = 0
        
        buildingImageView.image = UIImage(named: String(buildingArray[changeNo]))
        buildingNameLabel.text = String(buildingNameArray[changeNo])
        resultLabel.isHidden = true
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    
    @objc func up(){
        timeCount = timeCount + 0.01
        timeCountLabel.text = String(format: "%.2f", timeCount) + "year"
    }
    
    func finish() {
        if timer.isValid {
            timer.invalidate()
        }
        resultLabel.isHidden = false
        resultLabel.text = String(format: "%.2f", timeCount) + "年かかりました！"
    }
}

