//
//  GameScene.m
//  Rays of Light
//
//  Created by Denys Khlivnyy on 4/7/15.
//  Copyright (c) 2015 Denys Khlivnyy. All rights reserved.
//

#import "GameScene.h"
#import "Background.h"

@implementation GameScene

- (id)initWithSize:(CGSize)size{
    
    if (self = [super initWithSize:size]) {
        self.currentBackground = [Background generateNewBackground:size];
        [self addChild:self.currentBackground];
    }
    
    self.touchCoordinates = CGPointMake(0, 0);
    
    self.coordinatesLabel = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    self.coordinatesLabel.fontSize = 15;
    self.coordinatesLabel.fontColor = [UIColor blackColor];
    self.coordinatesLabel.position = CGPointMake(size.width - 100, size.height - 30);
    self.coordinatesLabel.zPosition = 100;
    [self addChild:self.coordinatesLabel];
    
    SKAction *tempAction = [SKAction runBlock:^{
        self.coordinatesLabel.text = [NSString stringWithFormat:@"%.2f : %.2f", self.touchCoordinates.x, self.touchCoordinates.y];
    }];
    
    SKAction *waitAction = [SKAction waitForDuration:0.1];
    [self.coordinatesLabel runAction:
     [SKAction repeatActionForever:
      [SKAction sequence:@[tempAction, waitAction]]]];

    return self;
}

- (void)didMoveToView:(SKView *)view {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        self.touchCoordinates = location;
        
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        self.touchCoordinates = location;
    }
    
}


- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
