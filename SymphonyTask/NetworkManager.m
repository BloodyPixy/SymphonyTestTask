//
//  NetworkManager.m
//  SymphonyTask
//
//  Created by Taras Pasichnyk on 3/3/16.
//  Copyright © 2016 Taras Pasichnyk. All rights reserved.
//

#import "NetworkManager.h"
#import "User.h"
#import "Post.h"

static NSString* const kBaseUrl = @"jsonplaceholder.typicode.com";
static NSString* const kUsersPath = @"/users";
static NSString* const kPostsPath = @"/posts";

@interface NetworkManager ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation NetworkManager

#pragma mark - Instancetypes

// I have created a singletone for networking using NSURLSession
+ (id)sharedManager
{
    static NetworkManager *_sharedInstance;
    if (!_sharedInstance) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            _sharedInstance = [[super alloc] initPrivate];
        });
    }
    
    return _sharedInstance;
}

- (id)initPrivate
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.HTTPAdditionalHeaders = @{@"Content-Type" : @"application/json"};
        
        _session = [NSURLSession sessionWithConfiguration:config];
    }
    return self;
}

#pragma mark - Create URL Request
- (void)createURLRequestWithURLString:(NSString *)pathUrl
                           HTTPMethod:(HTTPMethod)httpMethod
                             protocol:(InternetProtocol)protocol
                           parameters:(NSDictionary *)parameters
                           completion:(void(^)(NSDictionary* jsonData))completion {
    
    NSURL *baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", [self stringInternetProtocolWith:protocol], kBaseUrl, pathUrl]];
    NSLog(@"Address: %@", baseURL);
    NSError *error;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];
    [request setHTTPMethod:[self stringHTTPMethodWith:httpMethod]];
    
    if (parameters) {
        [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error]];
    }
    
    NSURLSessionDataTask *dataTask =
    [self.session dataTaskWithRequest:request
                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                   options:NSJSONReadingAllowFragments
                                                                                     error:&error];
                        if(error) {
                            NSLog(@"[NetworkManager createURLRequestWithURLString] %@", error);
                        } else {
                            completion(jsonObject);
                        }
                    }];
    
    [dataTask resume];
}

#pragma mark - Helpers

- (NSString *)stringHTTPMethodWith:(HTTPMethod)method{
    switch (method) {
        case kGetMethod:
            return @"GET";
            break;
        case kPostMethod:
            return @"POST";
            break;
        case kDeleteMethod:
            return @"DELETE";
            break;
        default:
            return @"error";
            break;
    }
}

- (NSString *)stringInternetProtocolWith:(InternetProtocol)protocol{
    switch (protocol) {
        case kHttp:
            return @"http://";
            break;
        case kHttps:
            return @"https://";
            break;
        default:
            return @"error";
            break;
    }
}

#pragma mark - URL Requests

- (void)getPostsWithCompletion:(void(^)(NSArray *postsArray))completion
{
    NSString *pathUrl = kPostsPath;
    
    [self createURLRequestWithURLString:pathUrl
                             HTTPMethod:kGetMethod
                               protocol:kHttp
                             parameters:nil
                             completion:^(NSDictionary* jsonData)
     {
         NSDictionary *postsJson = [jsonData mutableCopy];
         NSMutableArray *postsArray = [[NSMutableArray alloc] init];
         
         for(NSDictionary *singlePost in postsJson)
         {
             Post *post = [[Post alloc] initWithDictionary:singlePost];
             [postsArray addObject:post];
         }
         
         completion([NSArray arrayWithArray:postsArray]);
     }];
}

- (void)getUsersWithCompletion:(void(^)(NSArray *usersArray))completion
{
    NSString *pathUrl = kUsersPath;
    
    [self createURLRequestWithURLString:pathUrl
                             HTTPMethod:kGetMethod
                               protocol:kHttp
                             parameters:nil
                             completion:^(NSDictionary* jsonData)
     {
         NSDictionary *usersJson = [jsonData mutableCopy];
         NSMutableArray *usersArray = [[NSMutableArray alloc] init];
         
         //here we are getting json and creating our Users
         for(NSDictionary *singleUser in usersJson)
         {
             User *user = [[User alloc] initWithDictionary:singleUser];
             [usersArray addObject:user];
         }
         
         __block NSArray *posts;
         
         [self getPostsWithCompletion:^(NSArray *postsArray) {
             posts = (NSArray<Post *> *)[NSArray arrayWithArray:postsArray];
             // here we get posts and using predicate, filter them to assign to each user
             for(User *user in usersArray) {
                 user.posts = [posts filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.userIdActual == %@", user.userId]];
             }
             
             //after we have all users and their posts, we call completion
             completion(usersArray);
         }];
     }];
}

@end
