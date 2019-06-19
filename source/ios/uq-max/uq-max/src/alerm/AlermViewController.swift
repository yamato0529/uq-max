//
//  AlermViewController.swift
//  uq-max
//
//  Created by Yamato on 2019/05/19.
//  Copyright © 2019 Kohei Yamato. All rights reserved.
//

import UIKit
import Pring

class AlermViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func editButton(_ sender: UIBarButtonItem) {
        
    }

    let periods = ["毎週月曜日〜金曜日 - アラーム", "2019/8/29(日) - アラーム",]
    
    @IBOutlet weak var tableView: UITableView!

    // DataSource
    var dataSource: DataSource<Alerm>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // DataSourceを準備
        self.dataSource = Alerm.order(by: \Alerm.time).dataSource()
            .on({ [weak self] (snapshot, changes) in
                guard let tableView: UITableView = self?.tableView else { return }
                switch changes {
                case .initial:
                    tableView.reloadData()
                case .update(let deletions, let insertions, let modifications):
                    tableView.beginUpdates()
                    tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                    tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                    tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                    tableView.endUpdates()
                case .error(let error):
                    print(error)
                }
            }).listen()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.count ?? 0
    }
    
    func updateLabel() {

        tableView.reloadData()
    }

    /// セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 日付情報を取得
        let alerm: Alerm = self.dataSource![indexPath.row]
        
        // Date型を日付形式で変換
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "HH:mm", options: 0, locale: Locale(identifier: "ja_JP"))
        let time = formatter.string(from: alerm.time!)

        let aryPeriod = alerm.period
        
        //
        var period: String
        if (aryPeriod?.count == 0) {
            period = "アラーム"
        } else if (aryPeriod?.count == 7) {
            period = "アラーム、毎日"
        } else {
            period = "アラーム、"
            for i in aryPeriod! {
                period += i + " "
            }
        }
        
        // セルを取得する
        let cell: AlermCell = tableView.dequeueReusableCell(withIdentifier: "AlermCell", for: indexPath as IndexPath) as! AlermCell

        // セルに表示する値を設定する
        cell.timeLabel!.text = time
        cell.periodLabel!.text = period

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.dataSource!.removeDocument(at: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        // override前の処理を継続してさせる
        super.setEditing(editing, animated: animated)
        // tableViewの編集モードを切り替える
        tableView.isEditing = editing //editingはBool型でeditButtonに依存する変数
        
        navigationItem.leftBarButtonItem?.title = ""
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func deleteAlerm(forRowAt indexPath: IndexPath) {
        self.dataSource!.removeDocument(at: indexPath.row)
    }
    
    private func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "削除"
    }
}
