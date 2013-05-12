//
//  RootViewController.h
//  Decision Maker
//
//  Created by abc on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Multi_ChoiceViewController.h"
#import "ComboBoxViewController.h"
#import "ChoiceWithPriority.h"


@class Flip_Objects;

@class Flip_Objects1;

@class Flip_Objects2;

@class Flip_Objects3;

@class Flip_Objects4;

@interface RootViewController : UITableViewController<UIPickerViewDelegate,UIPickerViewDataSource,UIActionSheetDelegate,ComboBoxDelegate,UIWebViewDelegate>{
    
    Flip_Objects *detailViewController;
    
    Flip_Objects1 *detailViewController1;
    
    Flip_Objects2 *detailViewController2;
    
    Flip_Objects3 *detailViewController3;
    
    Flip_Objects4 *detailViewController4;
    
  
    
    
    ChoiceWithPriority *chwp;
    
    
    ComboBoxViewController *comboBox;
    
    NSMutableArray *list;
    
    UIView *imageView;
    
    IBOutlet UITableView *tableView;
    
    UIButton *doneButton;
    
    BOOL viewVisible; // Will be YES if our imageView is visible, NO otherwise.
    
    UIPickerView *pickerView1;
    
    NSMutableArray *array1;
    
    NSMutableArray *array2;

    
    NSArray *Sportarray;
    
    UITextField* txtSelectSport;
    
    UIButton   *titleLabel; 
    
    UIButton   *msgLabel;  
    
    UIWebView  *view1;
    
    NSTimer *t;
    
 
    
    
    //*********dropdown*******
    
    UIButton *button;
	
	NSArray *arrayData;

    NSMutableArray *ViewController;
   
    
    UIButton *comboButton;
    
}


@property(nonatomic,retain) Flip_Objects *detailViewController;

@property(nonatomic,retain) Flip_Objects1 *detailViewController1;

@property(nonatomic,retain) Flip_Objects2 *detailViewController2;

@property(nonatomic,retain) Flip_Objects3 *detailViewController3;

@property(nonatomic,retain) Flip_Objects4 *detailViewController4;

@property (nonatomic, retain) IBOutlet UIView *imageView;

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@property (nonatomic, retain) UIPickerView *pickerView1;

@property (nonatomic, retain) NSArray *Sportarray;





- (void)showHideView;

//-(void)globAnimation;

-(void)addComboBox;
-(void)timerOn;
@end
