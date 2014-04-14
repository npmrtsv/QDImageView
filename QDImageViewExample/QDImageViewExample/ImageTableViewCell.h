//
//  ImageTableViewCell.h
//  QDImageViewExample
//
//  Created by Nikolay on 14/04/14.
//
//

#import <UIKit/UIKit.h>
#import "QDImageView.h"

@interface ImageTableViewCell : UITableViewCell

+ (NSString*)reuseID;

@property (weak, nonatomic) IBOutlet QDImageView *qdImageView;

@end
