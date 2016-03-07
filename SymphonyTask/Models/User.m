//
//  User.m
//  SymphonyTask
//
//  Created by Taras Pasichnyk on 3/3/16.
//  Copyright © 2016 Taras Pasichnyk. All rights reserved.
//

#import "User.h"

@implementation User

@dynamic addressCity, street, suite, zipcode, companyBs, companyCatchPhrase, companyName, email, userId, name, phone, userName, website;

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self == nil) return nil;
    
    data = [[NSMutableDictionary alloc] init];
    [data setObject:[dictionary[@"address"][@"city"] copy] forKey:@"addressCity"];
    [data setObject:[dictionary[@"address"][@"street"] copy] forKey:@"street"];
    [data setObject:[dictionary[@"address"][@"suite"] copy] forKey:@"suite"];
    [data setObject:[dictionary[@"address"][@"zipcode"] copy] forKey:@"zipcode"];
    [data setObject:[dictionary[@"company"][@"bs"] copy] forKey:@"companyBs"];
    [data setObject:[dictionary[@"company"][@"catchPhrase"] copy] forKey:@"companyCatchPhrase"];
    [data setObject:[dictionary[@"company"][@"name"] copy] forKey:@"companyName"];
    [data setObject:[dictionary[@"email"] copy] forKey:@"email"];
    [data setObject:[dictionary[@"id"] copy] forKey:@"userId"];
    [data setObject:[dictionary[@"name"] copy] forKey:@"name"];
    [data setObject:[dictionary[@"phone"] copy] forKey:@"phone"];
    [data setObject:[dictionary[@"username"] copy] forKey:@"userName"];
    [data setObject:[dictionary[@"website"] copy] forKey:@"website"];
    
    return self;
}

//generate a signature for a selector and invokates proper method
//handles both setters and getters

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSString *sel = NSStringFromSelector(selector);
    if ([sel rangeOfString:@"set"].location == 0) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    } else {
        return [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSString *key = NSStringFromSelector([invocation selector]);
    if ([key rangeOfString:@"set"].location == 0) {
        key = [[key substringWithRange:NSMakeRange(3, [key length]-4)] lowercaseString];
        NSString *obj;
        [invocation getArgument:&obj atIndex:2];
        [data setObject:obj forKey:key];
    } else {
        NSString *obj = [data objectForKey:key];
        [invocation setReturnValue:&obj];
    }
}


@end
