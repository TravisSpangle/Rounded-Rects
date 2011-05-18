//
//  RoundedRectAppDelegate.h
//  RoundedRect
//
//  Created by Travis Spangle on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RoundedRectViewController;

@interface RoundedRectAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet RoundedRectViewController *viewController;

@end
