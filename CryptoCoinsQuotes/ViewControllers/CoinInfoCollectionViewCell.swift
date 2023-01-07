//
//  CoinInfoCollectionViewCell.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 05.01.2023.
//

import UIKit

class CoinInfoTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    

    
    // MARK: - public methods
    func configure(with cases: CryptoCoin.CodingKeys, coin: String) {
        
        titleLabel.text = cases.rawValue
        descriptionLabel.text = coin
//        switch cases {
//        case "symbol":
//            titleLabel.text = "symbol"
//            descriptionLabel.text = coin.symbol
//        case "count":
//            titleLabel.text = "count"
//            descriptionLabel.text = String(coin.count)
//        case "highPrice":
//            titleLabel.text = "high price"
//            descriptionLabel.text = coin.highPrice
//        case "lastPrice":
//            titleLabel.text = "last price"
//            descriptionLabel.text = coin.lastPrice
//        case "lowPrice":
//            titleLabel.text = "low price"
//            descriptionLabel.text = coin.lowPrice
//        case "prevClosePrice":
//            titleLabel.text = "previous close price"
//            descriptionLabel.text = coin.prevClosePrice
//        case "priceChangePercent":
//            titleLabel.text = "price change in %"
//            descriptionLabel.text = coin.priceChangePercent
//        default:
//            titleLabel.text = "price change"
//            descriptionLabel.text = coin.priceChange
//        }
    }
    
}
