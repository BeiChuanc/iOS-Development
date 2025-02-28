#import <Foundation/Foundation.h>

@interface RelationshipModel : NSObject

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSArray *friends; // 好友列表

@end 