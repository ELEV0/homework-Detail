//
//  TableViewController.swift
//  homework Detail
//
//  Created by Admin on 22.01.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var quotes: [Quote]? = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let quotes = quotes else { return 0 }
        return quotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.initCell(quote: quotes, indexPath: indexPath)
        return cell
    }
    

   
    
    // MARK: - ... Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let _ = sender as? UIBarButtonItem, let vc = segue.destination as? ViewController {
            vc.bool = false
        } else if let cell = sender as? UITableViewCell, let vc = segue.destination as? ViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                vc.quote = quotes![indexPath.row]
//                quotes?.remove(at: indexPath.row)
                vc.bool = true
            }
        }
    }

}

extension TableViewController: Sendable {
    func passData(data: Quote) {
        quotes?.append(data)
    }
}
