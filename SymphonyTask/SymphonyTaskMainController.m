//
//  ViewController.m
//  SymphonyTask
//
//  Created by Taras Pasichnyk on 3/3/16.
//  Copyright © 2016 Taras Pasichnyk. All rights reserved.
//

#import "SymphonyTaskMainController.h"
#import "NetworkManager.h"
#import "User.h"

@interface SymphonyTaskMainController ()

@end

@implementation SymphonyTaskMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block User *user;
    [[NetworkManager sharedManager] getUsersWithCompletion:^(NSArray *usersArray) {
        user = (User *)[usersArray objectAtIndex:0];
        NSLog(@"User name is %@.", user.name);
        user.name = @"Taras Pasichnyk";
        NSLog(@"User name is %@.", user.name);
    }];
}

@end
