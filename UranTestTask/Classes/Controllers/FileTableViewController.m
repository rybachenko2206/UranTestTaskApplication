//
//  FileTableViewController.m
//  UranTestTask
//
//  Created by Roman Rybachenko on 12/28/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//


#import "FileModel.h"
#import "FileTableViewCell.h"

#import "FileTableViewController.h"



typedef NS_ENUM(NSUInteger, UtilityButton) {
    UtilityButtonRate = 0,
    UtilityButtonInfinity,
    UtilityButtonDelete
};


static NSUInteger const cellUtilityButtonsWidth = 45;

@interface FileTableViewController () <SWTableViewCellDelegate>
@property (nonatomic, strong) NSArray *fileModels;
@end


@implementation FileTableViewController


#pragma mark - Overriden methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.currentFolder ? self.currentFolder.name : @"First screen";
    self.fileModels = self.currentFolder ? self.currentFolder.files : [FileModel testModelsList];
}



#pragma mark - Delegate methods:
#pragma mark —UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fileModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [FileTableViewCell cellIdentifier];
    FileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                              forIndexPath:indexPath];
    cell.file = self.fileModels[indexPath.row];
    cell.delegate = self;
    [cell setRightUtilityButtons:[self rightCellUtilityButtons]
                 WithButtonWidth:cellUtilityButtonsWidth];
    
    return cell;
}

#pragma mark —UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FileModel *selectedFile = self.fileModels[indexPath.row];
    if (selectedFile.type == FileTypeFolder) {
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        FileTableViewController *fileController = [main instantiateViewControllerWithIdentifier:[FileTableViewController storyboardIdentifier]];
        fileController.currentFolder = selectedFile;
        [self.navigationController pushViewController:fileController animated:YES];
    }
}

#pragma mark —SWTableViewCellDelegate

- (void)swipeableTableViewCell:(FileTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    NSString *logStr = nil;
    switch (index) {
        case UtilityButtonRate:
            logStr = [NSString stringWithFormat:@"rate button was tapped in %@", cell.file.name];
            break;
        case UtilityButtonInfinity:
            logStr = [NSString stringWithFormat:@"infinity button was tapped in %@", cell.file.name];
            break;
        case UtilityButtonDelete:
            logStr = [NSString stringWithFormat:@"delete button was tapped in %@", cell.file.name];
            break;
    }
    
    $ns(logStr);
}


#pragma mark - Private methods

- (NSArray *)rightCellUtilityButtons {
    NSMutableArray *buttons = [NSMutableArray new];
    UIColor *buttonBgColor = RGB(245, 245, 245);
    [buttons sw_addUtilityButtonWithColor:buttonBgColor icon:[UIImage imageNamed:@"star"]];
    [buttons sw_addUtilityButtonWithColor:[UIColor whiteColor] icon:[UIImage imageNamed:@"infinity"]];
    [buttons sw_addUtilityButtonWithColor:buttonBgColor icon:[UIImage imageNamed:@"delete"]];
    return buttons;
}

#pragma mark - Static methods

+ (NSString *)storyboardIdentifier {
    return NSStringFromClass(self);
}


@end
