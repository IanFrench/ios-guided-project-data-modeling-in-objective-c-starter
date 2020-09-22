//
//  Quakes_ObjcTests.m
//  Quakes-ObjcTests
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "../Quakes-Objc/LambdaSDK/LSIFileHelper.h"
#import "../Quakes-Objc/LambdaSDK/LSILog.h"

@interface Quakes_ObjcTests : XCTestCase

@end

@implementation Quakes_ObjcTests

- (void)testQuakeParsing
{
    NSData *quakeData = loadFile(@"Quake.json", Quakes_ObjcTests.class);
//    NSLog(@":robot_face: Quake (as data): %@", quakeData);
//    NSString *quakeJSONString = [[NSString alloc] initWithData:quakeData encoding:NSUTF8StringEncoding];
//    NSLog(@":robot_face: Quake (as string): %@", quakeJSONString);
//    NSDictionary *quakeDictionary = [NSJSONSerialization JSONObjectWithData:quakeData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:NULL];
//    NSLog(@":robot_face: Quake (as dictionary): %@", quakeDictionary);
    // Bit masking:
    // 0000 0001
    // 0000 0100
    // =========
    // 0000 0101
    NSError *jsonError = nil;
    NSDictionary *quakeDictionary = [NSJSONSerialization JSONObjectWithData:quakeData options:0 error:&jsonError];
    XCTAssertNotNil(quakeDictionary);
    if (!quakeDictionary) {
        NSLog(@":robot_face: We've got an error: %@", jsonError);
    }
    XCTAssertTrue([quakeDictionary isKindOfClass:NSDictionary.class]);
    if (![quakeDictionary isKindOfClass:NSDictionary.class]) {
        NSLog(@":robot_face: quakeDictionary is not a dictionary!!");
        return;
    }
    NSLog(@":robot_face: Quake (as dictionary): %@", quakeDictionary);

    NSLog(@"quake: %@", quake);
    
     NSDate *time = [NSDate dateWithTimeIntervalSince1970:1388620296020 / 1000.0];
     XCTAssertEqualWithAccuracy(1.29, quake.magnitude, 0.0001);
     XCTAssertEqualObjects(@"10km SSW of Idyllwild, CA", quake.place);
     XCTAssertEqualObjects(time, quake.time);
     // For now we'll just set the alert to nil, you may want to use @"" instead
     XCTAssertNil(quake.alert);
     XCTAssertEqualObjects(@"earthquake", quake.type);
     XCTAssertEqualWithAccuracy(33.663333299999998, quake.latitude, 0.0001);
     XCTAssertEqualWithAccuracy(-116.7776667, quake.longitude, 0.0001);
    
}




@end
