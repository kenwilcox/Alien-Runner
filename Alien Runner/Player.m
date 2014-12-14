//
//  Player.m
//  Alien Runner
//
//  Created by Kenneth Wilcox on 12/13/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "Player.h"

@implementation Player

static const CGFloat kGravity = -0.2;
static const BOOL kShowCollisionRect = YES;

- (instancetype)init
{
  self = [super initWithImageNamed:@"p1_walk01"];
  if (self) {
  }
  return self;
}

- (void)update
{
  if (kShowCollisionRect) {
    [self removeAllChildren];
    
    SKShapeNode *box = [SKShapeNode node];
    box.path = CGPathCreateWithRect([self collisionRectAtTarget], nil);
    box.strokeColor = [SKColor redColor];
    box.lineWidth = 0.1;
    box.position = CGPointMake(-self.targetPosition.x, -self.targetPosition.y);
    
    [self addChild:box];
  }
  
  // Apply gravity
  self.velocity = CGVectorMake(self.velocity.dx, self.velocity.dy + kGravity);
  
  // Move player
  self.targetPosition = CGPointMake(self.position.x + self.velocity.dx, self.position.y + self.velocity.dy);

}

- (CGRect)collisionRectAtTarget
{
  // Calculate smaller rectanlge based on frame
  CGRect collisionRect = CGRectInset(self.frame, 4, 2);
  
  // Move rectangle to target position
  CGPoint movement = CGPointMake(self.targetPosition.x - self.position.x, self.targetPosition.y - self.position.y);
  
  // having an inset of 2 on the y and -2 offset gives 4 pixel pading on top and 0 on bottom
  collisionRect = CGRectOffset(collisionRect, movement.x, movement.y - 2);
  return collisionRect;
}

@end
