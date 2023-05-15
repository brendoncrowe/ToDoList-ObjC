//
//  Item.h
//  ToDoList-ObjC
//
//  Created by Brendon Crowe on 5/15/23.
//

@interface Item : NSObject

// properties
@property NSString *name;
@property NSString *topic;

// initializers
-(instancetype)initWithName: (NSString*)name andTopic: (NSString *)topic;

// methods
+(NSArray *)fetchItems;

@end
