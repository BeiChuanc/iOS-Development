#import <Foundation/Foundation.h>

@interface PostModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSArray *media; // 图片和视频

@end 