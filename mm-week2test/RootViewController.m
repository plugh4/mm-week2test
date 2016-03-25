//
//  RootViewController.m
//  mm-week2test
//
//  Created by Christopher Serra on 3/25/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "RootViewController.h"
#import "NationalPark.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *parksArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // initialize data array
    self.parksArray = [NSMutableArray new];
    NationalPark *p;
    p = [[NationalPark alloc] initWithName:@"Antelope Canyon" location:@"Arizona" image:@"antelope"];
    [self.parksArray addObject:p];
    p = [[NationalPark alloc] initWithName:@"Grand Canyon" location:@"Arizona" image:@"grandcanyon"];
    [self.parksArray addObject:p];
    p = [[NationalPark alloc] initWithName:@"Skaftafell" location:@"Iceland" image:@"skaftafell"];
    [self.parksArray addObject:p];
    p = [[NationalPark alloc] initWithName:@"Vatnajokull" location:@"Iceland" image:@"vatnajokull"];
    [self.parksArray addObject:p];
}


#pragma mark - UITableViewDataSource


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return self.parksArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

    int i = indexPath.row;
    NationalPark *park = self.parksArray[i];

    // populate cell
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"parkCell"];
    cell.textLabel.text = park.name;
    cell.imageView.image = [UIImage imageNamed:park.imageName];
    return cell;
}


#pragma mark - UITableViewDelegate

// enable cell delete
- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
    if (self.editing)
    {
        self.editing = false;
        [self.tableView setEditing:false animated:true];
        sender.style = UIBarButtonItemStylePlain;
        [sender setTitle:@"Edit"];
    }
    else
    {
        self.editing = true;
        [self.tableView setEditing:true animated:true];
        sender.style = UIBarButtonItemStyleDone;
        [sender setTitle:@"Done"];
    }
    
}
// perform cell delete
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // delete data
    int i = indexPath.row;
    [self.parksArray removeObjectAtIndex:i];

    // reload tableView
    [tableView reloadData];
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
