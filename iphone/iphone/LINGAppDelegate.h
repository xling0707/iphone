//
//  LINGAppDelegate.h
//  iphone
//
//  Created by 李晓肆 on 14-1-11.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LINGLoginViewController;

@interface LINGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;



@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;



+ (LINGAppDelegate *) shareAppDelegate;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
