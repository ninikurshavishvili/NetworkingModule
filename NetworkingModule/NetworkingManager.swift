//
//  NetworkingManager.swift
//  NetworkingModule
//
//  Created by Nino Kurshavishvili on 10.11.24.
//

import Foundation

public class NetworkingManager: NetworkProtocol {
    public init() {}
    
    public func fetchData<T: Decodable>(
        from urlString: String,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 1001, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 1002, userInfo: nil)))
                print("no data")
                return
            }
            
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
                print("yes data")
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}



