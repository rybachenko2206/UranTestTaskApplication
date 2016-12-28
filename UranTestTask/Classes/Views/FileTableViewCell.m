//
//  FileTableViewCell.m
//  UranTestTask
//
//  Created by Roman Rybachenko on 12/28/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import "FileModel.h"
#import "SharedDateFormatter.h"

#import "FileTableViewCell.h"


@interface FileTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *defaultIndicatorView;
@property (weak, nonatomic) IBOutlet UIView *indicatorView;
@property (weak, nonatomic) IBOutlet UIView *folderIndicatorView;
@property (weak, nonatomic) IBOutlet UIImageView *fileTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *fileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *updatedAtLabel;

@end


@implementation FileTableViewCell


#pragma mark - Static methods

+ (NSString *)cellIdentifier {
    return NSStringFromClass(self);
}


#pragma mark - Setters 

- (void)setFile:(FileModel *)file {
    _file = file;
    
    self.fileNameLabel.text = _file.name;
    [self setIndicatorColorType];
    [self setFileType];
    NSString *dateStr = [SharedDateFormatter getStringFromDate:_file.modDate
                                                    withFormat:DATE_FORMAT_SHORT];
    self.updatedAtLabel.text = [NSString stringWithFormat:@"modified at %@", dateStr];
}


#pragma mark - Private methods

- (void)setIndicatorColorType {
    self.defaultIndicatorView.hidden = _file.indicatorColorType != IndicatorColorNone;
    self.indicatorView.backgroundColor = [_file colorForIndicatorType];
}

- (void)setFileType {
    self.fileTypeImageView.image = [_file iconForFileType];
    self.folderIndicatorView.hidden = _file.type == FileTypeFolder ? NO : YES;
}

@end
