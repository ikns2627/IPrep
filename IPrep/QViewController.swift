//
//  QViewController.swift
//  IPrep
//
//  Created by Satish Kancherla on 7/5/18.
//  Copyright © 2018 Satish Kumar R Kancherla. All rights reserved.
//

import UIKit

class QViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var selectedRow = 0
    var category: CModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = category?.category
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.category?.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = self.category?.questions![indexPath.row].name ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        self.performSegue(withIdentifier: "qsegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WebViewController {
            if let qs = self.category?.questions{
                vc.link = qs[self.selectedRow].link ?? ""
                vc.title = qs[self.selectedRow].name
            }
        }
    }

}
