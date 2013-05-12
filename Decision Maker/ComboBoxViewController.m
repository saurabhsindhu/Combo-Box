//
//  ComboBoxViewController.m
//  ComboBox
//
//  Created by cis on 12/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ComboBoxViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ComboBoxViewController


@synthesize arrayData,uiTableView,sView,delegate,frontImage,frontLabel,rowHeight,rowWidth,frontImageView,mainButton,tag;




-(void)comboBoxCellSelected:(NSInteger)returnIndex;
{
self.frontLabel.text=[arrayData objectAtIndex:returnIndex];

}



-(id)initWithView:(UIView *)refView arrData:(NSArray *)data{
    
    if(self=[super init]){
    
               
        
        self.arrayData=data;
        
        
        self.rowHeight=refView.frame.size.height;
        
        
        self.rowWidth=refView.frame.size.width;
        
        
                
        self.sView=refView;
        
        
               self.frame=CGRectMake(refView.frame.origin.x, refView.frame.origin.y, rowWidth,rowHeight );
        
        
       
        allRect=CGRectMake(0, 0, sView.frame.size.width, rowHeight);
        
        
        
        self.frontImageView=[[UIImageView alloc]initWithFrame:allRect];
        
        
        
        
        self.frontLabel=[[UILabel alloc]initWithFrame:allRect];
        
        self.mainButton=[[UIButton alloc]initWithFrame:allRect];
        
        //[delegate addImage];
        
                
        
        uiTableView = [[UITableView alloc] initWithFrame:CGRectMake(0+(rowWidth*0.05),0,sView.frame.size.width-((rowWidth*0.05)+(rowWidth*0.05)), 0) style:UITableViewStylePlain];
        
        uiTableView.dataSource = self;
        
        uiTableView.delegate = self;
        
        
        
        [mainButton addTarget:self action:@selector(openAnimation)forControlEvents:UIControlEventTouchUpInside];
        frontLabel.textAlignment=UITextAlignmentCenter;
        frontLabel.text=@"Select";
        frontLabel.backgroundColor=[UIColor clearColor];
        
        [frontLabel setFont:[UIFont fontWithName:@"Georgia-BoldItalic" size:12]];
        
        // tmp.text=@"sagar";
        
        self.uiTableView.layer.shadowColor = [[UIColor blackColor] CGColor];
        
        self.uiTableView.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
        
        self.uiTableView.layer.shadowOpacity =.0f;
        
        self.uiTableView.layer.shadowRadius = 10.0f;
     
        self.frontLabel.layer.borderWidth=0;  
        
                self.mainButton.layer.borderWidth=0; 
        self.layer.borderWidth=0;
        self.frontImageView.layer.borderWidth=0;
        
        [self addSubview:mainButton];
        [self addSubview:frontImageView];
        [self addSubview:frontLabel];
        [self addSubview:uiTableView];
        
       
    }

    return self;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.arrayData.count;
}


-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return self.rowHeight;

}






-(void)openAnimation{
	
	
    if(self.uiTableView.frame.origin.y==0){
        
        
        [UIView beginAnimations:nil context:nil];
	
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelay:0];
    
    self.frontLabel.text=@"";
    
    self.frontImageView.frame=CGRectMake(allRect.origin.x,allRect.origin.y , allRect.size.width, 0);
	
    self.frontLabel.frame=CGRectMake(allRect.origin.x,allRect.origin.y , allRect.size.width, 0);
    
    [UIView commitAnimations];
	
    
    
    
    [UIView beginAnimations:nil context:nil];
	
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelay:0.5];
    
    
    self.uiTableView.frame = CGRectMake(self.uiTableView.frame.origin.x,self.uiTableView.frame.origin.y+rowHeight,self.uiTableView.frame.size.width, rowHeight*arrayData.count);
    
     self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, rowWidth,rowHeight * (arrayData.count+1));
    
	
    self.frontImageView.frame=CGRectMake(allRect.origin.x,allRect.origin.y , allRect.size.width, 0);
	
        
        
        
       
        
        
        [UIView commitAnimations];
        
        [delegate comboBoxButtonClicked:self.mainButton.tag];
       
 [self performSelector:@selector(hide:) withObject:@"1" afterDelay:0.5];
		
    }
    	
	
}


-(void)closeAnimation{

	
	//NSValue *contextPoint = [[NSValue valueWithCGPoint:self.view.center] retain];
	
	
     if(self.uiTableView.frame.origin.y==rowHeight){
             
         
         [UIView beginAnimations:nil context:nil];
	
	[UIView setAnimationDuration:0.5];
	
    [UIView setAnimationDelay:0];
	
    self.uiTableView.frame = CGRectMake(self.uiTableView.frame.origin.x,0,self.uiTableView.frame.size.width, 0);
 
self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, rowWidth,rowHeight );
	
	[UIView commitAnimations];
    
    
    
    [UIView beginAnimations:nil context:nil];
	
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelay:0.5];
    
    
    
    self.frontImageView.frame=CGRectMake(allRect.origin.x,allRect.origin.y , allRect.size.width, rowHeight);
	
    
    
    self.frontLabel.frame=CGRectMake(allRect.origin.x,allRect.origin.y , allRect.size.width, rowHeight);

    
            
         
         
         [UIView commitAnimations];
	[self performSelector:@selector(hide:) withObject:@"0" afterDelay:0.5];
	
     }
    
    
}

-(void)hide:(NSString *)val{

    
    if([val integerValue]==0){
    
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    self.layer.shadowOffset = CGSizeMake(0, 0);
    
    self.layer.shadowOpacity =0;
    
        self.layer.shadowRadius = 0;}
    else{
    
    
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        
        self.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
        
        self.layer.shadowOpacity =8.0f;
        
        self.layer.shadowRadius = 15.0f;
        
    
    }
    


    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	    
    
    [delegate comboBoxButtonClicked:self returnIndex:indexPath.row];
    
    
    
    [self comboBoxCellSelected:indexPath.row];
	
	[self closeAnimation];
	
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
        
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		
    }
    
	cell.textLabel.text = [arrayData objectAtIndex:indexPath.row];
    
    
    [cell.textLabel setFont:[UIFont fontWithName:@"Georgia-BoldItalic" size:10]];
    self.uiTableView.backgroundColor=[UIColor grayColor];
    
    
    cell.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    cell.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
    
    cell.layer.shadowOpacity =5.0f;
    
    cell.layer.shadowRadius = 15.0f;

    
    
    return cell;
	
}	

-(void)comboBoxButtonClicked:(UIView *)comboBox returnIndex:(NSInteger)returnIndex{

}

-(void)addItem:(NSString *)item{
//[self.uiTableView ce]


}

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
