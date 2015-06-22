//
//  BlogPost.h
//  
//
//  Created by Alp Eren Can on 22/06/15.
//
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *thumbnail;
@property (strong, nonatomic) NSString *date;

// Designated initializer
- (instancetype)initWithTitle:(NSString *)title;

// Convenience constructor
+ (instancetype)blogPostWithTitle:(NSString *)title;


- (NSURL *)thumbnailURL;
- (NSString *)formattedDate;

@end
