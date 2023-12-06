//
//  APIManager.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 12/4/23.
//

import Foundation

class APIManager {
    static let shared = APIManager()

    func getStates(completion: @escaping ([StateModel]) -> Void) {
        guard let url = URL(string: "http://localhost:8080/states") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([StateModel].self, from: data) {
                    DispatchQueue.main.async {
                        print("States Response: \(decodedResponse)")
                        completion(decodedResponse)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

    func getOrganizationsByStateId(stateId: Int, completion: @escaping ([OrganizationModel]) -> Void) {
        guard let url = URL(string: "http://localhost:8080/organizations/\(stateId)") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([OrganizationModel].self, from: data) {
                    DispatchQueue.main.async {
                        print("Organizations Response: \(decodedResponse)")
                        completion(decodedResponse)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

    func sendOTPRequest(phoneNumber: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://localhost:8082/sendSms") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let fullPhoneNumber = "+1\(phoneNumber)"
        let body: [String: Any] = ["phoneNumber": fullPhoneNumber, "address": "0x03fcDbb718cDDb25ab4c07D77e1511c5bbF5D126"]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { _, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error sending OTP request: \(error)")
                    completion(false)
                } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }.resume()
    }

    func verifyOTP(phoneNumber: String, otpCode: String, completion: @escaping (Bool, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:8082/verifyOtp") else {
            completion(false, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let fullPhoneNumber = "+1\(phoneNumber)"
        let body: [String: Any] = [
            "otp": otpCode,
            "phoneNumber": fullPhoneNumber,
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error)
                } else if data != nil {
                    // Handle the response here. For simplicity, I'm just calling completion with true.
                    // You should parse the response and act accordingly.
                    completion(true, nil)
                }
            }
        }.resume()
    }
}
