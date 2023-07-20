//
//  AccountInfoViewController.swift
//  FTW_Bank
//
//  Created by user241217 on 7/18/23.
//

import Foundation
import UIKit
import SQLite3

class AccountInfoViewController: UIViewController {

    @IBOutlet weak var AccountNameField: UILabel!
    @IBOutlet weak var AccountNumberField: UILabel!
    @IBOutlet weak var AccountBalanceField: UILabel!
    @IBOutlet weak var viewTransactionsButton: UIButton!
    @IBOutlet weak var depositButton: UIButton!
    @IBOutlet weak var withdrawalButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!

    var name: String?
    var accountNumber: String?
    var balance: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        // Customize UI elements if needed
        AccountNameField.text = name ?? ""
        AccountNumberField.text = accountNumber ?? ""
        AccountBalanceField.text = "\(balance)"

        // Set button styles
        viewTransactionsButton.layer.cornerRadius = viewTransactionsButton.frame.height / 2
        depositButton.layer.cornerRadius = depositButton.frame.height / 2
        withdrawalButton.layer.cornerRadius = withdrawalButton.frame.height / 2
        logoutButton.layer.cornerRadius = logoutButton.frame.height / 2
    }

    @IBAction func viewTransactionsButtonTapped(_ sender: UIButton) {
        // Handle view transactions button tap
        showRecentTransactions()
    }

    @IBAction func depositButtonTapped(_ sender: UIButton) {
        // Handle deposit button tap
        showAmountInputDialog(title: "Make Deposit", completion: { amount in
            // Perform deposit logic and record transaction
            let transactionType = "Deposit"
            self.recordTransaction(transactionType: transactionType, amount: amount)
            self.updateBalance(with: amount)
        })
    }

    @IBAction func withdrawalButtonTapped(_ sender: UIButton) {
        // Handle withdrawal button tap
        showAmountInputDialog(title: "Make Withdrawal", completion: { amount in
            // Perform withdrawal logic and record transaction
            let transactionType = "Withdrawal"
            self.recordTransaction(transactionType: transactionType, amount: amount)
            self.updateBalance(with: -amount)
        })
    }

    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        // Handle logout button tap
        logout()
    }

    private func showRecentTransactions() {
        // Implement logic to fetch and display recent transactions in a pop-up dialog
        // You can create a custom pop-up dialog view or use UIAlertController with a table view
        
        // For demonstration purposes, we will display a simple alert with a message
        let alert = UIAlertController(title: "Recent Transactions", message: "Here are your recent transactions.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func showAmountInputDialog(title: String, completion: @escaping (Double) -> Void) {
        // Implement logic to display a pop-up dialog to input an amount
        // You can create a custom pop-up dialog view or use UIAlertController with a text field
        
        // For demonstration purposes, we will display an alert with a text field
        let alert = UIAlertController(title: title, message: "Enter the amount:", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.keyboardType = .decimalPad
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak alert] _ in
            guard let amountText = alert?.textFields?.first?.text,
                  let amount = Double(amountText) else {
                return
            }
            completion(amount)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func recordTransaction(transactionType: String, amount: Double) {
        // Implement logic to record the transaction in the master transactions table
        // You can perform the necessary database operations to store the transaction details
        
        // For demonstration purposes, we will print the transaction details
        let timestamp = Date()
        let transactionDetails = "\(transactionType) - Amount: \(amount) - Timestamp: \(timestamp)"
        print(transactionDetails)
    }

    private func updateBalance(with amount: Double) {
        // Update the balance label with the new balance after a deposit or withdrawal
        balance += amount
        AccountBalanceField.text = "\(balance)"
    }

    private func logout() {
        // Handle logout action by navigating back to the main login screen
        // You can also perform any necessary cleanup or data reset for the current session
        
        navigationController?.popToRootViewController(animated: true)
    }
}
