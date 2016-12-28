//
//  Utils.h
//  UranTestTask
//
//  Created by Roman Rybachenko on 12/28/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (NSUInteger)getRandomNumberBetween:(NSUInteger)from to:(NSUInteger)to;
+ (NSString *)getNewUID;

@end
