//
//  ViewController.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 27.12.2022.
//

import UIKit


class SelectViewController: UIViewController, UITableViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var autocompleteTableView: UITableView!
    
    // MARK: - private statements
    private var coins: [CryptoCoin] = []
    private var filtredCoins: [String] = []
    private var searching = false
    
    // MARK: -overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCryptoCoins()
        searchTextField.addTarget(self, action: #selector(searchRecord) , for: .editingChanged)
        searchTextField.delegate = self
        configureTableView()
    }
    
    // MARK: - IBActions
    @IBAction func searchButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showQuote", sender: nil)
    }
    //MARK: -Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let coinVC = segue.destination as? InfoViewController else { return }
        for coin in coins {
            if searchTextField.text == coin.symbol {
                coinVC.coin = coin
            }
        }
    }

    // MARK: - private methods
    private func configureTableView() {
        autocompleteTableView.delegate = self
        autocompleteTableView.dataSource = self
        autocompleteTableView.rowHeight = 40
        autocompleteTableView.isScrollEnabled = true
    }
    
    @objc private func searchRecord(sender: UITextField) {
        self.filtredCoins.removeAll()
        let searchData = searchTextField.text!.count
        
        if searchData != 0 {
            searching = true
            for coin in coins {
                if let coinToSearch = searchTextField.text {
                    let range = coin.symbol.range(of: coinToSearch, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil {
                        self.filtredCoins.append(coin.symbol)
                    }
                }
            }
        } else {
            filtredCoins = []
            searching = false
        }
        autocompleteTableView.reloadData()
    }
}


// MARK: - UITableViewDataSourse
extension SelectViewController: UITextFieldDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searching ? filtredCoins.count : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = autocompleteTableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        if searching {
            content.text = filtredCoins[indexPath.row]
        } else {
            content.text = coins[indexPath.row].symbol
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTextField.text = filtredCoins[indexPath.row]
    }
}


// MARK: - Networking
extension SelectViewController {
    func fetchCryptoCoins() {
        NetworkManager.shared.fetchCryptoCoins(dataType: [CryptoCoin].self, from: link) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.coins = coins
                self?.autocompleteTableView.reloadData()
//                print(coins)
            case .failure(let error):
                print(error)
            }
        }
    }
}



