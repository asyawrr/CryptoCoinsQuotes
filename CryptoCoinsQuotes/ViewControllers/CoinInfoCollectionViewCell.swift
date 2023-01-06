//
//  CoinInfoCollectionViewCell.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 05.01.2023.
//

import UIKit

class CoinInfoTableViewCell: UITableViewCell {
    
    // MARK: -IBOutlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    

    
    // MARK: -public methods
    func configure(with coin: CryptoCoin) {
        let coinCases = CryptoCoin.CodingKeys.allCases
//
//        for key in coinCases {
////            print(key)
//            titleLabel.text = "\(key.stringValue)"
//            descriptionLabel.text = "\(coin.priceChange)"
//            print(titleLabel.text, descriptionLabel.text)
//        }
        
        switch CryptoCoin {
        case .symbol:
            titleLabel.text = "symbol"
            descriptionLabel.text = coin.symbol
        case .count:
            titleLabel.text = "count"
            descriptionLabel.text = String(coin.count)
        case .highPrice:
            titleLabel.text = "high price"
            descriptionLabel.text = coin.highPrice
        case .lastPrice:
            titleLabel.text = "last price"
            descriptionLabel.text = coin.lastPrice
        case .lowPrice:
            titleLabel.text = "low price"
            descriptionLabel.text = coin.lowPrice
        case .prevClosePrice:
            titleLabel.text = "previous clode price"
            descriptionLabel.text = coin.prevClosePrice
        case .priceChangePercent:
            titleLabel.text = "price change in %"
            descriptionLabel.text = coin.priceChangePercent
        case .priceChange:
            titleLabel.text = "price change"
            descriptionLabel.text = coin.priceChange
        }
    }
}
