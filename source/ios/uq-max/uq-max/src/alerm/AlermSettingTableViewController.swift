//
//  AlermSettingTableViewController.swift
//  uq-max
//
//  Created by Yamato on 2019/06/11.
//  Copyright © 2019 Kohei Yamato. All rights reserved.
//

import UIKit

class AlermSettingTableViewController: UITableViewController, UITextViewDelegate {

    @IBOutlet weak var periodLabel: UILabel!

    var periodArray = [] as Array<Int>
    var period : String?
    var weekday = [1, 2, 3, 4, 5] as Array<Int>
    var weekend = [0, 6] as Array<Int>

    func getWeek() {
        
        // 未選択の場合
        if (periodArray.count == 0) {
            period = "しない"
            
            // 平日の場合
        } else if (periodArray == weekday) {
            period = "平日"
            // 週末の場合
        } else if (periodArray == weekend) {
            period = "週末"
            // 毎日の場合
        } else if (periodArray.count == 7) {
            period = "アラーム、毎日"
        } else {
            period = "アラーム、毎"
            for i in periodArray {
                period = period! + Const.WEEK[i] + " "
            }
        }
        periodLabel.text = period
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        periodLabel.text = "しない"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
