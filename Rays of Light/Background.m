//
//  Background.m
//  Rays of Light
//
//  Created by Denys Khlivnyy on 4/8/15.
//  Copyright (c) 2015 Denys Khlivnyy. All rights reserved.
//

#import "Background.h"

@implementation Background

+ (Background *)generateNewBackground:(CGSize)screenSize
{
    UIColor *backgroundColor = [UIColor whiteColor];
    Background *background = [[Background alloc] initWithColor:backgroundColor size:screenSize];
    background.anchorPoint = CGPointMake(0, 0);
    background.position = CGPointMake(0, 0);
    background.zPosition = 5;
    
    return background;
}


@end
