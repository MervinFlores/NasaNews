//
//  NetworkHandler.swift
//  NasaNews
//
//  Created by Mervin Flores on 2/29/24.
//

import Foundation
import Combine

protocol NetworkHandler {
    func fetchData<Result: Codable>(_ type: Result.Type, urlString: String) -> AnyPublisher<Result, NetworkError>
}

