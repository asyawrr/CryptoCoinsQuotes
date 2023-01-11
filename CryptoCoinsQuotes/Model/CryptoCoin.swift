//
//  Model.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 27.12.2022.
//

// public api binance https://api2.binance.com/api/v3/ticker/24hr

//struct CryptoCoin: Codable {
//    let symbol: String?
//    let priceChange: String?
//    let priceChangePercent: String?
//    let prevClosePrice: String?
//    let lastPrice: String?
//    let highPrice: String?
//    let lowPrice: String?
//    let count: Int?
//}


// MARK: - CryptoCoin
struct CryptoCoin: Codable {
    let symbol: String?
    let priceChange: String?
    let priceChangePercent: String?
    let prevClosePrice: String?
    let lastPrice: String?
    let highPrice, lowPrice: String?
    let count: Int?
    
    init (
        symbol: String, priceChange: String,
        priceChangePercent: String, prevClosePrice: String,
        lastPrice: String, highPrice: String,
        lowPrice: String, count: Int
    ) {
        self.symbol = symbol
        self.priceChange = priceChange
        self.priceChangePercent = priceChangePercent
        self.prevClosePrice = prevClosePrice
        self.lastPrice = lastPrice
        self.highPrice = highPrice
        self.lowPrice = lowPrice
        self.count = count
    }
    
    init (coinData: [String : Any]) {
        symbol = coinData["symbol"] as? String
        priceChange = coinData["priceChange"] as? String
        priceChangePercent = coinData["priceChangePercent"] as? String
        prevClosePrice = coinData["prevClosePrice"] as? String
        lastPrice = coinData["lastPrice"] as? String
        highPrice = coinData["highPrice"] as? String
        lowPrice = coinData["lowPrice"] as? String
        count = coinData["count"] as? Int
    }
    
    enum CodingKeys: String, CaseIterable, CodingKey {
        case symbol 
        case priceChange
        case priceChangePercent
        case prevClosePrice
        case lastPrice
        case highPrice
        case lowPrice
        case count
    }
}

extension CryptoCoin {
    static func getData(for value: Any) -> [CryptoCoin] {
        guard let coinsData = value as? [[String : Any]] else { return [] }
        
        var coins = [CryptoCoin]()
        
        for coinData in coinsData {
            let coin = CryptoCoin(coinData: coinData)
            coins.append(coin)
        }
        return coins
    }
}
