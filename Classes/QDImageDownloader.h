//
//  QDImageDownloader.h
//  QDImageView
//
//  Created by Nikolay on 14/04/14.
//
//

#import <Foundation/Foundation.h>

typedef void (^QDImageDownloaderResultBlock)(UIImage *result, NSError *error, NSURL *url);

@interface QDImageDownloader : NSObject

+ (instancetype)sharedDownloader;
- (void)getImageWithUrl:(NSURL *)url needCache:(BOOL)needCache completion:(QDImageDownloaderResultBlock)completion;

@end
