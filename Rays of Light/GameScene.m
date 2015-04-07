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
    
    // Drawing of a label with coordinates of current user touch
    self.touchPoint = CGPointMake(0, 0);
    self.touchPointLabel = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    self.touchPointLabel.fontSize = 15;
    self.touchPointLabel.fontColor = [UIColor blackColor];
    self.touchPointLabel.position = CGPointMake(size.width - 100, size.height - 30);
    self.touchPointLabel.zPosition = 100;
    [self addChild:self.touchPointLabel];
    
    SKAction *tempAction = [SKAction runBlock:^{
        self.touchPointLabel.text =[NSString stringWithFormat:@"%.2f : %.2f",self.touchPoint.x, self.touchPoint.y];
    }];
    
    SKAction *waitAction = [SKAction waitForDuration:0.1];
    [self.touchPointLabel runAction:
     [SKAction repeatActionForever:
      [SKAction sequence:@[tempAction, waitAction]]]];
    
    // Lets draw some shapes:
    CGRect box = CGRectMake(size.width / 2, size.height / 2, 80.0, 80.0);
    SKShapeNode *shapeNode = [[SKShapeNode alloc] init];
    shapeNode.path = [UIBezierPath bezierPathWithRect:box].CGPath;
    shapeNode.fillColor = SKColor.whiteColor;
    shapeNode.strokeColor = SKColor.blackColor;
    shapeNode.zPosition = 10;
    [self addChild:shapeNode];

    return self;
}

- (void)didMoveToView:(SKView *)view {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        self.touchPoint = location;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        self.touchPoint = location;
    }
}

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
