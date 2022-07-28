//
//  AlamofireRequestTests.swift
//  AlamofireRequestTests
//
//  Created by Daljeet Singh on 12/05/20.
//  Copyright © 2020 Daljeet Singh. All rights reserved.
//

import XCTest

@testable import AlamofireRequest

class AlamofireRequestTests: XCTestCase {

    var sut: ViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(withIdentifier: "MainView") as? ViewController
        sut.loadViewIfNeeded()
   
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testTextWithout() {
        sut.searchyourMovie()
        XCTAssertEqual(sut.searchTF.text, "", "textfield is empty")
    }

}
