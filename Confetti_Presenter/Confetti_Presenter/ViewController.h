//
//  ViewController.h
//  Confetti_Presenter
//
//  Created by Bat-Erdene, Ene on 7/19/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import <SpriteKit/SpriteKit.h>
#import "ConfettiView.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController <SCNSceneRendererDelegate,SCNPhysicsContactDelegate>
@property (strong, nonatomic) SCNView *sceneView;
//@property (strong, nonatomic) SCNView * sceneView;
@property (strong, nonatomic) SCNScene * scene;
@property (strong, nonatomic) SCNParticleSystem *particles;
- (IBAction)popConfetti:(id)sender;
@end

NS_ASSUME_NONNULL_END
