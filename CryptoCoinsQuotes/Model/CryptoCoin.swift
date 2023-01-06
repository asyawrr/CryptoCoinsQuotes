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
    let symbol: String
    let priceChange: String
    let priceChangePercent: String
    let prevClosePrice: String
    let lastPrice: String
    let highPrice, lowPrice: String
    let count: Int

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

