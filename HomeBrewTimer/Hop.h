//
//  Hop.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 11/11/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hop : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *weight;
@property (nonatomic, strong) NSNumber *addTime;

-(id)initWithName:(NSString *)name weight:(NSString *)weight addTime:(NSNumber *)addTime;

@end
