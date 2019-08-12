//
//  ViewController.m
//  Confetti_Presenter
//
//  Created by Bat-Erdene, Ene on 7/19/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.confetti = [[SCNParticleSystem alloc] init];
//    NSString *name = [NSString stringWithFormat:@"confetti.png"];
//    self.confetti.particleImage = [UIImage imageNamed:name];
//    self.confetti.particleLifeSpan = 7;
//    self.confetti.particleSizeVariation = 5.0;
//    self.confetti.particleAngle = (CGFloat) M_PI;
//    self.confetti.particleColor = [UIColor redColor];
//    self.confetti.affectedByGravity = YES;
//    self.confetti.birthLocation = SCNParticleBirthLocationSurface;
//    self.confetti.birthRate = 100;
//    self.confetti.emitterShape = [SCNSphere sphereWithRadius:3.0];
}
-(void)setUpScene
{
    self.sceneView = [[SCNView alloc] initWithFrame:self.view.frame];
    self.sceneView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.sceneView];
    self.scene = [SCNScene sceneNamed:@"confetti.scn"];
//    self.scene = [[SCNScene alloc] init];
//    self.particles = [[SCNParticleSystem alloc] init];
//    self.particles.particleImage = [UIImage imageNamed:@"confetti.png"];
//    self.particles.loops = false;
//    self.particles.emitterShape = [SCNBox boxWithWidth:10 height:1 length:1 chamferRadius:0];
//    self.particles.emittingDirection = SCNVector3Make(self.view.frame.size.width/2, 0, 0);
//    self.particles.birthLocation = SCNParticleBirthLocationVolume;
//    self.particles.acceleration = SCNVector3Make(0, 1, 0);
//    self.particles.affectedByGravity = YES;
//    self.particles.particleMass = 1.0;
//    self.particles.particleSize = 0.01;
//    self.particles.particleSizeVariation = 1.0;
//    self.particles.particleColor = [UIColor blueColor];
//    self.particles.particleLifeSpan = 7.0;
//    self.particles.particleColorVariation = SCNVector4Make(1.0, 1.0, 1.0, 1.0);
//    self.particles.particleVelocity = 10;
//    self.particles.spreadingAngle = 180;
//    // self.particles.particleAngle = (CGFloat) M_PI_2;
//    self.particles.affectedByPhysicsFields = YES;
//    self.particles.birthRate = 200;
//    self.particles.emissionDuration = 2;
//    [self.scene.rootNode addParticleSystem:self.particles];
//    [self.scene addParticleSystem:self.particles withTransform:SCNMatrix4MakeRotation(0, 0, 0, 0)];
//    CABasicAnimation * animation = [[CABasicAnimation alloc] init];
//    animation.fromValue = [NSValue valueWithSCNVector3:SCNVector3Make(0, 0, 0)];
//    animation.toValue = [NSValue valueWithSCNVector3:SCNVector3Make(1, 1, 1)];
//    animation.duration = 1;
//    SCNParticlePropertyController *property = [SCNParticlePropertyController controllerWithAnimation:animation];
//    particles.propertyControllers = [[NSDictionary alloc] initWithObjects:property forKeys:SCNParticlePropertyRotationAxis];

    SCNCamera *camera = [[SCNCamera alloc] init];
    SCNNode *cameraNode = [[SCNNode alloc] init];
    cameraNode.camera = camera;
    cameraNode.position = SCNVector3Make(0.0, -13.0, 20.0);
    [self.scene.rootNode addChildNode:cameraNode];
    
    SCNNode *node = [self.scene rootNode];
    self.particles = [[SCNParticleSystem alloc] init];
    self.particles = node.particleSystems;
    self.particles.birthRate = 10;
    [self.scene.rootNode removeAllParticleSystems];
    self.scene.background.contents = [UIColor clearColor];
    [self.sceneView setScene:self.scene];
    
    //[self.scene.rootNode addParticleSystem:self.particles];
    
    
    //    ConfettiView *layer = [[ConfettiView alloc] initWithFrame:self.view.bounds];
//               layer.hidden = NO;
//               [layer playAudio];
//    SCNMatrix4 *conf = [1 0 0 0; 0; 1 0 0; 0 0 1 0; 0 0 0 1];
//    self.scene = [[SCNScene alloc] init];
//    SCNNode *particleNode = [[SCNNode alloc] init];
//    [particleNode addParticleSystem:self.particles];
//    [self.scene.rootNode addChildNode:particleNode];

//    [self.scene.rootNode addParticleSystem:self.particles];
//    NSLog(@"CheckPoint");
//    self.sceneView.scene = self.scene;
}
- (IBAction)popConfetti:(id)sender {
//     ConfettiView *layer = [[ConfettiView alloc] initWithFrame:self.view.bounds];
//            layer.hidden = NO;
//            [layer playAudio];
//            [self.view addSubview:layer];
//            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 6 * NSEC_PER_SEC);
//            dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
//                [self removeConfettiSubviewsFromUIView:self.view];
//            });
    [self setUpScene];
}
- (void)removeConfettiSubviewsFromUIView:(UIView *)parentView
{
    for (id child in [parentView subviews])
    {
       if ([child isMemberOfClass:[ConfettiView class]])
       {
            [child removeFromSuperview];
       }
    }
}

@end
