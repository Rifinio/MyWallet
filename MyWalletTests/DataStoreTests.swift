//
//  DataStoreTests.swift
//  MyWalletTests
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import XCTest
@testable import MyWallet

class DataStoreTests: XCTestCase {

    var account: Account!

    override func setUp() {
        account = DataStore().loadAccount()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAccountIsCreatedCorrectly() {
        XCTAssertEqual(account.balance, 100.2)
        XCTAssertEqual(account.account, "NL30MOYO0001234567")
        XCTAssertEqual(account.transactions?.count, 5)
        XCTAssertEqual(account.type, AccountType.checkingAccount)
    }
}
