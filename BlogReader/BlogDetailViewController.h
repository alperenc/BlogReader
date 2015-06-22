//
//  BlogDetailViewController.h
//  BlogReader
//
//  Created by Alp Eren Can on 22/06/15.
//  Copyright (c) 2015 Alp Eren Can. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

