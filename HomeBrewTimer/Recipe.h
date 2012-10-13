//
//  Recipe.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/12/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) int boilLength;

@end
