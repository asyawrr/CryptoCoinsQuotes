//
//  Model.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 27.12.2022.
//


// public api binance https://api2.binance.com/api/v3/ticker/24hr

struct CryptoCoin: Decodable {
    let symbol: String?
    let priceChange: String?
    let priceChangePercent: String?
    let weightedAvgPrice: String?
    let prevClosePrice: String?
    let lastPrice: String?
    let lastQty: String?
    let bidPrice: String?
    let bidQty: String?
    let askPrice: String?
    let askQty: String?
    let openPrice: String?
    let highPrice: String?
    let lowPrice: String?
    let volume: String?
    let quoteVolume: String?
    let openTime: Int?
    let closeTime: Int?
    let firstId: Int?
    let lastId: Int?
    let count: Int?
}
