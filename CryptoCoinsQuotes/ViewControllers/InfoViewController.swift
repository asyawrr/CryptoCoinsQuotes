//
//  InfoViewController.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 05.01.2023.
//

import UIKit

class InfoViewController: UITableViewController {
    
//    private let coin: CryptoCoin!
    
    // MARK: -overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: -override methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as? CoinInfoTableViewCell
        else { return UITableViewCell() }
                

        // Configure the cell...

        return cell
    }
   

}
