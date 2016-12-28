//
//  MDMacros.h
//
//  Copyright (c) 2013 Mozi Development. All rights reserved.
//

#ifndef MDMacros_h
#define MDMacros_h

#define ITEM_NOT_FOUND -1

#define RGB(r, g, b) RGBA(r, g, b, 1.0f)
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define DEFAULT


#define ENABLE_API_LOGS ( (getenv("ENABLE_API_LOGS")!=NULL) && [@(getenv("ENABLE_API_LOGS")) isEqualToString:@"YES"])

/*
 *  System Versioning Preprocessor Macros
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#endif
