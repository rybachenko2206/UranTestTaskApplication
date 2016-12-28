//
//  FileModel.h
//  UranTestTask
//
//  Created by Roman Rybachenko on 12/28/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//



typedef NS_ENUM(NSUInteger, IndicatorColor) {
    IndicatorColorGray = 0,
    IndicatorColorRed,
    IndicatorColorOrange,
    IndicatorColorYellow,
    IndicatorColorGreen,
    IndicatorColorBlue,
};

typedef NS_ENUM(NSUInteger, FileType) {
    FileTypeFolder = 0,
    FileTypeTxt,
    FileTypePDF,
    FileTypeImage,
    FileTypeAudio,
    FileTypeVideo
};

@interface FileModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *modDate;
@property (nonatomic, assign) IndicatorColor indicatorColorType;
@property (nonatomic, assign) FileType type;
@property (nonatomic, strong) NSArray *files;

+ (NSArray *)testModelsList;

@end
