//
//  ConfettiView.m
//  Confetti_Presenter
//
//  Created by Bat-Erdene, Ene on 7/19/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import "ConfettiView.h"

@implementation ConfettiView{
    CAEmitterLayer * topEmitter;
    CAEmitterLayer * bottomEmitter;
    CAEmitterLayer * leftSideEmitter;
    CAEmitterLayer * rightSideEmitter;

    CAEmitterLayer * lleftSideEmitter;
    CAEmitterLayer * rrightSideEmitter;
    AVAudioPlayer * popSound;
}

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor clearColor];
//        UIImageView* congratz = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"congratz.png"]] autorelease];
//        congratz.frame = CGRectMake(frame.size.width / 32,frame.size.height / 32, 400, 200);
//        [self addSubview:congratz];
//        NSString *celebrationURLString = [[NSBundle mainBundle] pathForResource:@"Celebration" ofType:@".m4a"];
        NSString *urlString = [[NSBundle mainBundle] pathForResource:@"confetti_pop" ofType:@".mp3"];
        NSURL *url = [[NSURL alloc] initFileURLWithPath:urlString];
        
        NSError * err = nil;
        popSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
        if (err)
        {
            NSLog(@"Couldnt access the audio!");
        }
        topEmitter = [[CAEmitterLayer alloc] init];
        topEmitter.emitterPosition = CGPointMake(frame.size.width / 2, 0);
        topEmitter.emitterSize = CGSizeMake(frame.size.width,100);
        topEmitter.emitterShape = kCAEmitterLayerLine;
        //emitter.emitterShape = kCAEmitterLayerLine;
//        emitter.preservesDepth = YES;
        bottomEmitter = [[CAEmitterLayer alloc] init];
        bottomEmitter.emitterPosition = CGPointMake(frame.size.width / 2, 0);
        bottomEmitter.emitterSize = CGSizeMake(frame.size.width,100);
        bottomEmitter.emitterShape = kCAEmitterLayerLine;
        
        leftSideEmitter = [[CAEmitterLayer alloc] init];
        leftSideEmitter.emitterPosition = CGPointMake(0, frame.size.height * 0.3);
        leftSideEmitter.emitterSize = CGSizeMake(frame.size.width,100);
        
        rightSideEmitter = [[CAEmitterLayer alloc] init];
        rightSideEmitter.emitterPosition = CGPointMake(frame.size.width, frame.size.height * 0.3);
        rightSideEmitter.emitterSize = CGSizeMake(frame.size.width,100);
        
        lleftSideEmitter = [[CAEmitterLayer alloc] init];
        lleftSideEmitter.emitterPosition = CGPointMake(0, frame.size.height * 0.6);
        lleftSideEmitter.emitterSize = CGSizeMake(frame.size.width,100);
        
        rrightSideEmitter = [[CAEmitterLayer alloc] init];
        rrightSideEmitter.emitterPosition = CGPointMake(frame.size.width, frame.size.height * 0.6);
        rrightSideEmitter.emitterSize = CGSizeMake(frame.size.width,100);
        
        
        CAEmitterCell *topTriangleCell = [CAEmitterCell emitterCell];
        [self initTopCell:topTriangleCell shape:@"triangle"];
        topTriangleCell.color = [[UIColor colorWithRed:0.1 green:0.2 blue:0.7 alpha:0.6] CGColor];
        CAEmitterCell *topConfettiCell = [CAEmitterCell emitterCell];
        [self initTopCell:topConfettiCell shape:@"confetti"];
        topConfettiCell.color = [[UIColor colorWithRed:0.1 green:0.7 blue:0.2 alpha:0.7] CGColor];
        CAEmitterCell *topStarCell = [CAEmitterCell emitterCell];
        [self initMediumCell:topStarCell shape:@"star"];
        topStarCell.color = [[UIColor colorWithRed:0.6 green:0.0 blue:0.6 alpha:0.7] CGColor];
        
        CAEmitterCell *bottomConfettiCell = [CAEmitterCell emitterCell];
        bottomConfettiCell.color = [[UIColor colorWithRed:0.1 green:0.7 blue:0.2 alpha:0.9] CGColor];
        [self initTopCell:bottomConfettiCell shape:@"confetti"];
        CAEmitterCell *bottomDiamondCell = [CAEmitterCell emitterCell];
        [self initTopCell:bottomDiamondCell shape:@"diamond"];
        bottomDiamondCell.color = [[UIColor colorWithRed:0.7 green:0.1 blue:0.2 alpha:0.8] CGColor];
        CAEmitterCell *bottomStarCell = [CAEmitterCell emitterCell];
        [self initTopCell:bottomStarCell shape:@"star"];
        bottomStarCell.color = [[UIColor colorWithRed:0.6 green:0.0 blue:0.6 alpha:0.7] CGColor];
        
        CAEmitterCell *smallConfettiCell = [CAEmitterCell emitterCell];
        smallConfettiCell.color = [[UIColor colorWithRed:0.1 green:0.7 blue:0.2 alpha:0.9] CGColor];
        [self initSmallCell:smallConfettiCell shape:@"confetti"];
        CAEmitterCell *smallDiamondCell = [CAEmitterCell emitterCell];
        [self initSmallCell:smallDiamondCell shape:@"diamond"];
        smallDiamondCell.color = [[UIColor colorWithRed:0.0 green:0.6 blue:0.6 alpha:0.8] CGColor];
        CAEmitterCell *smallStarCell = [CAEmitterCell emitterCell];
        [self initSmallCell:smallStarCell shape:@"star"];
        smallStarCell.color = [[UIColor colorWithRed:0.6 green:0.0 blue:0.6 alpha:0.7] CGColor];
        
        CAEmitterCell *largeConfettiCell = [CAEmitterCell emitterCell];
        largeConfettiCell.color = [[UIColor colorWithRed:0.8 green:0.1 blue:0.1 alpha:0.9] CGColor];
        [self initLargeCell:largeConfettiCell shape:@"confetti"];
        CAEmitterCell *medSmallDiamondCell = [CAEmitterCell emitterCell];
        [self initMedSmallCell:medSmallDiamondCell shape:@"diamond"];
        medSmallDiamondCell.color = [[UIColor colorWithRed:0.7 green:0.1 blue:0.2 alpha:0.8] CGColor];
        CAEmitterCell *largeStarCell = [CAEmitterCell emitterCell];
        [self initLargeCell:largeStarCell shape:@"star"];
        largeStarCell.color = [[UIColor colorWithRed:0.3 green:0.7 blue:0.0 alpha:0.7] CGColor];
        
        bottomEmitter.renderMode = kCAEmitterLayerBackToFront;
        bottomEmitter.beginTime = CACurrentMediaTime() + 0.4;
        bottomEmitter.emitterCells = [NSArray arrayWithObjects: largeConfettiCell, largeStarCell, topStarCell, nil];
        topEmitter.renderMode = kCAEmitterLayerBackToFront;
        topEmitter.beginTime = CACurrentMediaTime();
        topEmitter.emitterCells = [NSArray arrayWithObjects:smallDiamondCell, smallConfettiCell, medSmallDiamondCell, nil];
//        leftSideEmitter.renderMode = kCAEmitterLayerBackToFront;
//        leftSideEmitter.beginTime = CACurrentMediaTime();
//        leftSideEmitter.emitterCells = [NSArray arrayWithObjects:smallConfettiCell, smallStarCell, smallDiamondCell, nil];
//        rightSideEmitter.renderMode = kCAEmitterLayerBackToFront;
//        rightSideEmitter.beginTime = CACurrentMediaTime();
//        rightSideEmitter.emitterCells = [NSArray arrayWithObjects:largeConfettiCell, largeStarCell, largeDiamondCell, nil];
//        lleftSideEmitter.renderMode = kCAEmitterLayerBackToFront;
//        lleftSideEmitter.beginTime = CACurrentMediaTime();
//        lleftSideEmitter.emitterCells = [NSArray arrayWithObjects:smallConfettiCell, smallStarCell, smallDiamondCell, nil];
//        rrightSideEmitter.renderMode = kCAEmitterLayerBackToFront;
//        rrightSideEmitter.beginTime = CACurrentMediaTime();
//        rrightSideEmitter.emitterCells = [NSArray arrayWithObjects:largeConfettiCell, largeStarCell, largeDiamondCell, nil];
        
//        [self.layer addSublayer:bottomEmitter];
        [self.layer addSublayer:topEmitter];
        //[self.layer addSublayer:leftSideEmitter];
        //[self.layer addSublayer:rightSideEmitter];
        //[self.layer addSublayer:lleftSideEmitter];
        //[self.layer addSublayer:rrightSideEmitter];
        double delayInSeconds = 0.4;
        dispatch_time_t newTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(newTime, dispatch_get_main_queue(), ^(void) {
//            [emitter setLifetime:0.0];
//            [emitter setValue:[NSNumber numberWithFloat:0.0]
//                   forKeyPath:@"emitterCells.confetti.birthRate"];
//            [emitter setValue:[NSNumber numberWithFloat:0.0]
//                   forKeyPath:@"emitterCells.diamond.birthRate"];
//            [emitter setValue:[NSNumber numberWithFloat:0.0]
//                   forKeyPath:@"emitterCells.triangle.birthRate"];
//            [emitter setValue:[NSNumber numberWithFloat:0.0]
//                   forKeyPath:@"emitterCells.star.birthRate"];
            [self.layer addSublayer:bottomEmitter];
//            [smallEmitter setLifetime:0.0];
//            [smallEmitter setValue:[NSNumber numberWithFloat:0.0]
//                   forKeyPath:@"emitterCells.confetti.birthRate"];
//            [smallEmitter setValue:[NSNumber numberWithFloat:0.0]
//                   forKeyPath:@"emitterCells.diamond.birthRate"];
//            [smallEmitter setValue:[NSNumber numberWithFloat:0.0]
//                   forKeyPath:@"emitterCells.triangle.birthRate"];
//            [smallEmitter setValue:[NSNumber numberWithFloat:0.0]
//                   forKeyPath:@"emitterCells.star.birthRate"];
        });
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
                        [self->topEmitter setLifetime:0.0];
                        [self->topEmitter setValue:[NSNumber numberWithFloat:0.0]
                                forKeyPath:@"emitterCells.confetti.birthRate"];
                        [self->topEmitter setValue:[NSNumber numberWithFloat:0.0]
                               forKeyPath:@"emitterCells.diamond.birthRate"];
                        [self->topEmitter setValue:[NSNumber numberWithFloat:0.0]
                               forKeyPath:@"emitterCells.triangle.birthRate"];
                        [self->topEmitter setValue:[NSNumber numberWithFloat:0.0]
                               forKeyPath:@"emitterCells.star.birthRate"];

                        [self->bottomEmitter setLifetime:0.0];
                        [self->bottomEmitter setValue:[NSNumber numberWithFloat:0.0]
                               forKeyPath:@"emitterCells.confetti.birthRate"];
                        [self->bottomEmitter setValue:[NSNumber numberWithFloat:0.0]
                               forKeyPath:@"emitterCells.diamond.birthRate"];
                        [self->bottomEmitter setValue:[NSNumber numberWithFloat:0.0]
                               forKeyPath:@"emitterCells.triangle.birthRate"];
                        [self->bottomEmitter setValue:[NSNumber numberWithFloat:0.0]
                               forKeyPath:@"emitterCells.star.birthRate"];
            
//                        [self->leftSideEmitter setLifetime:0.0];
//                        [self->leftSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                               forKeyPath:@"emitterCells.confetti.birthRate"];
//                        [self->leftSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                               forKeyPath:@"emitterCells.diamond.birthRate"];
//                        [self->leftSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                               forKeyPath:@"emitterCells.triangle.birthRate"];
//                        [self->leftSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                               forKeyPath:@"emitterCells.star.birthRate"];
//
//                        [self->rightSideEmitter setLifetime:0.0];
//                        [self->rightSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                                 forKeyPath:@"emitterCells.confetti.birthRate"];
//                        [self->rightSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                                 forKeyPath:@"emitterCells.diamond.birthRate"];
//                        [self->rightSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                                 forKeyPath:@"emitterCells.triangle.birthRate"];
//                        [self->rightSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                                 forKeyPath:@"emitterCells.star.birthRate"];
//
//                        [self->lleftSideEmitter setLifetime:0.0];
//                        [self->lleftSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                               forKeyPath:@"emitterCells.confetti.birthRate"];
//                        [self->lleftSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                               forKeyPath:@"emitterCells.diamond.birthRate"];
//                        [self->lleftSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                               forKeyPath:@"emitterCells.triangle.birthRate"];
//                        [self->lleftSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                               forKeyPath:@"emitterCells.star.birthRate"];
//
//                        [self->rrightSideEmitter setLifetime:0.0];
//                        [self->rrightSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                                 forKeyPath:@"emitterCells.confetti.birthRate"];
//                        [self->rrightSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                                 forKeyPath:@"emitterCells.diamond.birthRate"];
//                        [self->rrightSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                                 forKeyPath:@"emitterCells.triangle.birthRate"];
//                        [self->rrightSideEmitter setValue:[NSNumber numberWithFloat:0.0]
//                                 forKeyPath:@"emitterCells.star.birthRate"];
        });
    }
    return self;
}
-(void) playAudio{
    [popSound play];
}
-(void)initTopCell:(CAEmitterCell *)cell shape: (NSString*) nameOfTheShape{
    
    NSString *name = [NSString stringWithFormat:@"%@.png", nameOfTheShape];
    //    UIBezierPath * path = [self drawRectConfetti];
    //    cell.contents = (id)([self drawRectConfetti]);
    cell.contents = (id)([[UIImage imageNamed: name] CGImage]);
    cell.name = nameOfTheShape;
    cell.birthRate = 100;
    cell.lifetime = 7;
    cell.velocity = 150;
    //    cell.velocityRange = 50;
    cell.emissionRange = (CGFloat)M_PI_2;
    cell.emissionLongitude = (CGFloat)M_PI_2;
    
    cell.yAcceleration = 130;
    //    cell.zAcceleration = 5;
    cell.spinRange = 10.0;
    cell.scale = 1.0;
    // cell.alphaSpeed = -0.09;
    //cell.scaleRange = 1.0;
}
-(void)initBottomCell:(CAEmitterCell *)cell shape: (NSString*) nameOfTheShape{
    
    NSString *name = [NSString stringWithFormat:@"%@.png", nameOfTheShape];
    //    UIBezierPath * path = [self drawRectConfetti];
    //    cell.contents = (id)([self drawRectConfetti]);
    cell.contents = (id)([[UIImage imageNamed: name] CGImage]);
    cell.name = nameOfTheShape;
    cell.birthRate = 100;
    cell.lifetime = 7;
    cell.velocity = 150;
    //    cell.velocityRange = 50;
    cell.emissionRange = (CGFloat)M_PI_2*(-1);
    cell.emissionLongitude = (CGFloat)M_PI_2*(-1);

    cell.yAcceleration = -150;
    //    cell.zAcceleration = 5;
    cell.spinRange = 10.0;
    cell.scale = 1.0;
     cell.alphaSpeed = -0.38;
    //cell.scaleRange = 1.0;
}
-(void)initLeftSideCell:(CAEmitterCell *)cell shape: (NSString*) nameOfTheShape{
    
    NSString *name = [NSString stringWithFormat:@"%@.png", nameOfTheShape];
    //    UIBezierPath * path = [self drawRectConfetti];
    //    cell.contents = (id)([self drawRectConfetti]);
    cell.contents = (id)([[UIImage imageNamed: name] CGImage]);
    cell.name = nameOfTheShape;
    cell.birthRate = 100;
    cell.lifetime = 7;
    cell.velocity = 150;
    //    cell.velocityRange = 50;
    cell.emissionRange = (CGFloat)M_PI;
//    cell.emissionLongitude = (CGFloat)M_PI_2;
    cell.xAcceleration = 75;
    cell.yAcceleration = 150;
    //    cell.zAcceleration = 5;
    cell.spinRange = 10.0;
    cell.scale = 1.0;
    // cell.alphaSpeed = -0.09;
    //cell.scaleRange = 1.0;
}
-(void)initRightSideCell:(CAEmitterCell *)cell shape: (NSString*) nameOfTheShape{
    
    NSString *name = [NSString stringWithFormat:@"%@.png", nameOfTheShape];
    //    UIBezierPath * path = [self drawRectConfetti];
    //    cell.contents = (id)([self drawRectConfetti]);
    cell.contents = (id)([[UIImage imageNamed: name] CGImage]);
    cell.name = nameOfTheShape;
    cell.birthRate = 100;
    cell.lifetime = 7;
    cell.velocity = 150;
    //    cell.velocityRange = 50;
    cell.emissionRange = (CGFloat)M_PI;
    cell.emissionLongitude = (CGFloat)M_PI;
    cell.xAcceleration = -75;
    cell.yAcceleration = 150;
    //    cell.zAcceleration = 5;
    cell.spinRange = 10.0;
    cell.scale = 1.0;
    // cell.alphaSpeed = -0.09;
    //cell.scaleRange = 1.0;
}

-(void)initSmallCell:(CAEmitterCell *)cell shape: (NSString*) nameOfTheShape{
    
    NSString *name = [NSString stringWithFormat:@"%@.png", nameOfTheShape];
//    UIBezierPath * path = [self drawRectConfetti];
//    cell.contents = (id)([self drawRectConfetti]);
    cell.contents = (id)([[UIImage imageNamed: name] CGImage]);
    cell.name = nameOfTheShape;
    cell.birthRate = 100;
    cell.lifetime = 7;
    cell.velocity = 150;
//    cell.velocityRange = 50;
    cell.emissionRange = (CGFloat)M_PI_2;
    cell.emissionLongitude = (CGFloat)M_PI;
    
    cell.yAcceleration = 150;
//    cell.zAcceleration = 5;
    cell.spinRange = 10.0;
    cell.scale = 0.5;
   // cell.alphaSpeed = -0.09;
    //cell.scaleRange = 1.0;
}
-(void)initMedSmallCell:(CAEmitterCell *)cell shape: (NSString*) nameOfTheShape{
    
    NSString *name = [NSString stringWithFormat:@"%@.png", nameOfTheShape];
//    UIBezierPath * path = [self drawRectConfetti];
//    cell.contents = (id)([self drawRectConfetti]);
    cell.contents = (id)([[UIImage imageNamed: name] CGImage]);
    cell.name = nameOfTheShape;
    cell.birthRate = 100;
    cell.lifetime = 7;
    cell.velocity = 150;
//    cell.velocityRange = 50;
    cell.emissionRange = (CGFloat)M_PI_2;
    cell.emissionLongitude = (CGFloat)M_PI;
    
    cell.yAcceleration = 170;
//    cell.zAcceleration = 5;
    cell.spinRange = 10.0;
    cell.scale = 0.7;
   // cell.alphaSpeed = -0.09;
    //cell.scaleRange = 1.0;
}
-(void)initMediumCell:(CAEmitterCell *)cell shape: (NSString*) nameOfTheShape{
    
    NSString *name = [NSString stringWithFormat:@"%@.png", nameOfTheShape];
    //UIBezierPath * path = [self drawRectConfetti];
    //    cell.contents = (id)([self drawRectConfetti]);
    cell.contents = (id)([[UIImage imageNamed: name] CGImage]);
    cell.name = nameOfTheShape;
    cell.birthRate = 50;
    cell.lifetime = 7;
    cell.velocity = 150;
//    cell.velocityRange = 50;
    cell.emissionRange = (CGFloat)M_PI_2;
    cell.emissionLongitude = (CGFloat)M_PI;
    //    cell.emissionLatitude = (CGFloat) M_PI_2;
    cell.yAcceleration = 200;
    //    cell.zAcceleration = 5;
    cell.spinRange = 10.0;
    cell.scale = 1.0;
   // cell.alphaSpeed = -0.09;
    //cell.scaleRange = 1.0;
}
-(void)initLargeCell:(CAEmitterCell *)cell shape: (NSString*) nameOfTheShape{
    
    NSString *name = [NSString stringWithFormat:@"%@.png", nameOfTheShape];
    //UIBezierPath * path = [self drawRectConfetti];
    //    cell.contents = (id)([self drawRectConfetti]);
    cell.contents = (id)([[UIImage imageNamed: name] CGImage]);
    cell.name = nameOfTheShape;
    cell.birthRate = 50;
    cell.lifetime = 7;
    cell.velocity = 150;
//    cell.velocityRange = 50;
    cell.emissionRange = (CGFloat)M_PI_2;
    cell.emissionLongitude = (CGFloat)M_PI;
    //    cell.emissionLatitude = (CGFloat) M_PI_2;
    cell.yAcceleration = 270;
    //    cell.zAcceleration = 5;
    cell.spinRange = 10.0;
    cell.scale = 1.3;
   // cell.alphaSpeed = -0.09;
    //cell.scaleRange = 1.0;
}
+ (Class) layerClass{
    return [CAEmitterLayer class];
}
@end
