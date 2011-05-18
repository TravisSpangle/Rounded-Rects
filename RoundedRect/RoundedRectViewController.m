//
//  RoundedRectViewController.m
//  RoundedRect
//
//  Created by Travis Spangle on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RoundedRectViewController.h"
#import "DrawRoundRect.h"

@implementation RoundedRectViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) loadView
{
    self.view = [[[DrawRoundRect alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 480.0)] autorelease];
    self.view.backgroundColor = [UIColor grayColor];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction) cornerChanged: (UISlider *) cornerSlider;
{
    NSLog(@"Changing corner value: %f",[cornerSlider value]);
}
- (IBAction) widthChanged: (UISlider *) widthSlider;
{
   NSLog(@"Changed width value: %f",[widthSlider value]);
}
@end
