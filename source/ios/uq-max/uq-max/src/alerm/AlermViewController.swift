//
//  AlermViewController.swift
//  uq-max
//
//  Created by Yamato on 2019/05/19.
//  Copyright © 2019 Kohei Yamato. All rights reserved.
//

import UIKit

class AlermViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let times = ["6:00", "12:00",]
    let periods = ["毎週月曜日〜金曜日 - アラーム", "2019/8/29(日) - アラーム",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    /// セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する
        let cell: AlermCell = tableView.dequeueReusableCell(withIdentifier: "AlermCell", for: indexPath as IndexPath) as! AlermCell
        
        // セルに表示する値を設定する
        cell.timeLabel!.text = times[indexPath.row]
        cell.periodLabel!.text = periods[indexPath.row]
        
        return cell
    }
    
    /// セルが選択された時に呼ばれるデリゲートメソッド
    private func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) {
        print("セル番号：\(indexPath.row) セルの内容：\(times[indexPath.row])")
    }

}
