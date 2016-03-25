//
//  NationalParkDetailViewController.m
//  mm-week2test
//
//  Created by Christopher Serra on 3/25/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "NationalParkDetailViewController.h"
#import "NationalPark.h"

@interface NationalParkDetailViewController ()

// UI outlets
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *locationText;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *linkButton;

@end

@implementation NationalParkDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"park detail: %@", self.park.name);
    
    NationalPark *p = self.park;
    self.nameText.text = p.name;
    self.locationText.text = p.location;
    self.imageView.image = [UIImage imageNamed:p.imageName];
    self.parentViewController.navigationItem.title = p.name;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
