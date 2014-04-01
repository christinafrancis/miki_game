//
//  cell.h
//  Miki_game
//
//  Created by Christina Francis on 11/14/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cell : NSObject{
   
}

@property NSNumber* tag;
@property enum cell_type{
corner,
edge,
middle
}  ct;
@property enum conqueredBy{
silver,
gold,
none
} cb;
@property NSArray* neighbors;
@property int coinCount;

+ (cell*) cellObj;
- ( cell* ) initWithTag:(NSNumber*) tag;
-( void) desc;


@end
