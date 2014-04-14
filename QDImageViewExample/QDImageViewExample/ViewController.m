//
//  ViewController.m
//  QDImageViewExample
//
//  Created by Nikolay on 14/04/14.
//
//

#import "ViewController.h"
#import "ImageTableViewCell.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *imagesUrls;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _imagesUrls = @[@"http://img1.wikia.nocookie.net/__cb20130220120438/harrypotter/ru/images/thumb/5/56/Image100500.jpg/100px-42,462,0,419-Image100500.jpg",
                    @"http://img1.wikia.nocookie.net/__cb20121221142156/tekken/ru/images/thumb/a/a4/Marshall_Law_-_CG_Art_Image_-_Tekken_Tag_Tournament_2.jpg/100px-0,1742,0,1742-Marshall_Law_-_CG_Art_Image_-_Tekken_Tag_Tournament_2.jpg",
                    @"http://appsad.ru/wp-content/uploads/2014/03/Image-119.png",
                    @"http://img1.wikia.nocookie.net/__cb20110511115813/tekken/ru/images/thumb/3/39/Hwoarang_-_Full-body_CG_Art_Image_-_Tekken_6.png/100px-0,281,0,281-Hwoarang_-_Full-body_CG_Art_Image_-_Tekken_6.png",
                    @"http://tangorod.ru/wp-content/uploads/2013/01/article_image-image.3fc35c0c-d6aa-449c-981e-fecb463459b0-100x100.jpg",
                    @"http://img-thumb.ffffound.com/static-data/assets/6/78332ffcf29eaf06d922c98535dcdcda3e7c3d9e_xs.jpg",
                    @"https://s3.amazonaws.com/creativemornings-com/uploads/user/avatar/17466/small_image.jpg",
                    @"http://img2.wikia.nocookie.net/__cb20100306183051/masseffect/ru/images/thumb/8/8c/Biotics_Codex_Image.jpg/100px-0,338,0,338-Biotics_Codex_Image.jpg",
                    @"http://www.pamorama.net/wp-content/plugins/kk-social-share-starter/a.png",
                    @"http://images.rosfirm.ru/utils/images/image_get?autostarted=1&table=company_img&path=price&company=77.4043049&name=zhenskie-chasy-zolotye_55_800x600w&f_img=preview",
                    @"http://www.soc-research.info/autor/mac_files/stacks_image_2812.png",
                    @"http://catalog.zune.net/v3.2/ru-ru/apps/3a39f940-3770-e011-81d2-78e7d1fa76f8/primaryImage?width=100&height=100&resize=true",
                    @"http://res.cloudinary.com/demo/image/upload/t_demo_combined/sample.jpg",
                    @"http://screenshots.en.sftcdn.net/en/scrn/69000/69228/composer-fx-movie-image-7.jpg",
                    @"http://s019.radikal.ru/i604/1301/b9/d8926b70d345.png"];
    
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ImageTableViewCell class]) bundle:nil] forCellReuseIdentifier:[ImageTableViewCell reuseID]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ImageTableViewCell reuseID]];
    
    [cell.qdImageView setImageWithURL:[NSURL URLWithString:[_imagesUrls objectAtIndex:arc4random_uniform(_imagesUrls.count-1)]]];
    
    return cell;
}

@end
