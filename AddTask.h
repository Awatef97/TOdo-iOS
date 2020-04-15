//
//  AddTask.h
//  TodoProject
//
//  Created by Mostafa Samir on 12/17/19.
//  Copyright © 2019 Mostafa Samir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPortocol.h"
#import "TodoTableTableViewController.h"
#import "Tasks.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddTask : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *desField;
@property (weak, nonatomic) IBOutlet UIPickerView *status;
@property (weak, nonatomic) IBOutlet UIPickerView *priority;


- (IBAction)save:(id)sender;
@property id <AddPortocol>p;
@end

NS_ASSUME_NONNULL_END
