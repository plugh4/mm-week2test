//
//  NationalPark.m
//  mm-week2test
//
//  Created by Christopher Serra on 3/25/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "NationalPark.h"

@implementation NationalPark

-(instancetype)initWithName:(NSString *)n location:(NSString *)l image:(NSString *)i
{
    self = [super init];
    if (self) {
        self.name = n;
        self.location = l;
        self.imageName = i;
    }
    return self;
}

@end
