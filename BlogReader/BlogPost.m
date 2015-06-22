//
//  BlogPost.m
//  
//
//  Created by Alp Eren Can on 22/06/15.
//
//

#import "BlogPost.h"

@implementation BlogPost

// Designated initializer
- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    
    return self;
}

// Convenience constructor
+ (instancetype)blogPostWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title];
}

@end
