//
//  ViewController.swift
//  ParcingJSONApp
//
//  Created by Asya Sher on 27.12.2022.
//

import UIKit


class SelectViewController: UIViewController, UITableViewDelegate {

    // MARK: -IBOutlets
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var autocompleteTableView: UITableView!
    
    // MARK: -private statements
    private var coins: [CryptoCoin] = []
    var filtredCoins: [String] = []
    private var searching = false
    
    // MARK: -overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCryptoCoins()
        searchTextField.addTarget(self, action: #selector(searchRecord) , for: .editingChanged)
        searchTextField.delegate = self
        configureTableView()
    }
    
    // MARK: -IBActions
    @IBAction func searchButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showQuote", sender: nil)
    }
    //MARK: -Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuote" {
            guard let coinVC = segue.destination as? InfoViewController else { return }
            
        }
    }
    // MARK: -private methods
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
                    if rang e != nil {
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


// MARK: -extensions
extension SelectViewController: UITextFieldDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searching ? filtredCoins.count : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
 
        let coin = coins[indexPath.row].symbol
        content.text = coin
        cell.contentConfiguration = content
        return cell
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        autocompleteTableView.isHidden = false
//    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        searchTextField.resignFirstResponder()
//        return true
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)

        searchTextField.text = coins[indexPath.row].symbol
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
                print(coins)
            case .failure(let error):
                print(error)
            }
        }
    }
}



