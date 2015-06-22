//
//  BlogMasterViewController.m
//  BlogReader
//
//  Created by Alp Eren Can on 22/06/15.
//  Copyright (c) 2015 Alp Eren Can. All rights reserved.
//

#import "BlogMasterViewController.h"
#import "BlogDetailViewController.h"
#import "BlogPost.h"

@implementation BlogMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    
    for (NSDictionary *blogPostDictionary in blogPostsArray) {
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[blogPostDictionary objectForKey:@"title"]];
        blogPost.author = [blogPostDictionary objectForKey:@"author"];
        [self.blogPosts addObject:blogPost];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showBlog"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        NSString *title = blogPost.title;
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
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];

    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = blogPost.author;
    
    return cell;
}

@end
