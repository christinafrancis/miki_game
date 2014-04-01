//
//  CFViewController.h
//  Miki_game
//
//  Created by Christina Francis on 11/14/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cell.h"
#import "queue.h"

#define ROWS  4
#define COLUMNS 5

#define SILVER 0
#define GOLD 1

#define MAXM 500

@interface CFViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *bt_1;
@property (weak, nonatomic) IBOutlet UIButton *bt_2;
@property (weak, nonatomic) IBOutlet UIButton *bt_3;
@property (weak, nonatomic) IBOutlet UIButton *bt_4;
@property (weak, nonatomic) IBOutlet UIButton *bt_5;

@property (weak, nonatomic) IBOutlet UIButton *bt_6;
@property (weak, nonatomic) IBOutlet UIButton *bt_7;
@property (weak, nonatomic) IBOutlet UIButton *bt_8;
@property (weak, nonatomic) IBOutlet UIButton *bt_9;
@property (weak, nonatomic) IBOutlet UIButton *bt_10;

@property (weak, nonatomic) IBOutlet UIButton *bt_11;
@property (weak, nonatomic) IBOutlet UIButton *bt_12;
@property (weak, nonatomic) IBOutlet UIButton *bt_13;
@property (weak, nonatomic) IBOutlet UIButton *bt_14;
@property (weak, nonatomic) IBOutlet UIButton *bt_15;

@property (weak, nonatomic) IBOutlet UIButton *bt_16;
@property (weak, nonatomic) IBOutlet UIButton *bt_17;
@property (weak, nonatomic) IBOutlet UIButton *bt_18;
@property (weak, nonatomic) IBOutlet UIButton *bt_19;
@property (weak, nonatomic) IBOutlet UIButton *bt_20;



@property NSArray* buttons;
@property NSArray* board_cells;
@property queue* myQueue;

@property int nextImg_coinCount;
@property int nextImg_cb;
@property NSNumber* nextImg_tagNum;

@property NSMutableDictionary* goldSet;

@end
