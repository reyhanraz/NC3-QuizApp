//
//  LeaderBoardVC.swift
//  NC3-QuizApp
//
//  Created by Reyhan Rifqi on 08/06/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import UIKit

class LeaderBoardVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableLeaderBoard: UITableView!
    let arr = ["Jono", "Budi","Dina"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableLeaderBoard.dataSource = self
        tableLeaderBoard.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderBoardCell", for: indexPath) as! LeaderBoardViewCell
        cell.userNamelbl.text = arr[indexPath.row]
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class LeaderBoardViewCell: UITableViewCell {
      
    @IBOutlet weak var userNamelbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userPointsLbl: UILabel!
    
    
}
