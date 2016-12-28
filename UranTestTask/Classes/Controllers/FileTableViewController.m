//
//  FileTableViewController.m
//  UranTestTask
//
//  Created by Roman Rybachenko on 12/28/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import "FileModel.h"
#import "FileTableViewController.h"

@interface FileTableViewController ()

@property (nonatomic, strong) NSArray *fileModels;

@end

@implementation FileTableViewController


#pragma mark - Overriden methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.currentFolder ? self.currentFolder.name : @"First screen";
    self.fileModels = self.currentFolder ? self.currentFolder.files : [FileModel testModelsList];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



#pragma mark - Delegate methods:
#pragma mark —UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fileModels.count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


#pragma mark - Static methods

+ (NSString *)storyboardIdentifier {
    return NSStringFromClass(self);
}


@end
