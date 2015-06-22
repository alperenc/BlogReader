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
        self.author = nil;
        self.thumbnail = nil;
    }
    
    return self;
}

// Convenience constructor
+ (instancetype)blogPostWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title];
}

- (NSURL *)thumbnailURL {
    if ([self.thumbnail isKindOfClass:[NSString class]]) {
        return [NSURL URLWithString:self.thumbnail];
    } else {
        return [NSURL URLWithString:@"http://treehouse-code-samples.s3.amazonaws.com/logo.png"];
    }
    
}

@end
