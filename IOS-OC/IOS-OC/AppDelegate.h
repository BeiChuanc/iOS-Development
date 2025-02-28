//
//  AppDelegate.h
//  IOS-OC
//
//  Created by 北川 on 2025/2/28.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) UIWindow *window;

- (void)saveContext;


@end

