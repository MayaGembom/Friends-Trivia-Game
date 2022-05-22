//
//  ViewController.swift
//  Friends-Trivia-Game
//
//  Created by user216459 on 5/21/22.
//

import UIKit

class ViewController: UIViewController {

    let Url = "https://pastebin.com/wJ4vJnDh"
    var dataManager:DataManager!
    
    @IBOutlet weak var buttonA1: UIButton!
    @IBOutlet weak var buttonA2: UIButton!
    @IBOutlet weak var buttonA3: UIButton!
    @IBOutlet weak var buttonA4: UIButton!
    
    @IBOutlet weak var panel_LBL_counter: UILabel!
    @IBOutlet weak var panel_IMG_question: UIImageView!
    @IBOutlet weak var panel_PRB_progress: UIProgressView!
    
    @IBOutlet weak var panel_IMG_1: UIImageView!
    
    @IBOutlet weak var panel_IMG_2: UIImageView!
    
    @IBOutlet weak var panel_IMG_3: UIImageView!
    
    var lives:[UIImageView]!
    var game_counter = 0
    var live = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataManager = DataManager()
        dataManager.fetchFromServer(url: <#T##String#>, delegate: <#T##CallBack_Data#>)
        
        initView()
        gameflow()
                
    }
    
    func initView(){
        live = 3
        panel_LBL_counter.text = "\(game_counter) / 15"
        lives = [panel_IMG_1, panel_IMG_2, panel_IMG_3]
            }
    
    func nextQuestion(){
          Quastion q = dataManager.data?.allQuastions.
      }
    
}
    
    func gameflow(){
           while((game_counter != 15) || (live != 0)){
               nextQuestion()
           }
       }

}



extension ViewController:CallBack_Data{
    func gotData(model: MyData) {
        dataManager.setData(data: model)
    }
}

