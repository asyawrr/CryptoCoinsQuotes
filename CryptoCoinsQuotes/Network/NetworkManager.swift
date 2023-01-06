//
//  NetworkManager.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 05.01.2023.
//

import Foundation

let link = "https://api2.binance.com/api/v3/ticker/24hr"

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCryptoCoins(dataType: [CryptoCoin].Type, from url: String?, completion: @escaping(Result<[CryptoCoin], NetworkError>) -> Void ) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let decoder = JSONDecoder()
                let cryptoCoin = try decoder.decode([CryptoCoin].self, from: data)
                print("Here is result: \n", cryptoCoin)
                DispatchQueue.main.async {
                    completion(.success(cryptoCoin))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }

}
