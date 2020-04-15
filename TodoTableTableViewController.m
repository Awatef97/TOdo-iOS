//
//  TodoTableTableViewController.m
//  TodoProject
//
//  Created by Mostafa Samir on 12/14/19.
//  Copyright © 2019 Mostafa Samir. All rights reserved.
//

#import "TodoTableTableViewController.h"
#import "ViewController.h"
@interface TodoTableTableViewController ()

@end

@implementation TodoTableTableViewController
Tasks *t1;
Tasks *t2;
Tasks *t3;

NSMutableArray *list;

AddTask *add;
ViewController *detail;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    list=[NSMutableArray new];
    
    add=[self.storyboard instantiateViewControllerWithIdentifier:@"add"];
    [add  setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    detail=[self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    [add setP:self];
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [list count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Tasks *task=[Tasks new];
    task=[list objectAtIndex:indexPath.row];
    cell.textLabel.text= task.TaskName;
    cell.accessoryType=UITableViewCellAccessoryDetailButton;
    // Configure the cell...
    
    return cell;
}
-(void)AddTask:(Tasks *)t{
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [currentDefaults objectForKey:@"savedArray"];
    NSMutableArray *objectArray = nil;
    
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (savedArray != nil)
            objectArray = [[NSMutableArray alloc] initWithArray:savedArray];
        else
            objectArray = [[NSMutableArray alloc] init];
    }
    [list  addObject:t];
        self.tableView.reloadData;
    
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
  [detail setTaskName:[[list objectAtIndex:indexPath.row] TaskName] ];
    [detail setDesc:[[list objectAtIndex:indexPath.row] desc] ];
    [detail setStatus:[[list objectAtIndex:indexPath.row] status] ];
    
  // [detail setPriority:[[list objectAtIndex:indexPath.row]]];
    [self.navigationController pushViewController:detail animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)AddNewTask:(id)sender {
    [self.navigationController pushViewController:add animated:YES];
}
@end
