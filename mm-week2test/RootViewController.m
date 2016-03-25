//
//  RootViewController.m
//  mm-week2test
//
//  Created by Christopher Serra on 3/25/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "RootViewController.h"
#import "NationalPark.h"
#import "NationalParkDetailViewController.h"

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
    p = [[NationalPark alloc] initWithName:@"Vatnajokull" location:@"Iceland" image:@"vatnajokull"];
    [self.parksArray addObject:p];
    p = [[NationalPark alloc] initWithName:@"Skaftafell" location:@"Iceland" image:@"skaftafell"];
    [self.parksArray addObject:p];
    p = [[NationalPark alloc] initWithName:@"Antelope Canyon" location:@"Arizona" image:@"antelope"];
    [self.parksArray addObject:p];
    p = [[NationalPark alloc] initWithName:@"Grand Canyon" location:@"Arizona" image:@"grandcanyon"];
    [self.parksArray addObject:p];
    
    // navbar
    self.navigationItem.title = @"hi";
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


#pragma mark - Delete + Move

// Delete

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
    // delete cell
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        int i = indexPath.row;
        [self.parksArray removeObjectAtIndex:i];
    }
    [tableView reloadData];
}

// Move

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // move in data array
    NationalPark *p = self.parksArray[sourceIndexPath.row];
    [self.parksArray removeObjectAtIndex:sourceIndexPath.row];
    [self.parksArray insertObject:p atIndex:destinationIndexPath.row];
    // refresh
    [self.tableView reloadData];
}
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewCellEditingStyleDelete;
//}





#pragma mark - Navigation

// fired every time user taps on a table row
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@ %i", NSStringFromSelector(_cmd), indexPath.row);
    //    int i = indexPath.row;
    //    NationalPark *park = self.parksArray[i];

    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"toParkDetail" sender:cell];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

    // push data to destination VC
    NationalParkDetailViewController *dstVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    dstVC.park = self.parksArray[indexPath.row];
}

@end
