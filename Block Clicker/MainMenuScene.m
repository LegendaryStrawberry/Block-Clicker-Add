//
//  MainMenuScene.m
//  Block Clicker
//
//  Created by Travis McMahon on 3/26/15.
//  Copyright (c) 2015 Travis McMahon. All rights reserved.
//

#import "MainMenuScene.h"

@interface MainMenuScene()
@property SKSpriteNode *background;
@end

@implementation MainMenuScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    // Background
    self.background = [SKSpriteNode spriteNodeWithImageNamed:@"colored_grass"];
    self.background.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    SKLabelNode *play = [SKLabelNode labelNodeWithFontNamed:@"Avenir-BlackOblique"];
    play.text = @"Click To Play!";
    play.fontSize = 50;
    play.fontColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    play.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 50);
    
    // Add everything
    [self addChild:self.background];
    [self addChild:play];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    GameScene *game = [[GameScene alloc] initWithSize:self.size];
    [self.view presentScene:game transition:[SKTransition pushWithDirection:SKTransitionDirectionUp duration:1]];
}

@end
