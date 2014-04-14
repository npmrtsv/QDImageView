//
//  QDImageView.m
//  QDImageView
//
//  Created by Nikolay on 14/04/14.
//
//

#import "QDImageView.h"
#import "QDImageDownloader.h"

@interface QDImageView()

@property (nonatomic, strong) NSURL *imageUrl;

@end

@implementation QDImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib{
    [self initialize];
}

- (void)initialize{
    [self setImage:_placeholder];
}

- (void)setPlaceholder:(UIImage *)placeholder{
    _placeholder = placeholder;
    [self setImage:_placeholder];
}

- (void)setImageWithURL:(NSURL *)url{
    [self setImageWithURL:url completion:nil];
}

- (void)setImageWithURL:(NSURL *)url completion:(void (^)(NSError *error))completion{
    [self setImageWithURL:url needCache:NO completion:completion];
}

- (void)setImageWithURL:(NSURL *)url needCache:(BOOL)needCache completion:(void (^)(NSError *error))completion{
    [self setImage:_placeholder];
    
    if (url && ![url.absoluteString isEqualToString:@""]) {
        _imageUrl = url;
        
        [[QDImageDownloader sharedDownloader] getImageWithUrl:url needCache:needCache completion:^(UIImage *result, NSError *error, NSURL *url) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!result || error) {
                    [self setImage:_placeholder];
                    if (completion)
                        completion([NSError errorWithDomain:@"QDImageView" code:0 userInfo:@{NSLocalizedDescriptionKey:@"Error during image loading"}]);
                }else{
                    if ([_imageUrl.absoluteString isEqualToString:url.absoluteString]){
                        [self setImage:result];
                    }
                    if (completion)
                        completion(nil);
                }
            });
        }];
    }else{
        if (completion)
            completion([NSError errorWithDomain:@"QDImageView" code:0 userInfo:@{NSLocalizedDescriptionKey:@"No url"}]);
    }
}

@end
