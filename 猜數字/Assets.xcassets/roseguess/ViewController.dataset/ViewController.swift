//
//  ViewController.swift
//  roseguess
//
//  Created by yaya on 2016/11/23.
//  Copyright © 2016年 yaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNumber: UITextField! //玩家輸入的數字
    @IBOutlet weak var hint: UILabel! //溫馨提示
    @IBOutlet weak var guessTime: UILabel!  //可猜的次數
    @IBOutlet weak var rose: UIImageView!  //答對的獎勵
    @IBOutlet weak var tear: UIImageView!  //答錯的淚水
    
    var answer = 0 //答案初始值
    var chance = 6 //生命初始值
    var upperBound = 50 //最大範圍提示
    var lowerBound = 0  //最小範圍提示
    
    //按鈕go
    @IBAction func gobtn(_ sender: UIButton) {
        inputNumber.resignFirstResponder()
        
        
        if inputNumber.text == "" {
            
            hint.text="小狐狸正等著你給牠一個數字" //使用者沒輸入
            
            
        }else if Int(inputNumber.text!) == nil {
            
            hint.text="只能輸入數字喔!"  //使用者輸入的不是數字
            
            
        }else if chance > 0{
            
            
            let i = Int(inputNumber.text!)!
            check(test: i)
            
        }else{
            hint.text = "小狐狸哭哭 沒機會了"
            tear.isHidden = false
        }
        
        
    }
    
     //提示玩家最近的範圍
    func getBoundaryText() -> String {
        return "(\(lowerBound)~\(upperBound))"
    }
    
    
    //驗證
    func check(test:Int){
        
        
        if test > 50{
            
            hint.text = "猜的數字超出範圍嚕!\(getBoundaryText())"
            
            chance -= 1
            
            guessTime.text = String(chance)
            
            
        }else if test > answer {
            upperBound = test - 1
            
            hint.text = "沒有這麼多朵\(getBoundaryText())"
            
            chance -= 1
            
            guessTime.text = String(chance)
            
        }else if test < answer {
            lowerBound = test + 1
            
            hint.text = "太少朵了吧!\(getBoundaryText())"
            
            chance -= 1
            
            guessTime.text = String(chance)
            
        }else {
            
            hint.text = "答對了!就是\(answer)朵 送你一朵玫瑰"
            
            rose.isHidden = false
            
        }
    }
    
    
    
    //按鈕playagain
    @IBAction func playagain(_ sender: UIButton) {
        hint.text = "放膽去猜!!"
        inputNumber.text = "0"
        chance = 6
        upperBound = 50
        lowerBound = 0
        answer = Int(arc4random_uniform(50))
        guessTime.text = String(chance)
        rose.isHidden = true
        tear.isHidden = true

    }
    
    
    //按按鈕收鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        inputNumber.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer = Int(arc4random_uniform(50)) //<-- 重新產出一個0-50間的數字
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

