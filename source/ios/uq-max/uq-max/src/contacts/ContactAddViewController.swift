//
//  ContactAddViewController.swift
//  uq-max
//
//  Created by Yamato on 2019/06/22.
//  Copyright © 2019 Kohei Yamato. All rights reserved.
//

import UIKit

class ContactAddViewController: UIViewController {

    // キャンセルボタン押下時
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 保存ボタン押下時
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        let contact: Contact = Contact()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
