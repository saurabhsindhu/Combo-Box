//
//  Multi_ChoiceViewController.h
//  Multi Choice
//
//  Created by Mac on 22/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Multi_ChoiceViewController : UIViewController <UITableViewDelegate ,UITableViewDataSource, UITextFieldDelegate, UIAlertViewDelegate> {
    
    
    
    
    UITableView *detailTableView;
    
    NSInteger selectedIndex;
    
    UITextField *field;
    
    
    CGFloat animatedDistance;
    UIButton *doneButton;
    UITapGestureRecognizer *tapRecognizer;
    
    
    NSInteger totalRow;
    
}
@property(nonatomic,retain)IBOutlet UITableView *detailTableView;

@property (nonatomic)NSInteger selectedIndex;
@property(nonatomic)NSInteger totalRow;

-(NSString *)removeSpace:(NSString *)str;

@end
