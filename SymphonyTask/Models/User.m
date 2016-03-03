//
//  User.m
//  SymphonyTask
//
//  Created by Taras Pasichnyk on 3/3/16.
//  Copyright © 2016 Taras Pasichnyk. All rights reserved.
//

#import "User.h"

@implementation User

/*
 
At first I have created a simple data models for both objects. But then I thought that we do not need this, som the code is commented. 
 In order to use @dynamic, had to rewrite some parts.
 
 */

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
    
//    _addressCity = [dictionary[@"address"][@"city"] copy];
//    _street = [dictionary[@"address"][@"street"] copy];
//    _suite = [dictionary[@"address"][@"suite"] copy];
//    _zipcode = [dictionary[@"address"][@"zipcode"] copy];
//    _companyBs = [dictionary[@"company"][@"bs"] copy];
//    _companyCatchPhrase = [dictionary[@"company"][@"catchPhrase"] copy];
//    _companyName = [dictionary[@"company"][@"name"] copy];
//    _email = [dictionary[@"email"] copy];
//    _userId = [dictionary[@"id"] copy];
//    _name = [dictionary[@"name"] copy];
//    _phone = [dictionary[@"phone"] copy];
//    _userName = [dictionary[@"username"] copy];
//    _website = [dictionary[@"website"] copy];
    
    return self;
}

//- (id)initWithCoder:(NSCoder *)coder {
//    self = [self init];
//    if (self == nil) return nil;
//    
//    _addressCity = [coder decodeObjectForKey:@"addressCity"];
//    _street = [coder decodeObjectForKey:@"street"];
//    _suite = [coder decodeObjectForKey:@"suite"];
//    _zipcode = [coder decodeObjectForKey:@"zipcode"];
//    _companyBs = [coder decodeObjectForKey:@"companyBs"];
//    _companyCatchPhrase = [coder decodeObjectForKey:@"companyCatchPhrase"];
//    _companyName = [coder decodeObjectForKey:@"companyName"];
//    _email = [coder decodeObjectForKey:@"email"];
//    _userId = [coder decodeObjectForKey:@"userId"];
//    _name = [coder decodeObjectForKey:@"name"];
//    _phone = [coder decodeObjectForKey:@"phone"];
//    _userName = [coder decodeObjectForKey:@"userName"];
//    _website = [coder decodeObjectForKey:@"website"];
//    
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)coder {
//    if (self.addressCity != nil) [coder encodeObject:self.addressCity forKey:@"addressCity"];
//    if (self.street != nil) [coder encodeObject:self.street forKey:@"street"];
//    if (self.suite != nil) [coder encodeObject:self.suite forKey:@"suite"];
//    if (self.zipcode != nil) [coder encodeObject:self.zipcode forKey:@"zipcode"];
//    if (self.companyBs != nil) [coder encodeObject:self.companyBs forKey:@"companyBs"];
//    if (self.companyCatchPhrase != nil) [coder encodeObject:self.companyCatchPhrase forKey:@"companyCatchPhrase"];
//    if (self.companyName != nil) [coder encodeObject:self.companyName forKey:@"companyName"];
//    if (self.email != nil) [coder encodeObject:self.email forKey:@"email"];
//    if (self.userId != nil) [coder encodeObject:self.userId forKey:@"userId"];
//    if (self.name != nil) [coder encodeObject:self.name forKey:@"name"];
//    if (self.phone != nil) [coder encodeObject:self.phone forKey:@"phone"];
//    if (self.userName != nil) [coder encodeObject:self.userName forKey:@"userName"];
//    if (self.website != nil) [coder encodeObject:self.website forKey:@"website"];
//}
//
//- (id)copyWithZone:(NSZone *)zone {
//    User *newUser = [[self class] allocWithZone:zone];
//    
//    newUser->_addressCity = [_addressCity copyWithZone:zone];
//    newUser->_street = [_street copyWithZone:zone];
//    newUser->_suite = [_suite copyWithZone:zone];
//    newUser->_zipcode = [_zipcode copyWithZone:zone];
//    newUser->_companyBs = [_companyBs copyWithZone:zone];
//    newUser->_companyCatchPhrase = [_companyCatchPhrase copyWithZone:zone];
//    newUser->_companyName = [_companyName copyWithZone:zone];
//    newUser->_email = [_email copyWithZone:zone];
//    newUser->_userId = [_userId copyWithZone:zone];
//    newUser->_name = [_userName copyWithZone:zone];
//    newUser->_phone = [_phone copyWithZone:zone];
//    newUser->_userName = [_userName copyWithZone:zone];
//    newUser->_website = [_website copyWithZone:zone];
//    
//    return newUser;
//}
//
//
//- (BOOL)isEqual:(User *)user {
//    if (![user isKindOfClass:[User class]]) return NO;
//    
//    return [self.addressCity isEqual:user.addressCity]
//    && [self.street isEqual:user.street]
//    && [self.suite isEqual:user.suite]
//    && [self.zipcode isEqual:user.zipcode]
//    && [self.companyBs isEqual:user.companyBs]
//    && [self.companyCatchPhrase isEqual:user.companyCatchPhrase]
//    && [self.companyName isEqual:user.companyName]
//    && [self.email isEqual:user.email]
//    && [self.userId isEqual:user.userId]
//    && [self.name isEqual:user.name]
//    && [self.phone isEqual:user.phone]
//    && [self.userName isEqual:user.userName]
//    && [self.website isEqual:user.website];
//}

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
