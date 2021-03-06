//
//  GameScene.h
//  Rays of Light
//

//  Copyright (c) 2015 Denys Khlivnyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@class Background;

@interface GameScene : SKScene

@property (strong, nonatomic)Background *currentBackground;
@property (assign) CGPoint touchPoint;
@property (strong, nonatomic) SKLabelNode *touchPointLabel;
@property (strong, nonatomic) SKShapeNode *touchPointNode;
@property (strong, nonatomic) SKShapeNode *rayNode;

@end
