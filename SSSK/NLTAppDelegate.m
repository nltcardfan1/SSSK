//
//  NLTAppDelegate.m
//  SSSK
//
//  Created by Nathan Thomas on 6/11/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import "NLTAppDelegate.h"
#import "NLTIE370ViewController.h"
#import "NLTToDoTableViewController.h"
#import "NLTBinHexConvViewController.h"
#import "NLTToDoStore.h"

@implementation NLTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //declare views
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NLTIE370ViewController *IE370 = [[NLTIE370ViewController alloc] init];
    NLTToDoTableViewController *ToDo = [[NLTToDoTableViewController alloc] init];
    NLTBinHexConvViewController *binConv = [[NLTBinHexConvViewController alloc] init];
    
    //add to do to nav controller view
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:ToDo];
    
    //add tabs to view
    tabBarController.viewControllers = @[IE370,navController,binConv];
    self.window.rootViewController = tabBarController;
    
 
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    BOOL success = [[NLTToDoStore sharedStore] saveChanges];
    if(success)
    {
        NSLog(@"saved all the crap!");
    }
    else
    {
        NSLog(@"You Done goofed");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

@end



