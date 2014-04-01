//
//  queue.m
//  Miki_game
//
//  Created by Christina Francis on 11/14/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import "queue.h"

@implementation queue

static queue* _qObj;

+ (queue*) qObj
{
    if (_qObj == nil) {
        _qObj = [[queue alloc] init];
        _qObj.Qarray = [[NSMutableArray alloc] initWithObjects: nil];
    }
    return _qObj;
}
-(queue*) init{
    self = [super init];
    if(self){
          self.Qarray = [[NSMutableArray alloc] initWithObjects:@101, nil];
    }
    return self;
}

- (void) enqueueWith:(id) cell_id{
     [self.Qarray removeLastObject];
    [self.Qarray addObject:cell_id];
    [self.Qarray addObject:@101];

}
- (id) dequeue{
  
    id last  = [self.Qarray objectAtIndex:0];
    [self.Qarray removeObjectAtIndex: 0];
    return last;
    
}
- (id) first_in_queue{
    
    
    id last  = [self.Qarray objectAtIndex:0];
    return last;
}

-(void) desc{
      NSLog(@"queue: %@",self.Qarray);
}

@end
