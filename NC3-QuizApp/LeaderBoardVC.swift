//
//  LeaderBoardVC.swift
//  NC3-QuizApp
//
//  Created by Reyhan Rifqi on 08/06/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import UIKit

class LeaderBoardVC: UIViewController{
    
    
    @IBOutlet weak var tableLeaderBoard: UITableView!
    @IBOutlet weak var rank1Image: UIImageView!
    @IBOutlet weak var rank2Image: UIImageView!
    @IBOutlet weak var rank3Image: UIImageView!

    
    var arrayUser: [users] = [
        users(userName: "Mike", points: 150, profilePic: "avatar_1.png"),
        users(userName: "Bryan", points: 100, profilePic: "avatar_3.png"),
        users(userName: "Sam", points: 2000, profilePic: "avatar_5.png"),
        users(userName: "Rachel", points: 1000, profilePic: "avatar_6.png"),
        users(userName: "Sarah", points: 700, profilePic: "avatar_2.png"),
        users(userName: "Adam", points: 500, profilePic: "avatar_4.png"),
        users(userName: "Budi", points: 200, profilePic: "avatar_1.png"),
        users(userName: "Angel", points: 50, profilePic: "avatar_6.png"),
        users(userName: "Amanda", points: 30, profilePic: "avatar_2.png"),
        users(userName: data.string(forKey: "userName")!, points: data.integer(forKey: "Points"), profilePic: data.string(forKey: "ProfileImage")!)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopMusic()
        
        rank1Image.layer.cornerRadius = 35
        rank2Image.layer.cornerRadius = 30
        rank3Image.layer.cornerRadius = 30

        arrayUser.sort(by: { $0.points > $1.points })
        
        rank1Image.image = UIImage(named: arrayUser[0].profilePic)
        rank2Image.image = UIImage(named: arrayUser[1].profilePic)
        rank3Image.image = UIImage(named: arrayUser[2].profilePic)
        
        tableLeaderBoard.backgroundColor = .clear
        
        tableLeaderBoard.dataSource = self
        tableLeaderBoard.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension LeaderBoardVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayUser.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderBoardCell", for: indexPath) as! LeaderBoardViewCell
        let user = arrayUser[indexPath.section]
        if user.userName == data.string(forKey: "userName"){
            cell.backgroundColor = UIColor.orange
        }else{
            cell.backgroundColor = UIColor.white
        }
        cell.layer.cornerRadius = 7
        cell.rankLabel.text = "\(indexPath.section+1)."
        cell.userNamelbl.text = user.userName
        cell.profileImage.image = UIImage(named: user.profilePic)
        cell.userPointsLbl.text = "\(user.points)"
        cell.clipsToBounds = true

        
        return cell
    }
    
    
    
}

class LeaderBoardViewCell: UITableViewCell {
      
    @IBOutlet weak var userNamelbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userPointsLbl: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    
}
