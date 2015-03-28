//
//  ShopScene.m
//  Block Clicker
//
//  Created by Luke Copeland on 3/28/15.
//  Copyright (c) 2015 Travis McMahon. All rights reserved.
//

#import "ShopScene.h"


@interface ShopScene()
@property SKSpriteNode *background;
@property SKLabelNode *backButton;

@property SKLabelNode *gold;
@property int currentGold;

@end

@implementation ShopScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    // Background
    self.background = [SKSpriteNode spriteNodeWithImageNamed:@"colored_grass"];
    self.background.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    //Simple Labels
    SKLabelNode *play = [SKLabelNode labelNodeWithFontNamed:@"Avenir-BlackOblique"];
    play.text = @"Shop";
    play.fontSize = 50;
    play.fontColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    play.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 290);
    
    self.currentGold = [GameDataHelper sharedGameData].gold;
    self.gold = [SKLabelNode labelNodeWithFontNamed:@"Avenir-BlackOblique"];
    self.gold.text = [NSString stringWithFormat:@"Gold %d", self.currentGold];
    self.gold.fontColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    self.gold.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 255);
    
    //Back button
    self.backButton = [SKLabelNode labelNodeWithFontNamed:@"Avenir-BlackOblique"];
    self.backButton.text = @"Back";
    self.backButton.fontSize = 40;
    self.backButton.fontColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    self.backButton.position = CGPointMake(50, 10);
    
    // Add everything
    [self addChild:self.background];
    [self addChild:self.backButton];
    [self addChild:self.gold];
    [self addChild:play];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if ([self.backButton containsPoint:location]) {
            [GameDataHelper sharedGameData].gold = self.currentGold;
            [[GameDataHelper sharedGameData]save];
            GameScene *game = [[GameScene alloc] initWithSize:self.size];
            [self.view presentScene:game transition:[SKTransition pushWithDirection:SKTransitionDirectionDown duration:1]];
        }
    }
    
    [self touchesMoved:touches withEvent:event];
}

@end
