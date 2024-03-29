//
//  MockNetworkManager.swift
//  NasaNewsTests
//
//  Created by Mervin Flores on 2/29/24.
//

import Foundation
import Combine
@testable import NasaNews

struct MockNetworkManager: NetworkHandler {
    func fetchData<Result>(_ type: Result.Type, urlString: String) -> AnyPublisher<Result, NetworkError> {
        Just(Response(message: [
            "collection": [
                    "items": [
                            "date_created": "2002-03-20T00:00:00Z",
                            "description": """
                            VSHAIP test in 7x10ft#1 W.T. (multiple model configruations) V-22 helicopter shipboard aerodynamic interaction program: L-R seated Allen Wadcox, (standind) Mark Betzina, seated in front of computer Gloria Yamauchi, in background Kurt Long.
                            """,
                            "photographer": "Tom Trower",
                            "title": "ARC-2002-ACD02-0056-22"
                        ]
                ]
        ]) as! Result)
        .setFailureType(to: NetworkError.self)
        .eraseToAnyPublisher()
    }
}

struct Response: Codable, Equatable {
    let message: [String: [String: [String: String]]]
}
