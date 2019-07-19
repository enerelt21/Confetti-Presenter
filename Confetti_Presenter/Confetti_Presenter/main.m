//
//  main.m
//  Confetti_Presenter
//
//  Created by Bat-Erdene, Ene on 7/12/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
