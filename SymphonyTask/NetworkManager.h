//
//  NetworkManager.h
//  SymphonyTask
//
//  Created by Taras Pasichnyk on 3/3/16.
//  Copyright © 2016 Taras Pasichnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kPostMethod,
    kGetMethod,
    kDeleteMethod
} HTTPMethod;

typedef enum {
    kHttp,
    kHttps
} InternetProtocol;

@interface NetworkManager : NSObject

+ (id)sharedManager;

- (void)getUsersWithCompletion:(void(^)(NSArray *usersArray))completion;
- (void)getPostsWithCompletion:(void(^)(NSArray *postsArray))completion;

@end
