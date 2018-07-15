//
//  ViewController.swift
//  IPrep
//
//  Created by IKNS on 7/4/18.
//  Copyright © 2018 Satish Kumar R Kancherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var categories = [CModel]()
    var selectedRow = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        QService.instance.getAllQuestions(success: { (cats) in
            self.categories = cats
            self.tableView.reloadData()
        }) { (error) in
            
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        self.performSegue(withIdentifier: "csegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = self.categories[indexPath.row].category ?? ""
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? QViewController {
            let cmodel = self.categories[self.selectedRow]
            vc.category = cmodel
        }
    }
}

