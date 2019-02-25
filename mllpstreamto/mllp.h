#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface mllp : NSObject

+(bool)sendPacs:(NSDictionary*)pacs
        message:(NSString*)message
 stringEncoding:(NSStringEncoding)stringEncoding
        payload:(NSMutableString*)payload;

@end

NS_ASSUME_NONNULL_END
