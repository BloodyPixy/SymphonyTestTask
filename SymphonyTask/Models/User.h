//
//  User.h
//  SymphonyTask
//
//  Created by Taras Pasichnyk on 3/3/16.
//  Copyright © 2016 Taras Pasichnyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface User : NSObject{
    NSMutableDictionary *data;
}

@property (nonatomic, copy) NSString *addressCity;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *suite;
@property (nonatomic, copy) NSString *zipcode;
@property (nonatomic, copy) NSString *companyBs;
@property (nonatomic, copy) NSString *companyCatchPhrase;
@property (nonatomic, copy) NSString *companyName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSNumber *userId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *website;
@property (nonatomic, copy) NSArray<Post *> *posts;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
