//
//  Restaurant.m
//  Test
//
//  Created by User on 13/03/2015.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant


-(id)initWithCode:(NSString *)code_ name:(NSString *)name_
{
    self = [super init];
    if(self)
    {
        self.code = code_;
        self.name = name_;
    }
    return self;
}

@end
