//
//  FileTableViewCell.h
//  UranTestTask
//
//  Created by Roman Rybachenko on 12/28/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
@class FileModel;

@interface FileTableViewCell : SWTableViewCell

@property (nonatomic, strong) FileModel *file;

+ (NSString *)cellIdentifier;

@end
