//
//  Hop.m
//  HomeBrewTimer
//
//  Created by Russ Davis on 11/11/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import "Hop.h"

@implementation Hop

@synthesize name = _name;
@synthesize weight = _weight;
@synthesize addTime = _addTime;

-(id)initWithName:(NSString *)name weight:(NSString *)weight addTime:(NSNumber *)addTime {
    if ((self = [super init])) {
        self.name = name;
        self.weight = weight;
        self.addTime = addTime;
    }
    return self;
}

@end
