//
//  FileTableViewController.h
//  UranTestTask
//
//  Created by Roman Rybachenko on 12/28/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FileModel;

@interface FileTableViewController : UITableViewController

@property (nonatomic, strong) FileModel *currentFolder;

@end
