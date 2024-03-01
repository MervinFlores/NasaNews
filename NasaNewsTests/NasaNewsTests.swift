//
//  NasaNewsTests.swift
//  NasaNewsTests
//
//  Created by Mervin Flores on 2/29/24.
//

import XCTest
import Combine
@testable import NasaNews

class NasaNewsTests: XCTestCase {
    private var mockNetworkManager: MockNetworkManager?
    private var cancellables: [AnyCancellable] = []

    override func setUpWithError() throws {
        mockNetworkManager = MockNetworkManager()
    }

    override func tearDownWithError() throws {
        mockNetworkManager = nil
        cancellables = []
    }
    
    func testFetchData() {
        let testExpection = XCTestExpectation(description: "Fetch nasa items from images-api.nasa.gov")
        let expectedResponse = Response(message: [
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
        ])
        
        mockNetworkManager?.fetchData(Response.self, urlString: nasaListUrl)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    XCTAssertNotNil(error)
                    XCTFail(error.localizedDescription)
                    testExpection.fulfill()
                case .finished:
                    testExpection.fulfill()
                }
            }, receiveValue: { response in
                XCTAssertNotNil(response)
                XCTAssertEqual(response, expectedResponse)
                testExpection.fulfill()
            }).store(in: &cancellables)
        
        wait(for: [testExpection], timeout: 20)
    }

}
