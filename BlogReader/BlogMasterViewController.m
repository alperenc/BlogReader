//
//  BlogMasterViewController.m
//  BlogReader
//
//  Created by Alp Eren Can on 22/06/15.
//  Copyright (c) 2015 Alp Eren Can. All rights reserved.
//

#import "BlogMasterViewController.h"
#import "BlogDetailViewController.h"

@implementation BlogMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.blogPosts = [dataDictionary objectForKey:@"posts"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showBlog"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *title = [self.blogPosts[indexPath.row] objectForKey:@"title"];
        [[segue destinationViewController] setDetailItem:title];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.textLabel.text = [self.blogPosts[indexPath.row] objectForKey:@"title"];
    cell.detailTextLabel.text = [self.blogPosts[indexPath.row] objectForKey:@"author"];
    
    return cell;
}

@end
