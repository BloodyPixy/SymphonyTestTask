//
//  Post.h
//  SymphonyTask
//
//  Created by Taras Pasichnyk on 3/3/16.
//  Copyright © 2016 Taras Pasichnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject{
    NSMutableDictionary *data;
}

@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSNumber *postId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *userId;

//property, to determine whether the post belongs to a user
@property (nonatomic, copy) NSNumber *userIdActual;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
