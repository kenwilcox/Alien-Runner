//
//  GameViewController.m
//  Alien Runner
//
//  Created by Kenneth Wilcox on 12/13/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "GameViewController.h"
//#import "GameScene.h"
#import "MainMenuScene.h"

@implementation GameViewController

- (void)viewWillLayoutSubviews
{
  [super viewWillLayoutSubviews];
  
  // Configure the view
  SKView * skView = (SKView *)self.view;
  if (!skView.scene)
  {
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene
    SKScene * scene = [MainMenuScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene
    [skView presentScene:scene];
  }
}

- (BOOL)shouldAutorotate
{
  return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return UIInterfaceOrientationMaskAllButUpsideDown;
  } else {
    return UIInterfaceOrientationMaskAll;
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}

@end
