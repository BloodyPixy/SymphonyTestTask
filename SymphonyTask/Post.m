//
//  Post.m
//  SymphonyTask
//
//  Created by Taras Pasichnyk on 3/3/16.
//  Copyright © 2016 Taras Pasichnyk. All rights reserved.
//

#import "Post.h"

@implementation Post

@dynamic body, postId, title, userId;

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self == nil) return nil;
    
    data = [[NSMutableDictionary alloc] init];
    [data setObject:[dictionary[@"body"] copy] forKey:@"body"];
    [data setObject:[dictionary[@"id"] copy] forKey:@"postId"];
    [data setObject:[dictionary[@"title"] copy] forKey:@"title"];
    [data setObject:[dictionary[@"userId"] copy] forKey:@"userId"];
    
    _userIdActual = [dictionary[@"userId"] copy];
    
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
