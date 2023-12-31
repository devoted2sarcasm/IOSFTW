//
//  CreateAccountViewController.swift
//  FTW_Bank
//
//  Created by user241217 on 7/18/23.
//

import Foundation
import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        // Set up logo image
        logoImageView.image = UIImage(named: "placeholder_logo")
        
        // Customize UI elements if needed
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        // Handle cancel button tap
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createAccountButtonTapped(_ sender: UIButton) {
        // Handle create account button tap
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""

        // Validate input fields
        if isValidInput(name: name, email: email, password: password, confirmPassword: confirmPassword) {
            if password == confirmPassword {
                // Perform account creation and database storage
                createAccount(name: name, email: email, password: password)
            } else {
                showToast(message: "Passwords do not match")
            }
        } else {
            showToast(message: "Invalid input")
        }
    }

    private func createAccount(name: String, email: String, password: String) {
        // Perform account creation and database storage
        // You can implement your own logic for creating the account and storing it in the database
        // For demonstration purposes, we will simply show a success message and dismiss the create account view controller
        
        showToast(message: "Account created successfully")
        dismiss(animated: true, completion: nil)
    }

    private func showToast(message: String) {
        let toast = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(toast, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                toast.dismiss(animated: true, completion: nil)
            }
        }
    }

    private func isValidInput(name: String, email: String, password: String, confirmPassword: String) -> Bool {
        // Implement input validation logic
        // You can define your own rules for input validation (e.g., minimum length, required characters, etc.)
        // For demonstration purposes, we will simply check if all fields are not empty
        return !name.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
}
