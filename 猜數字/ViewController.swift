//
//  ViewController.swift
//  猜數字
//
//  Created by edisonfang on 2017/6/22.
//  Copyright © 2017年 hsuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var putin: UITextField!
    @IBOutlet weak var hint: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var flower: UIImageView!
    @IBOutlet weak var tear: UIImageView!

    var answer = 0
    var times = 6
    var upbound = 100
    var lowbound = 0
    
    @IBAction func gogo(_ sender: Any) {
        
        putin.resignFirstResponder() //收鍵盤
        if putin.text == "" {
            hint.text="小狐狸正等著你給牠一個數字" //使用者沒輸入
        }else if Int(putin.text!) == nil {
            hint.text="只能輸入數字喔!"  //使用者輸入的不是數字
        }else if times > 0{
            let i = Int(putin.text!)!
            check(test:i)
        }else{
            hint.text = "小狐狸哭哭 沒機會了"
            tear.isHidden = false
        }
    }
        
    func getBoundaryText() -> String {
        return "(\(lowbound)~\(upbound))"
    }
    
    if times >  0 {
        let i = Int(putin.text!)!
        check(test: i)
    }
    func check(test:Int)
    {
        if test > 50
        {
            hint.text = "猜的數字超出範圍嚕!\(getBoundaryText())"
            times -= 1
            time.text = String(chance)
    
        }
        else if test > answer
        {
            upbound = test - 1
            hint.text = "沒有這麼多朵\(getBoundaryText())"
            times -= 1
            guessTime.text = String(chance)
    
        }
        else if test < answer
        {
            lowbound = test + 1
            hint.text = "太少朵了吧!\(getBoundaryText())"
            times -= 1
            guessTime.text = String(chance)
        }
        else
        {
            hint.text = "答對了!就是\(answer)朵 送你一朵玫瑰"
            rose.isHidden = false
    }
    }

    @IBAction func re(_ sender: Any) {
    
    hint.text = "放膽去猜!!"
    putin.text = "0"
    times = 6
    upbound = 50
    lowbound = 0
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
    
    
    
    }
    
    
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

