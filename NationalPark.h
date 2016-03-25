//
//  NationalPark.h
//  mm-week2test
//
//  Created by Christopher Serra on 3/25/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NationalPark : NSObject
@property NSString *name;
@property NSString *location;
@property NSString *imageName;
-(instancetype)initWithName:(NSString *)n location:(NSString *)l image:(NSString *)i;
@end
