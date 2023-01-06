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
    let coinCases = CryptoCoin.CodingKeys.allCases.map{ $0.stringValue }
    
    // MARK: -overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = coin.symbol
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        
    }

    // MARK: -override methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coinCases.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "coinInfoCell", for: indexPath) as? CoinInfoTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(with: coinCases[indexPath.item], coin: coin)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let dateLabel = UILabel()
        dateLabel.numberOfLines = 0
        dateLabel.text = getCurrentTime()
        dateLabel.textColor = .gray
        return dateLabel
        
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    // MARK: -private methods
    func getCurrentTime() -> String {
        DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .short)
    }
}
