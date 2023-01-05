//
//  ViewController.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 27.12.2022.
//

import UIKit

let link = "https://api2.binance.com/api/v3/ticker/24hr"

class SelectViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCryptoCoins()
    }


}

extension SelectViewController {
    private func fetchCryptoCoins() {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let cryptoCoin = try JSONDecoder().decode([CryptoCoin].self, from: data)
                print("Here is result: \n", cryptoCoin)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

