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

const static NSString *runningApplicationsContext = @"running applications observation";

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[NSWorkspace sharedWorkspace] addObserver:self
                                    forKeyPath:@"runningApplications"
                                       options:NSKeyValueObservingOptionNew
                                       context:&runningApplicationsContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (context == &runningApplicationsContext) {
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
    // CFRelease((CFTypeRef)context);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
