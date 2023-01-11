//
//  NetworkManager.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 05.01.2023.
//

import Foundation
import Alamofire

let link = "https://api2.binance.com/api/v3/ticker/24hr"

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCryptoCoins(dataType: [CryptoCoin].Type, from url: String?, completion: @escaping(Result<[CryptoCoin], AFError>) -> Void ) {
        
        //without AF, autoparcing
        
        //        guard let url = URL(string: url ?? "") else {
        //            completion(.failure(.invalidURL))
        //            return
        //        }
        //
        //        URLSession.shared.dataTask(with: url) { data, _, error in
        //            guard let data = data else {
        //                completion(.failure(.noData))
        //                print(error?.localizedDescription ?? "No error description")
        //                return
        //            }
        //
        //            do {
        //                let decoder = JSONDecoder()
        //                let cryptoCoin = try decoder.decode([CryptoCoin].self, from: data)
        //                print("Here is result: \n", cryptoCoin)
        //
        //                DispatchQueue.main.async {
        //                    completion(.success(cryptoCoin))
        //                }
        //            } catch {
        //                completion(.failure(.decodingError))
        //            }
        //        }.resume()
        //    }
        
        // with AF
        
        AF.request(link)
            .validate()
            .responseJSON { [weak self] dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let coins = CryptoCoin.getData(for: value)
                    completion(.success(coins))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
