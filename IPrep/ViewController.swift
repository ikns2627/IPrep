//
//  ViewController.swift
//  IPrep
//
//  Created by IKNS on 7/4/18.
//  Copyright © 2018 Satish Kumar R Kancherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var categories = [CModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        QService.instance.getAllQuestions(success: { (cats) in
            self.categories = cats
        }) { (error) in
            
        }
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = self.categories[indexPath.row].category ?? ""
        return cell
    }
}

