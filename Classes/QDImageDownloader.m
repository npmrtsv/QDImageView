//
//  QDImageDownloader.m
//  QDImageView
//
//  Created by Nikolay on 14/04/14.
//
//

#import "QDImageDownloader.h"

@interface QDImageDownloader()

@property (nonatomic, strong) NSURLCache *cache;
@property (nonatomic, strong) NSMutableDictionary *loadingImages;

@end

@implementation QDImageDownloader

+ (instancetype)sharedDownloader{
    static QDImageDownloader *sharedDownloader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDownloader = [[self alloc] init];
    });
    return sharedDownloader;
}

- (id)init{
    self = [super init];
    if (self) {
        int cacheSizeMemory = 16*1024*1024; // 16MB
        int cacheSizeDisk = 64*1024*1024; // 64MB
        _cache = [[NSURLCache alloc] initWithMemoryCapacity:cacheSizeMemory diskCapacity:cacheSizeDisk diskPath:@"ImageCache"];
        _loadingImages = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)getImageWithUrl:(NSURL *)url needCache:(BOOL)needCache completion:(QDImageDownloaderResultBlock)completion{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSCachedURLResponse *response = [_cache cachedResponseForRequest:request];
    
    if (response) {
        completion([UIImage imageWithData:response.data], nil, url);
    }else{
        if (!_loadingImages[url]) {
            [_loadingImages setObject:[NSMutableArray array] forKey:url];
            
            [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                UIImage *result = [UIImage imageWithData:data];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    for (QDImageDownloaderResultBlock completion in _loadingImages[url]) {
                        completion(result, connectionError, response.URL);
                    }
                    [_loadingImages removeObjectForKey:url];
                });
                
                if (response && data && [data length] != 0 && !connectionError && needCache) {
                    [_cache storeCachedResponse:[[NSCachedURLResponse alloc] initWithResponse:response data:data] forRequest:request];
                }
            }];
        }
        
        if (completion)
	        [_loadingImages[url] addObject:completion];
    }
}

@end
