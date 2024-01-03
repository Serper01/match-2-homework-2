//
//  ViewController.swift
//  Match 2 Game Homework
//
//  Created by Serper Kurmanbek on 26.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayOfPictures = [
        UIImage(named: "Aston"),
        UIImage(named: "Audi"),
        UIImage(named: "Ferrari"),
        UIImage(named: "Jaguar"),
        UIImage(named: "Lamborghini"),
        UIImage(named: "Lexus"),
        UIImage(named: "Maserati"),
        UIImage(named: "Mercedes"),
        UIImage(named: "Mercedes"),
        UIImage(named: "Maserati"),
        UIImage(named: "Lexus"),
        UIImage(named: "Lamborghini"),
        UIImage(named: "Jaguar"),
        UIImage(named: "Ferrari"),
        UIImage(named: "Audi"),
        UIImage(named: "Aston")
    ]
    var state = Array(repeating: false, count: 16)
    var isOpened = false
    var lastOpenedButton = 0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfPictures.shuffle()
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        if state[sender.tag - 1] == false {
            sender.setBackgroundImage(arrayOfPictures[sender.tag - 1], for: .normal)
            
            if isOpened {
                if arrayOfPictures[lastOpenedButton - 1] == arrayOfPictures[sender.tag - 1] {
                    state[lastOpenedButton - 1] = true
                    state[sender.tag - 1] = true
                    count += 2
                    
                } else {
                    view.isUserInteractionEnabled = false
                    
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                        (self.view.viewWithTag(self.lastOpenedButton) as! UIButton)
                            .setBackgroundImage(UIImage(named: "Иконка"), for: .normal)
                        (self.view.viewWithTag(sender.tag) as! UIButton)
                            .setBackgroundImage(UIImage(named: "Иконка"), for: .normal)
                        
                        self.view.isUserInteractionEnabled = true
                    }
                }
            } else {
                lastOpenedButton = sender.tag
            }
            
            isOpened.toggle()
           
            
            if count == 16{
                let alert = UIAlertController(title: " Поздравляю! ", message: " Ты Выиграл! ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать сначала", style: .default, handler: { UIAlertAction in
                    clear()
                }))
                present(alert, animated: true, completion: nil)
            }
            
        func clear(){
            for i in 1...16{
                state[i-1] = false
               let button = view.viewWithTag(i) as! UIButton
                button.setBackgroundImage(UIImage(named: "Иконка"), for: .normal)
                count = 0
                arrayOfPictures.shuffle()
                    }
                }
            
        }
        
    }
}
