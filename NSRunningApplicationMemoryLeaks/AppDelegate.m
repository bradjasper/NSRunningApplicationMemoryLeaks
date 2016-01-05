//
//  AppDelegate.m
//  NSRunningApplicationMemoryLeaks
//
//  Created by Brad Jasper on 1/4/16.
//  Copyright © 2016 Brad Jasper. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
