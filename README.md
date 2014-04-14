<h2>Installation</h2>

    pod 'QDImageView', '~> 0.0.1'
    
    
<h2>How to use QDImageView</h2>

    QDImageView *qdImageView = [[QDImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];
    [qdImageView setPlaceholder:[UIImage imageNamed:@"placeholder"]];
    [qdImageView setImageWithURL:[NSURL URLWithString:@"https://avatars0.githubusercontent.com/u/5310289?s=460"]];
    

<h2>How to use QDImageDownloader</h2>

    [[QDImageDownloader sharedDownloader] getImageWithUrl:url needCache:needCache completion:^(UIImage *result, NSError *error, NSURL *url) {
            //do stuff
        }];

<h2>Info</h2>

You can use QDImageView in your reusable components (cells for example) without flickering.

<h2>Licence</h2>

QDImageView is available under the MIT license. See the LICENSE file for more info.
