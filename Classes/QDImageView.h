//
//  QDImageView.h
//  QDImageView
//
//  Created by Nikolay on 14/04/14.
//
//

#import <UIKit/UIKit.h>

@interface QDImageView : UIImageView

@property (nonatomic, strong) UIImage *placeholder;

- (void)setImageWithURL:(NSURL *)url;
- (void)setImageWithURL:(NSURL *)url completion:(void (^)(NSError *error))completion;
- (void)setImageWithURL:(NSURL *)url needCache:(BOOL)needCache completion:(void (^)(NSError *error))completion;

@end
