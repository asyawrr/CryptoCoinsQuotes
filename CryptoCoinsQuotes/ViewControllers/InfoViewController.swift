//
//  InfoViewController.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 05.01.2023.
//

import UIKit

class InfoViewController: UITableViewController {
    
    
    // MARK: - public statements
    var coin: CryptoCoin!
    
    
    //MARK: - private statements
    private let coinCases = CryptoCoin.CodingKeys.allCases
    private var coinDescription: [String] {
        [coin.symbol, coin.priceChange, coin.priceChangePercent,
        coin.prevClosePrice, coin.lowPrice, coin.lastPrice,
        coin.highPrice, String(coin.count)]
    }
    
    // MARK: - overrides methods VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = coin.symbol
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
    }
    
    // MARK: - overrides methods of class

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coinCases.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "coinInfoCell", for: indexPath) as? CoinInfoTableViewCell
        else {
            return UITableViewCell()
        }
        let coinCase = coinCases[indexPath.item]
        let coin = coinDescription[indexPath.item]
        
        cell.configure(with: coinCase, coin: coin)
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
    
    // MARK: - private methods
    private func getCurrentTime() -> String {
        DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .short)
    }
        
}
