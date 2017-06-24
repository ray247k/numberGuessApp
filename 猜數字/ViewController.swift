//
//  ViewController.swift
//  猜數字
//
//  Created by edisonfang on 2017/6/22.
//  Copyright © 2017年 hsuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    //玩家輸入數字
    @IBOutlet weak var putin: UITextField!
    
    //提示
    @IBOutlet weak var hint: UILabel!
    
    //可猜的次數
    @IBOutlet weak var time: UILabel!
    
    //答對的畫面
    @IBOutlet weak var flower: UIImageView!
    
    //答錯的畫面
    @IBOutlet weak var tear: UIImageView!

    //答案初始值
    var answer = 0
    
    //可猜次數初始值
    var chance = 6

    //最大範圍提示
    var upbound : Int = 100

    //最小範圍提示
    var lowbound : Int = 0
    
    /**
     * 按鈕按下之後檢查猜測次數
     *
     * @parma putin.text 輸入的數字
     * @result hint.text 提示訊息
     */
    @IBAction func gogo(_ sender: Any)
    {
        //收鍵盤
        putin.resignFirstResponder()
        
        //使用者沒輸入
        if putin.text == ""
        {
            hint.text="小狐狸正等著你給牠一個數字"
        }
            
        //使用者輸入的不是數字
        else if Int(putin.text!) == nil
        {
            hint.text="只能輸入數字喔!"
        }
        
        //猜測次數 > 0 定義inputInt輸入轉成Int，執行 check()
        else if chance > 0
        {
            let inputInt = Int(putin.text!)!
            check(inputTest : inputInt)
        }
        
        //次數 =< 0
        else
        {
            hint.text = "小狐狸哭爸 沒機會了"
            tear.isHidden = false
        }
    }
    
    /**
     * 顯示新的範圍提示訊息
     * 
     * @parma void
     * @return str 新的範圍
     */
    func getBoundaryText() -> String {
        return "(\(lowbound)~\(upbound))"
    }
    
    /**
     * 檢查輸入是否為目標數值
     *
     * @parma int test:Int 
     * @return string 回應提示
     */
    func check(inputTest:Int)
    {
        if inputTest > 100
        {
            hint.text = "猜的數字超出範圍嚕!\(getBoundaryText())"
            chance -= 1
            time.text = String(chance)
    
        }
            
        else if inputTest > answer
        {
            upbound = inputTest - 1
            hint.text = "沒有這麼多朵\(getBoundaryText())"
            chance -= 1
            time.text = String(chance)
    
        }
            
        else if inputTest < answer
        {
            lowbound = inputTest + 1
            hint.text = "太少朵了吧!\(getBoundaryText())"
            chance -= 1
            time.text = String(chance)
        }

        else
        {
            hint.text = "答對了!就是\(answer)朵 送你一朵玫瑰"
            flower.isHidden = false
        }
    }

    /**
     * 重置按鈕
     * 
     * 重置可猜的次數、圖片、範圍還有重設答案
     * @parma void
     * @return string 重置提示
     */
    @IBAction func re(_ sender: Any)
    {
        hint.text = "放膽去猜!!"
        putin.text = "0"
        chance = 6
        upbound = 100
        lowbound = 0
        answer = Int(arc4random_uniform(100))
        time.text = String(chance)
        flower.isHidden = true
        tear.isHidden = true
    }
    
    
    //按按鈕收鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        putin.resignFirstResponder()
        return true
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        answer = Int(arc4random_uniform(100))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

