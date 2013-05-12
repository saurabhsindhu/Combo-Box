//
//  ChoiceWithPriority.h
//  Decision Maker
//
//  Created by cis on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceWithPriority : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIAlertViewDelegate>{

    IBOutlet UITableView *uiTableView;
    IBOutlet UIImageView *slateImage;
    NSMutableArray *dataArray;
    UILabel *dateLable;
    
    UITextField *field;
    UIButton *doneButton;
    UITapGestureRecognizer *tapRecognizer;
   
     NSInteger totalRow;
    NSString *priorityType;   
    CGFloat animatedDistance;
    
    bool stop;

}
@property(nonatomic,retain) UIImageView *slateImage;

@property(nonatomic,retain)UITableView *uiTableView;

@property(nonatomic,retain)NSMutableArray *dataArray;

@property(nonatomic,retain)NSString *priorityType;

@property(nonatomic)NSInteger totalRow;

@property(nonatomic)bool stop;
-(NSString *)numToAlpha:(int)num;

-(void)swapRowSource:(NSArray *)path;

-(NSString *)removeSpace:(NSString *)str;
@end
