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
@property (strong) NSTimer *timer;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Setup a recurring check to NSRunningApplication
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(checkRunningApps) userInfo:nil repeats:YES];
}

- (void)checkRunningApps {
    // this leaks
    
    NSArray *apps = [NSWorkspace sharedWorkspace].runningApplications;
    for (NSRunningApplication *app in apps) {
        NSLog(@"app bundle identifier = %@", app.bundleIdentifier);
    }
    
    // Auto release pools don't seem to help
    // Monitoring [NSWorkspace sharedWorkspace].runningApplications with KVO recreates the same problem...but NSTimer is a little simpler
    // Individual instances of NSRunningApplication seem to leak as well, but looks like it could also be tied to runningApplications array
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    [self.timer invalidate];
}

@end
