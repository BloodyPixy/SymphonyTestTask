//
//  NetworkManagerTestClass.m
//  SymphonyTask
//
//  Created by Taras Pasichnyk on 3/3/16.
//  Copyright © 2016 Taras Pasichnyk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetworkManager.h"

@interface NetworkManagerTestClass : XCTestCase

@end

@implementation NetworkManagerTestClass

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testDownloadUsersJson
{
    XCTestExpectation* expectation = [self expectationWithDescription:@"HTTP request"];
    
    [[NetworkManager sharedManager] getUsersWithCompletion:^(NSArray *usersArray) {
        XCTAssertNotNil(usersArray, @"getUsersWithCompletion failed to get data");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

@end
