//
//  Tasks.m
//  TodoProject
//
//  Created by Mostafa Samir on 12/14/19.
//  Copyright © 2019 Mostafa Samir. All rights reserved.
//

#import "Tasks.h"
#import "AddTask.h"
@implementation Tasks
- (void)encodeWithCoder:(NSCoder *)encoder{
   // [encoder encodeObject:self.str forKey:@"str"];
    [encoder encodeObject:self.TaskName forKey:@"TaskName"];
    [encoder encodeObject:self.desc forKey:@"desc"];
    [encoder encodeObject:self.status forKey:@"status"];
    [encoder encodeObject:self.priority forKey:@"priority"];
    
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
        self.TaskName = [decoder decodeObjectForKey:@"TaskName"];
        self.desc = [decoder decodeObjectForKey:@"desc"];
        self.status = [decoder decodeObjectForKey:@"status"];
        self.priority = [decoder decodeObjectForKey:@"priority"];
        
    }
    return self;
}

@end
