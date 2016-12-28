//
//  SharedDateFormatter.m
//
//  Created by Roman Rybachenko on 5/27/14.
//

#import "SharedDateFormatter.h"

@implementation SharedDateFormatter

#pragma mark Static methods

+ (NSDateFormatter *)sharedInstance {
    static NSDateFormatter *staticDateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticDateFormatter = [NSDateFormatter new];
        staticDateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
        staticDateFormatter.timeZone = [NSTimeZone localTimeZone];
    });
    
    return staticDateFormatter;
}


#pragma mark Instance initialization

+ (NSDate *)dateFromString:(NSString*)string withFormat:(NSString*)format {
    [[SharedDateFormatter sharedInstance] setDateFormat:format];
    NSDate *date = [[SharedDateFormatter sharedInstance] dateFromString:string];
    return date;
}

+ (NSString *)getStringFromDate:(NSDate*)date withFormat:(NSString*)dateFormat {
    [[SharedDateFormatter sharedInstance] setDateFormat:dateFormat];
    return [[SharedDateFormatter sharedInstance] stringFromDate:date];
}


@end
