//
//  EndGameVC.swift
//  NC3-QuizApp
//
//  Created by Reyhan Rifqi on 13/06/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import UIKit

class EndGameVC: UIViewController {
    
    var dynamicAnimator: UIDynamicAnimator!
    var gravityBehaviour: UIGravityBehavior!
    var collisionBehaviour: UICollisionBehavior!
    
    @IBOutlet weak var titleMessageLbl: UILabel!
    @IBOutlet weak var trophy: UIImageView!
    @IBOutlet weak var messageLbl: UILabel!
    var points = 0
    var arrayOfCoins: [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        trophy.removeFromSuperview()
        
        if points > 0{
            messageLbl.text = "You did a really great job\nand earned \(points) points!"
            var loop = 0
            while loop < 50{
                pointss()
                loop += 1
            }
            animateCoins()
            trophy.image = #imageLiteral(resourceName: "trophy_label")
        }else{
            titleMessageLbl.text = "Sorry!"
            messageLbl.text = "You didn't get any points\nGood Luck next time"
            trophy.image = #imageLiteral(resourceName: "trophy_Lose")
        }
        
        view.addSubview(trophy)
    }
    
    func pointss(){
        let coins: UIImageView = {
            let image = UIImageView(frame: CGRect(x: 195, y: 355, width: 25, height: 25))
            image.contentMode = .scaleAspectFit
            //image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: "points_in_trophy")
            return image
            }()
        self.view.addSubview(coins)
        coins.alpha = 0
        coins.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70).isActive = true
        coins.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        arrayOfCoins.append(coins)
    }
    
    func randomizer(batasAtas: UInt32)-> CGFloat{
        return CGFloat(arc4random_uniform(batasAtas))
    }
    
    func animateCoins(){
        let safeArea = view.safeAreaLayoutGuide
        let maxX = safeArea.layoutFrame.size.width
        let maxY = trophy.center.y
        
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            for items in self.arrayOfCoins{
                let randomX = self.randomizer(batasAtas: UInt32(maxX))
                let randomY = self.randomizer(batasAtas: UInt32(maxY))
                items.alpha = 1
                items.center.x = randomX
                items.center.y = randomY
            }
        }) { (_) in
            playSound(title: "CoinsDropped", ext: "mp3")
            self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
                
                self.gravityBehaviour = UIGravityBehavior(items: self.arrayOfCoins)
                
                self.dynamicAnimator.addBehavior(self.gravityBehaviour)
                
                self.collisionBehaviour = UICollisionBehavior(items: self.arrayOfCoins)
                self.dynamicAnimator.addBehavior(self.collisionBehaviour)
        
                self.collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
//            self.collisionBehaviour.collisionMode = .
        }
    }
    
    @IBAction func continueBtnPressed(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers ;
        for aViewController in viewControllers {
            if(aViewController is LandingVCViewController){
               self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
    }
    
}
