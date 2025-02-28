#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

// @property：自动生成setter和getter方法  nonatomic：提高性能不在乎线程安全
@property (nonatomic, strong) NSString *messageID;
@property (nonatomic, strong) NSString *senderID;
@property (nonatomic, strong) NSString *receiverID;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate *timestamp;

@end 
