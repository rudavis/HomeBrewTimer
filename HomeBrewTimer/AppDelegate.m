//
//  AppDelegate.m
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/12/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import "AppDelegate.h"
#import "Recipe.h"
#import "RecipesViewController.h"

@implementation AppDelegate {
    NSMutableArray *recipes;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    recipes = [NSMutableArray arrayWithCapacity:20];
    Recipe *recipe = [[Recipe alloc] init];
    recipe.name = @"Best IPA";
    recipe.desc = @"Name says it all";
    recipe.boilLength = 90;
    [recipes addObject:recipe];
    
    recipe = [[Recipe alloc] init];
    recipe.name = @"Sweet Stout";
    recipe.desc = @"Sweeter than average";
    recipe.boilLength = 60;
    [recipes addObject:recipe];

    recipe = [[Recipe alloc] init];
    recipe.name = @"Wholesome Wheat";
    recipe.desc = @"Delicious and good for you";
    recipe.boilLength = 60;
    [recipes addObject:recipe];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:0];
    RecipesViewController *recipesViewController = [[navigationController viewControllers] objectAtIndex:0];
    recipesViewController.recipes = recipes;
    
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
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
