//
//  AlermAddViewController.swift
//  uq-max
//
//  Created by Yamato on 2019/05/19.
//  Copyright © 2019 Kohei Yamato. All rights reserved.
//

import UIKit
import Pring

class AlermAddViewController: UIViewController {

    @IBOutlet weak var sleepTimePicker: UIDatePicker!
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }

    @IBOutlet weak var alarmSettingView: UIView!
    
    // 保存ボタン押下時
    @IBAction func saveButton(_ sender: UIButton) {
        
        // 時刻を取得し、DBに保存
        let alerm: Alerm = Alerm()
        alerm.time = sleepTimePicker.date
        alerm.period = [ "月", "火" ]
        alerm.save()
        
        // アラームTOPを取得
        let pvc = self.presentingViewController as? AlermViewController
        
        // アラームTOPを更新
        pvc?.updateLabel()
        
        //　画面を閉じる
        self.dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //UIDatePickerを.timeモードにする
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        //現在の時間をDatePickerに表示
        sleepTimePicker.setDate(Date(), animated: false)
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            // identifierが取れなかったら処理やめる
            return
        }
        
        if(identifier == "ncSegue") {
            // NavigationControllerへの遷移の場合
            
            // segueから遷移先のNavigationControllerを取得
            let nc = segue.destination as! UINavigationController
            
            // NavigationControllerの一番目のViewControllerが次の画面
            let vc = nc.topViewController as! WeekTableViewController

            // 次画面のテキスト表示用のStringに、本画面のテキストフィールドのテキストを入れる
//            vc.receiveText = "auau"
            
        }
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
