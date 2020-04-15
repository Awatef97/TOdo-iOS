//
//  AddTask.m
//  TodoProject
//
//  Created by Mostafa Samir on 12/17/19.
//  Copyright © 2019 Mostafa Samir. All rights reserved.
//

#import "AddTask.h"

@interface AddTask (){
    NSArray *statusArr;
    NSArray *prirityArr;
}

@end

@implementation AddTask
Tasks *t;
NSMutableArray *s;


NSMutableArray *p;
TodoTableTableViewController *table;
- (void)viewDidLoad {
    [super viewDidLoad];
    s=[NSMutableArray new];
    p=[NSMutableArray new];
    
    statusArr=@[@"ToDo",@"In Progress",@"Done"];
    prirityArr=@[@"Low",@"Med",@"High"];
    self.status.dataSource=self;
    self.status.delegate=self;
    self.priority.dataSource=self;
    self.priority.delegate=self;
  
    // Do any additional setup after loading the view.
    table=[self.storyboard instantiateViewControllerWithIdentifier:@"table"];
    
}

- (void)viewWillAppear:(BOOL)animated{

    _nameField.text=@"";
    _desField.text=@"";
    [_status selectRow:0 inComponent:0 animated:true];
    [_priority selectRow:0 inComponent:0 animated:true];
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    int NOC;
    switch (pickerView.tag) {
        case 0:
            NOC=[statusArr count];
            
            break;
        case 1:
            NOC=[prirityArr count];
            break;
            
        default:
            break;
    }
    return NOC;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title=@"";
    switch (pickerView.tag) {
        case 0:
            title= statusArr [row];
            break;
        case 1:
            title= prirityArr [row];
            break;
            
        default:
            break;
    }
    return title;
}
- (IBAction)save:(id)sender {
    //t=[Tasks new];
   /* [t setTaskName:_nameField.text];
    [t setDesc:_desField.text];
    [t setStatus:[statusArr objectAtIndex: [_status selectedRowInComponent:0]] ] ;
    [t setPriority:[prirityArr objectAtIndex:[_priority selectedRowInComponent:0]]];*/
   
        Tasks *obj1 = [[Tasks alloc] init];
        obj1.TaskName=_nameField.text;
        obj1.desc=_desField.text;
        obj1.status =[statusArr objectAtIndex:[ _status selectedRowInComponent:0]];
        obj1.priority =[statusArr objectAtIndex:[ _priority selectedRowInComponent:0]];
    
        
    
        
        NSArray *objectArray = [NSArray arrayWithObjects:obj1, nil];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:objectArray] forKey:@"savedArray"];
        [defaults synchronize];
    
    [_p AddTask:obj1];
    [self.navigationController popViewControllerAnimated:YES];

    
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
