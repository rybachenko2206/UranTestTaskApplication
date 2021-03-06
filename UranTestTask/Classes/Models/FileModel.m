//
//  FileModel.m
//  UranTestTask
//
//  Created by Roman Rybachenko on 12/28/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//




#import "Utils.h"

#import "FileModel.h"

static NSInteger const minElementsInFolder = 10;
static NSInteger const maxElementsInFolder = 20;

static NSUInteger callTestModelsListCounter = 0;
static NSUInteger callTestModelsListCounterMax = 10;

@implementation FileModel

#pragma mark - Initialization methods

- (instancetype)initWithType:(FileType)fileType indicatorColor:(IndicatorColor)colorType {
    self = [super init];
    if (self) {
        self.type = fileType;
        self.indicatorColorType = colorType;
        self.modDate = [NSDate date];
    }
    return self;
}


#pragma mark - Interface methods

- (UIColor *)colorForIndicatorType {
    UIColor *indColor = nil;
    switch (self.indicatorColorType) {
        case IndicatorColorNone:
            indColor = [UIColor clearColor];
            break;
        case IndicatorColorRed:
            indColor = RGB(255, 102, 95);
            break;
        case IndicatorColorOrange:
            indColor = RGB(248, 169, 59);
            break;
        case IndicatorColorYellow:
            indColor = RGB(244, 206, 59);
            break;
        case IndicatorColorGreen:
            indColor = RGB(113, 204, 82);
            break;
        case IndicatorColorBlue:
            indColor = RGB(77, 185, 244);
            break;
            
        default:
            break;
    }
    
    return indColor;
}

- (UIImage *)iconForFileType {
    NSString *iconName = @"";
    switch (self.type) {
        case FileTypeFolder:
            iconName = @"folder";
            break;
        case FileTypeTxt:
            iconName = @"txtFile";
            break;
        case FileTypePDF:
            iconName = @"pdfFile";
            break;
        case FileTypeImage:
            iconName = @"imageFile";
            break;
        case FileTypeAudio:
            iconName = @"audioFile";
            break;
        case FileTypeVideo:
            iconName = @"videoFile";
            break;
            
        default:
            break;
    }
    
    UIImage *icon = [UIImage imageNamed:iconName];
    return icon;
}


#pragma mark - Static methods

+ (NSArray *)testModelsList {
    callTestModelsListCounter++;
    NSArray *models = [NSArray array];
    
    NSInteger count = [Utils getRandomNumberBetween:minElementsInFolder to:maxElementsInFolder];
    for (NSInteger i = 0; i < count; i++) {
        FileType newType = [Utils getRandomNumberBetween:FileTypeFolder to:FileTypeVideo];
        if (newType == FileTypeFolder &&
            callTestModelsListCounter >= callTestModelsListCounterMax) {
            newType = FileTypeTxt;
        }
        IndicatorColor newColor = [Utils getRandomNumberBetween:IndicatorColorNone to:IndicatorColorBlue];
        FileModel *newModel = [[FileModel alloc] initWithType:newType indicatorColor:newColor];
        newModel.name = [FileModel generateFileNameForType:newType];
        if (newType == FileTypeFolder) {
            newModel.files = [FileModel testModelsList];
        }
        models = [models arrayByAddingObject:newModel];
    }
    
    return models;
}

+ (NSString *)generateFileNameForType:(FileType)fileType {
    NSString *fileName = nil;
    NSString *unicString = [Utils getNewUID];
    switch (fileType) {
        case FileTypeFolder:
            fileName = @"Folder %@";
            break;
        case FileTypeTxt:
            fileName = @"Text File %@.txt";
            break;
        case FileTypePDF:
            fileName = @"Pdf File %@.pdf";
            break;
        case FileTypeImage:
            fileName = @"Image %@.png";
            break;
        case FileTypeAudio:
            fileName = @"AudioTrack %@.mp3";
            break;
        case FileTypeVideo:
            fileName = @"Video %@.avi";
            break;
            
        default:
            break;
    }
    fileName = [NSString stringWithFormat:fileName, unicString];
    
    return fileName;
}


@end
