//
//  TableViewController.swift
//  homework Detail
//
//  Created by Admin on 22.01.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var quotes = Singleton.shared.quotes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ff()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ff()
    }
    
    func ff() {
        Singleton.shared.quotes?.append(Quote(text: "lox", author: "aa"))
        quotes?.append(Quote(text: "lox 2", author: "aa 2"))
        tableView.reloadData()
        print(quotes)
    }
    

    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let guotes = quotes else { return 0 }
        return guotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.initCell(quote: quotes, indexPath: indexPath)
        return cell
    }
    

   
    
    // MARK: - ... Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let _ = sender as? UIBarButtonItem, let _ = segue.destination as? ViewController {
        } else if let cell = sender as? UITableViewCell, let vc = segue.destination as? ViewController {
            if let indexPath = tableView.indexPath(for: cell) {
                vc.quote = quotes![indexPath.row]
            }
        }
    }

}
