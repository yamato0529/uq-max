//
//  WeekTableViewController.swift
//  uq-max
//
//  Created by Yamato on 2019/05/21.
//  Copyright © 2019 Kohei Yamato. All rights reserved.
//

import UIKit

class WeekTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var arraySelect = [] as Array<Int>
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        
        // アラーム追加画面を取得
        if let navigationController =  self.presentingViewController as? UINavigationController,
        let pvc = navigationController.topViewController as? AlermSettingTableViewController {
            pvc.periodArray = arraySelect
            pvc.getWeek()
        }

        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.allowsMultipleSelection = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.EVERY_WEEK.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "weekCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = Const.EVERY_WEEK[indexPath.row]
        
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        arraySelect.append(indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        arraySelect.removeObject(value: indexPath.row)
        
    }
}
