//
//  AppDelegate.m
//  Functionality Implementation
//
//  Created by Taiyaba Sultana on 2/3/17.
//  Copyright © 2017 Abdul Kareem. All rights reserved.
//

#import "AppDelegate.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
#import "NoInternetViewController.h"

@interface AppDelegate () {
    int counter;
}

@property (nonatomic) Reachability * hostReachability;
@property (nonatomic) Reachability * internetReachability;
@property (nonatomic) Reachability * wifiReachability;

- (void)logReachability:(Reachability *)reachability;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    counter = 1;
    NSLog(@"Did finish launchining with options");
    
    self.hostReachability = [Reachability reachabilityWithHostName:@"www.abdkhaja.com"];
    [self.hostReachability startNotifier];
    
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    
    //    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
    //    [self.wifiReachability startNotifier];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object: nil];
    
    [self logReachability:self.hostReachability];
    [self logReachability:self.internetReachability];
    //    [self logReachailbity:self.wifiReachability];
    
    return YES;
}

- (void)reachabilityChanged:(NSNotification *)notification {
    Reachability *reachability = [notification object];
    [self logReachability: reachability];
}

- (void)logReachability:(Reachability *)reachability {
    
    NSLog(@"called for %i st time", counter);
    counter ++;
    
    NSString *whichReachabilityString = nil;
    
    //checking whether the host reachability method is available in our reachability objet ???
    if (reachability == self.hostReachability) {
        NSLog(@"what is this self.hostrechabillity : %@", self.hostReachability);
        NSLog(@"what is this reachability : %@", reachability);
        whichReachabilityString = @"www.abdkhaja.com";
    } else if (reachability == self.internetReachability) {
        whichReachabilityString = @"The Internet";
    } else if (reachability == self.wifiReachability) {
        whichReachabilityString = @"Local Wi-Fi";
    }
    
    NSString *howReachableString = nil;
    
    //below "currentReachabilityStatus" returns whether the host is reachable or not, if reachable then returns whether it is reachable by cellular data or wifi network
    // And, howReachableString holds value returned from currentReachability status
    switch (reachability.currentReachabilityStatus) {
        case NotReachable: {
            howReachableString = @"not reachable";
           
            
            
            
            
            break;
        }
        case ReachableViaWWAN: {
            howReachableString = @"reachable by cellular data";
            break;
        }
        case ReachableViaWiFi: {
            howReachableString = @"reachable by Wi-Fi";
            break;
        }
    }
    
    NSLog(@"Which reachability: %@ and how reachability: %@", whichReachabilityString, howReachableString);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"App will resign active");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"App did enter background");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"App will enter foreground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    //
    NSLog(@"App did become active");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"App will terminate");
}


@end
