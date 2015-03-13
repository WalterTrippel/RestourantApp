//
//  Restaurant.h
//  Test
//
//  Created by User on 13/03/2015.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property(nonatomic, strong) NSString * code;
@property(nonatomic, strong) NSString * name;

-(id)initWithCode:(NSString *)code_ name: (NSString *)name_;

@end
