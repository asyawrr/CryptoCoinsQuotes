//
//  InfoViewController.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 05.01.2023.
//

import UIKit

class InfoViewController: UITableViewController {
    
    // MARK: -public statements
    var coin: CryptoCoin!
    
    // MARK: -overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = coin.symbol
    }

    // MARK: -override methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CryptoCoin.CodingKeys.allCases.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "coinInfoCell", for: indexPath) as? CoinInfoTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: coin)
        return cell
    }
   

}
