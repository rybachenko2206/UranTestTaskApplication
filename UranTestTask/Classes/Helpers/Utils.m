//
//  Utils.m
//  UranTestTask
//
//  Created by Roman Rybachenko on 12/28/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSUInteger)getRandomNumberBetween:(NSUInteger)from to:(NSUInteger)to {
    return (NSUInteger)from + arc4random() % (to - from + 1);
}

+ (NSString *)getNewUID {
    NSUUID  *UUID = [NSUUID UUID];
    NSString* stringUUID = [UUID UUIDString];
    stringUUID = [stringUUID substringToIndex:7];
    return stringUUID;
}

@end
