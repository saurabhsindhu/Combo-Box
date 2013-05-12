//
//  ComboBoxViewController.h
//  ComboBox
//
//  Created by cis on 12/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@class ComboBoxViewController;

@protocol ComboBoxDelegate <NSObject>

@required
-(void)comboBoxButtonClicked:(ComboBoxViewController *)comboBoxView returnIndex:(NSInteger)returnIndex;

@optional
//-(void)addItem:(NSString *)item;
-(void)comboBoxButtonClicked:(NSInteger)returnIndex;
-(CGFloat)cellTextSize:(NSInteger)atIndex;
-(void)addImage;



@end



@interface ComboBoxViewController : UIView<UITableViewDelegate,UITableViewDataSource>{

    id<ComboBoxDelegate> delegate;

    UITableView *uiTableView;
  
    UIView *sView;
    
    UIImage *fronImage;
    
    UIButton *mainButton;
    
    UIImageView *frontImageView;
    
    UILabel *frontLabel;
    
    NSArray *arrayData;
    
    CGFloat rowWidth;
    
    CGFloat rowHeight;

    CGRect allRect;
    
   
    NSInteger tag;

}

@property(nonatomic)NSInteger tag;

@property(nonatomic)CGFloat rowHeight;

@property(nonatomic)CGFloat rowWidth;

@property(nonatomic,retain)NSArray *arrayData;

@property(nonatomic,retain)id<ComboBoxDelegate> delegate;

@property(nonatomic,retain) UITableView *uiTableView;

@property(nonatomic,retain) UIView *sView;

@property(nonatomic,retain)UIImage *frontImage;

@property(nonatomic,retain)UIImageView *frontImageView;

@property(nonatomic,retain) UILabel *frontLabel;

@property(nonatomic,retain)UIButton *mainButton;



-(id)initWithView:(UIView*)refView arrData:(NSArray *)data; 

-(void)openAnimation;

-(void)closeAnimation;

-(void)comboBoxCellSelected:(NSInteger)returnIndex;























@end
