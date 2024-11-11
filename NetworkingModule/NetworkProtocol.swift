//
//  NetworkProtocol.swift
//  NetworkingModule
//
//  Created by Nino Kurshavishvili on 10.11.24.
//

// NetworkProtocol.swift

import Foundation

public protocol NetworkProtocol {
    func fetchData<T: Decodable>(
        from urlString: String,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    )
}



