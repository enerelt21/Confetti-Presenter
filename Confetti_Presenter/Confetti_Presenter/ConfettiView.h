//
//  ConfettiView.h
//  Confetti_Presenter
//
//  Created by Bat-Erdene, Ene on 7/19/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConfettiView : UIView
-(void)initSmallCell:(CAEmitterCell *)cell shape:(NSString*) nameOfTheShape;
-(void)initMediumCell:(CAEmitterCell *)cell shape:(NSString*) nameOfTheShape;
-(void)initLargeCell:(CAEmitterCell *)cell shape:(NSString*) nameOfTheShape;
-(void)initMedSmallCell:(CAEmitterCell *)cell shape: (NSString*) nameOfTheShape;
-(void)playAudio;

@end

NS_ASSUME_NONNULL_END
