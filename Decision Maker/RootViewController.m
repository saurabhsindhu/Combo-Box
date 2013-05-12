//
//  RootViewController.m
//  Decision Maker
//
//  Created by abc on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "Multi_ChoiceViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ChoiceWithPriority.h"

#define kSCNavBarImageTag 6183746
#define kSCNavBarColor [UIColor colorWithRed:0.54 green:0.18 blue:0.03 alpha:1.0]

@implementation RootViewController

UIActionSheet *actionSheet;

NSTimer *addTimer;
 //static NSInteger viewIndex;
@synthesize detailViewController,detailViewController1,detailViewController2,detailViewController3,detailViewController4,imageView,tableView,pickerView1,Sportarray;

bool flage=NO;

-(void)timeActive{
    
    t=[NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(showMsgWithDelay) userInfo:nil repeats:YES];
    
   // addTimer=[NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(timerOn) userInfo:nil repeats:YES];
    

     
}

NSMutableArray *rowImageArray;



-(void)comboBoxButtonClicked:


(ComboBoxViewController *)comboBoxView returnIndex:(NSInteger)returnIndex{

    
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:comboBoxView.mainButton.tag-1 inSection:0]];
    cell.selected=FALSE;

          NSLog(@"%d",comboBoxView.mainButton.tag);
           
}




- (void)viewDidLoad

{
        
    ViewController=[[NSMutableArray alloc]init];
    
    
    arrayData = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"Make Decision",@"Set Priority",@"Quick Desicion",nil]];
    rowImageArray=[[NSMutableArray alloc]init];
    
    [rowImageArray addObject:[UIImage imageNamed:@"coin.png"]];
    [rowImageArray addObject:[UIImage imageNamed:@"bowling.png"]];
    [rowImageArray addObject:[UIImage imageNamed:@"QQ.png"]];
    [rowImageArray addObject:[UIImage imageNamed:@"whee.png"]];
    [rowImageArray addObject:[UIImage imageNamed:@"dice.png"]];
    
    [rowImageArray addObject:[UIImage imageNamed:@"PINBALL.png"]];
    
    
    list = [[NSMutableArray alloc] init];
    
    //Add items
    
    
    
    [list addObject:@"2 choices"];
    [list addObject:@"3 choices"];
    [list addObject:@"4 choices"];
    [list addObject:@"5 choices"];
    [list addObject:@"6 choices"];
    [list addObject:@"choices > 7 & < 10"];
    
    
    
    //*********pickerview Controller*******
    
   /* pickerView1=[[UIPickerView alloc]init];
    pickerView1.delegate=self;
    pickerView1.dataSource=self;
    pickerView1.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:pickerView1];
    self.pickerView1.hidden=YES;
    */
    NSArray *array=[NSArray arrayWithObjects:@"7 choices",@"8 choices",@"9 choices",@"10 choices ",nil];
    
    self.Sportarray=array;
    
    //Set the title
    self.navigationItem.title = @"Decision Maker";
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	//tableView.rowHeight = 65;
	tableView.backgroundColor = [UIColor clearColor];
	//imageView.image = [UIImage imageNamed:@"gradientBackground.png"];
    
    [super viewDidLoad];
    
      
    [self addComboBox];
    
    [self.view addSubview:imageView]; // Add it as a subview of our main view
	[imageView setFrame:CGRectOffset([imageView frame], 0, -imageView.frame.size.height)]; // Move it up top and off screen
	viewVisible = NO;
    imageView.alpha=0.5;
         
    
    
    
    [self.view addSubview:view1];
    
    
    
    
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	if(navigationType ==  UIWebViewNavigationTypeLinkClicked) {
		[[UIApplication sharedApplication] openURL:request.URL];
		return NO;
	}
	else 
		return YES;
}



#pragma mark -
#pragma mark Class methods


-(void)stopAn:(id *)contex{
    
    
    UIImageView *star=(UIImageView *)contex;
    //if([star isAnimating]){
    
    
    [star stopAnimating];
    star.alpha=0;
    [star release];  
    //}
    [UIView commitAnimations];
    
    
 
    
}


-(void)timerOn{
    
    
    UIImageView *star=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star.png"]];
    
    CGFloat x=arc4random()%320;
    CGFloat y=arc4random()%90;
    CGFloat x1=arc4random()%320;
    CGFloat y1=arc4random()%90;

    star.frame=CGRectMake(x, y, 5, 5);
    [msgLabel addSubview:star];
    star.alpha=0;
    [UIView beginAnimations:nil context:star];
    [UIView setAnimationDuration:5];
    star.animationDuration=5;
    [star startAnimating];
    star.alpha=1;
    star.frame=CGRectMake(x1, y1,15 , 15);
    
    [UIView commitAnimations];
    
    [self performSelector:@selector(stopAn:) withObject:star afterDelay:4];
    
    
    
}




//-(void)globAnimation{
//
//
//    
//    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//	//Set some variables on the animation
//	pathAnimation.calculationMode = kCAAnimationPaced;
//	//We want the animation to persist - not so important in this case - but kept for clarity
//	//If we animated something from left to right - and we wanted it to stay in the new position, 
//	//then we would need these parameters
//	pathAnimation.fillMode = kCAFillModeForwards;
//	pathAnimation.removedOnCompletion = NO;
//	pathAnimation.duration = 10;
//	//Lets loop continuously for the demonstration
//	pathAnimation.repeatCount = 1000;
//    
//    CGMutablePathRef pathRef=CGPathCreateMutable();
//    
//    UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectMake(50,1, 30, 30)];
//        
//    
//    
//      
//    
//    CGPathMoveToPoint(pathRef,NULL, 160, 10);
// 
//
//    CGPathAddQuadCurveToPoint(pathRef,NULL,30 ,20 ,20 ,50 );
//    CGPathAddQuadCurveToPoint(pathRef,NULL,30 ,60 ,160 ,70 );
//    CGPathAddQuadCurveToPoint(pathRef, NULL,290 ,60 ,300 ,50 );
//    CGPathAddQuadCurveToPoint(pathRef, NULL,290 ,20 ,160 ,10 );
//    
//    pathAnimation.path=pathRef;
//    
//    
//    
//    
//    NSMutableArray *array=[[NSMutableArray alloc]init ];
//    
//    for(int i=0;i<30;i++){
//    
//        [array addObject:[UIImage imageNamed:[NSString stringWithFormat:@"globe%d",i]]];
//    
//    
//    
//    }
//    
//        
//    image2.animationImages=array;    
//    [image2 setAnimationDuration:3];
//    [image2 startAnimating];
//    
//    [msgLabel addSubview:image2];
//    
//    [image2.layer addAnimation:pathAnimation forKey:@"2"];
//
//
//
//
//
//}
//

//-(void)callURL{
//    
//    
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.millioninone.com"] ]; 
//    
//    
//}


- (void)showMsgWithDelay
{
    //UIView *view = self.view;
 
    
           
        if(view1.frame.origin.y==480){
            
        NSLog(@"%d",flage);
        
        CGRect frame =view1.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:.75];
        
        // Slide up based on y axis
        // A better solution over a hard-coded value would be to
        // determine the size of the title and msg labels and 
        // set this value accordingly
        frame.origin.y = 330;
        view1.frame = frame;
        
        [UIView commitAnimations];}

    
        else if(view1.frame.origin.y==330){
        //con=1;
        
        // Hide the view after the requested delay
        CGRect frame =view1.frame;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:.75];
        
        frame.origin.y = 480;
        view1.frame = frame;
        
        [UIView commitAnimations];
        
        }
    
}


- (void)populateArray1
{
	array1 = [[NSMutableArray alloc] init];
	[array1 addObject:@"Option 7"];
	[array1 addObject:@"Option 8"];
	[array1 addObject:@"Option 9"];
	[array1 addObject:@"Option 10"];
	
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
   // return [Sportarray count];
   
    NSLog(@"%d",component);
    
    if(component==0)
 return [Sportarray count];
 else
    return [arrayData count];
   
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
          
    if(component==0)
return [Sportarray objectAtIndex:row] ;
    else
return [arrayData objectAtIndex:row];  
    }


-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    
    
    //pickerView.backgroundColor=[UIColor redColor];
    
    if(component==0){
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320,45)];
    label.text = [self.Sportarray objectAtIndex:row];
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    
    //[label autorelease];
    
    
        return label;}
    else{
    
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320,45)];
        label.text = [arrayData objectAtIndex:row];
        label.textAlignment = UITextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        
        //[label autorelease];
        
        
        return label;
    }

 
}



#pragma mark pickerview delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
                   
            
       
    
    

            
          //  NSLog(@"you selected a %@", [array1 objectAtIndex:row]);
            
           
      //  [UIView commitAnimations];
   
    // ...
    // Pass the selected object to the new view controller.
  //  [mcvc setTotalRow:row+7];
    
    
    
}

-(void)selectsport:(id)sender{
    
    self.pickerView1.frame=CGRectMake(0, 254, 320, 90);
    [self.pickerView1 becomeFirstResponder];
    pickerView1.showsSelectionIndicator=true;
    
    /*  txtSelectSport.text=@"";
     txtSelectSport.placeholder=@"";
     txtSelectSport.textColor = [UIColor blackColor];
     txtSelectSport.font = [UIFont systemFontOfSize:16.0f];
     [txtGamecode resignFirstResponder];
     [txtTeamName resignFirstResponder];  */
    self.pickerView1.hidden=NO;
    
}




- (void)click:(id)sender {
	[self showHideView]; // Show and hide our imageView in an animated fashion
}

- (void)showHideView {	
	
    
    
    for (int i=4; i>=0; i--) {
        
         
            ComboBoxViewController *cb=[ViewController objectAtIndex:i];    
            //if(returnIndex !=i+1)
            NSLog(@"%d ------>",cb.mainButton.tag);
            // NSLog(@"%d ------> ",returnInd);
        ((UITableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]]).selected=FALSE;
           
             cb.frontLabel.text=@"Select";
                [cb closeAnimation];
                       
            
        }
        

    if (viewVisible) { // If our imageView is on screen hide the view
		[UIView beginAnimations:@"animateImageOff" context:NULL]; // Begin animation
		
        
        [UIView setAnimationDuration:2.5];
        
        imageView.alpha=0.5;
        [imageView setFrame:CGRectOffset([imageView frame], 0, -imageView.frame.size.height)]; 
        
        // Move imageView off screen
		[UIView commitAnimations]; // End animations
		viewVisible = NO;
        
        UIImage *doneImage = [UIImage imageNamed:@"infor.png"]; 
        [doneButton setBackgroundImage:doneImage forState:UIControlStateNormal]; 
        
        
        doneButton.userInteractionEnabled=FALSE;
        self.view.userInteractionEnabled=FALSE;

        [self performSelector:@selector(viewVisible1) withObject:nil afterDelay:2.5];
		
        
        
        
    } else { // if our imageView is off screen show the view
		
        
        
        
        [UIView beginAnimations:@"animateImageOn" context:NULL]; 
        [UIView setAnimationDuration:2.5];
        // Begin animation
		
        imageView.alpha=1;
        [imageView setFrame:CGRectOffset([imageView frame], 0, imageView.frame.size.height)]; // Move imageView on screen
		[UIView commitAnimations]; // End animations
		
        viewVisible = YES;
		//[doneButton setTitle:@"Hide" forState:UIControlStateNormal]; // Change button title to "Hide"
        
        UIImage *doneImage = [UIImage imageNamed:@"hide.png"]; 
       
        
        [doneButton setBackgroundImage:doneImage forState:UIControlStateNormal]; 
        
        doneButton.userInteractionEnabled=FALSE;
        self.view.userInteractionEnabled=FALSE;
        [self performSelector:@selector(viewVisible1) withObject:nil afterDelay:2.5];
       
    }
}


-(void)viewVisible1{
    
   
    
    if(doneButton.userInteractionEnabled==TRUE){
     self.view.userInteractionEnabled=FALSE;
        doneButton.userInteractionEnabled=FALSE;}
    else{
       self.view.userInteractionEnabled=TRUE;
    doneButton.userInteractionEnabled=TRUE;
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self timeActive];
    //[self timerOn];
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    
    
    
    for (int i=4; i>=0; i--) {
        
        { 
            ComboBoxViewController *cb=[ViewController objectAtIndex:i];    
                        NSLog(@"%d ------>",cb.mainButton.tag);
         //   NSLog(@"%d ------> ",returnIndex);
            
         
            cb.frontLabel.text=@"Select";
                [cb closeAnimation];
           
           
            
            
        }
    }
    

    
    
    
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	
    [addTimer invalidate];
    addTimer=nil;
    
    [t invalidate];
    t=nil;
    CGRect frame=view1.frame;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.50];
    
    frame.origin.y = 480;
    view1.frame = frame;
    
    [UIView commitAnimations];
    
    
    [super viewDidDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
/*-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320,45)];
    label.text = [self.Sportarray objectAtIndex:row];
    label.textAlignment = UITextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
   
    //[label autorelease];
   
    
    return label;
}
 */















- (void)drawRect:(CGRect)rect  
{  
    UIImage *image = [UIImage imageNamed:@"top_bar copy.PNG"];  
    
    [image drawInRect:rect];  
}  

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		
		
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease]; 
        
		cell.backgroundView =
        [[[UIImageView alloc] init] autorelease];
		cell.selectedBackgroundView =
        [[[UIImageView alloc] init] autorelease];
        
	}
    
	UIImage *rowBackground;
	UIImage *selectionBackground;
	NSInteger row = [indexPath row];
  	
    
    
    
    if (row == 0)
	{
		rowBackground = [UIImage imageNamed:@"topRow.png"];
		selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
        
        
	}
	else if (row == 5)
	{
        
        
		rowBackground = [UIImage imageNamed:@"bottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
        
        // [cell.contentView addSubview:button];
        
        
    }
	else
	{
		rowBackground = [UIImage imageNamed:@"middleRow.png"];
		selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
        //[cell.contentView addSubview:button];
	}
       
       
    
    ((UIImageView *)cell.imageView).image=(UIImage *)[rowImageArray objectAtIndex:row];
	((UIImageView *)cell.backgroundView).image = rowBackground;
	((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;
	
    NSString *cellValue = [list objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    cell.textLabel.textAlignment=UITextAlignmentLeft; 
    
      
         
    return cell;
}




-(void)addComboBox{



       

    CGFloat y=310;
   
    for(int i=5;i>=1;i--)
    {
        
        
        
        CGFloat x=250;
        comboButton=[[UIButton alloc]initWithFrame:CGRectMake(100, y, 120, 30)];
        
       comboButton.center=CGPointMake(x, y);
        
     comboBox = [[ComboBoxViewController alloc]initWithView: comboButton arrData:arrayData]; 
        
        
        
        
        comboBox.frontImageView.image=[UIImage imageNamed:@"brown-button-1.png"];
        comboBox.mainButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"slidBackImage.png" ]];
        
        comboBox.frontLabel.text=@"Select";
             
        comboBox.mainButton.tag=i;
        
        comboBox.delegate = self;  
        
        
        [ViewController addObject:comboBox];
              
        [self.view addSubview:comboBox];
        
        

        y=y-69;
    
       
    
    }

    
       
    
}



-(void)comboBoxButtonClicked:(NSInteger)returnIndex
{

    
    
    
    
    
    for (int i=4; i>=0; i--) {
        
        { 
        ComboBoxViewController *cb=[ViewController objectAtIndex:i];    
        //if(returnIndex !=i+1)
            NSLog(@"%d ------>",cb.mainButton.tag);
            NSLog(@"%d ------> ",returnIndex);
           
            if(cb.mainButton.tag !=returnIndex)
            { cb.frontLabel.text=@"Select";
                [cb closeAnimation];
                      
                ([self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:cb.mainButton.tag-1 inSection:0]]).selected            
=FALSE;
             
            
            
            }
            
            else{
                ([self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:cb.mainButton.tag-1 inSection:0]]).selected=TRUE;
                
    }
            
            
            
        }
        
        
        
    }










}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{





    
 

}





-(void)comboBoxCellSelected:(NSInteger)returnIndex {
    
    
       
    
    
//((ComboBoxViewController *)[ViewController objectAtIndex:returnIndex]).frontLabel.text=[arrayData objectAtIndex:returnIndex];
    
    
    
    
    
    
   //[comboBox closeAnimation];
         
}	






-(void)addImage{
    
    
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 69;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [t invalidate];
    t=nil;

    
    CGRect frame =view1.frame;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.75];
    
    frame.origin.y = 480;
    view1.frame = frame;
    
    [UIView commitAnimations];

    
    
       [self timeActive];

           UITableViewCell *cell;
        cell=[self.tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"Tuch Begin");
    

   	UIImage *rowBackground;
	UIImage *selectionBackground;
    
    NSInteger row = [indexPath row];
  	
    
    
    
    if (row == 0)
	{
		rowBackground = [UIImage imageNamed:@"topRow.png"];
		selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
        
        
	}
	else if (row == 5)
	{
        
        
		rowBackground = [UIImage imageNamed:@"bottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
        
        // [cell.contentView addSubview:button];
        
        
    }
	else
	{
		rowBackground = [UIImage imageNamed:@"middleRow.png"];
		selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
        //[cell.contentView addSubview:button];
	}
ComboBoxViewController *cb;
if(indexPath.row !=5)
    cb=[ViewController objectAtIndex:4-indexPath.row];
       
    
    if (indexPath.row == 0  ) {
        
               
        if([cb.frontLabel.text isEqualToString:[arrayData objectAtIndex:0]]){
            
            [t invalidate];
            t=nil;

            
            
//            detailViewController = [[Flip_Objects alloc] initWithNibName:@"Flip_Objects" bundle:nil];
//            // ...
//            // Pass the selected object to the new view controller.
//            
//            [self.navigationController pushViewController:detailViewController animated:YES];
//            [detailViewController release];
//            
            
        }
        
               
        else if([cb.frontLabel.text isEqualToString:@"Select"]){
            
            
            
            for (int i=4; i>=0; i--) {
                
                { 
                    ComboBoxViewController *cb=[ViewController objectAtIndex:i];    
                    //if(returnIndex !=i+1)
                    NSLog(@"%d ------>",cb.mainButton.tag);
                    // NSLog(@"%d ------> ",returnInd);
                    
                    if(cb.mainButton.tag !=1)
                    { cb.frontLabel.text=@"Select";
                        [cb closeAnimation];
                    }else
                        [cb openAnimation];
                    
                    
                    
                }
                
                
                
            }

            
        }
        
        else {
            
        }
        
        
             
        
	}
    
    if (indexPath.row == 1) {
        
        
           
    
        if([cb.frontLabel.text isEqualToString:[arrayData objectAtIndex:0] ]){
            
            
            [t invalidate];
            t=nil;

            
//            detailViewController1 = [[Flip_Objects1 alloc] initWithNibName:@"Flip_Objects1" bundle:nil];
//            // ...
//            // Pass the selected object to the new view controller.
//            [self.navigationController pushViewController:detailViewController1 animated:YES];
//            [detailViewController1 release];
//            
            
        }
        
        
       
        
        else if([cb.frontLabel.text isEqualToString:@"Select"]){
            
            
            
            for (int i=4; i>=0; i--) {
                
                { 
                    ComboBoxViewController *cb=[ViewController objectAtIndex:i];    
                    //if(returnIndex !=i+1)
                    NSLog(@"%d ------>",cb.mainButton.tag);
                    // NSLog(@"%d ------> ",returnInd);
                    
                    if(cb.mainButton.tag !=2)
                    { cb.frontLabel.text=@"Select";
                        [cb closeAnimation];
                    }else
                        [cb openAnimation];
                    
                    
                    
                }
                
                
                
            }

            
            
        }
        
        else {
            
        }
        
        

    
    
    
    
    
    
    
    
    
    }
    
    if (indexPath.row == 2) {
        
        
               
    
    
                
        if([cb.frontLabel.text isEqualToString:[arrayData objectAtIndex:0] ]){
            
            
            
            [t invalidate];
            t=nil;

//            
//            detailViewController2 = [[Flip_Objects2 alloc] initWithNibName:@"Flip_Objects2" bundle:nil];
//            // ...
//            // Pass the selected object to the new view controller.
//            [self.navigationController pushViewController:detailViewController2 animated:YES];
//            [detailViewController2 release];
            
            
            
        }
        
        
                else if([cb.frontLabel.text isEqualToString:@"Select"]){
            
            
            for (int i=4; i>=0; i--) {
                
                { 
                    ComboBoxViewController *cb=[ViewController objectAtIndex:i];    
                    //if(returnIndex !=i+1)
                    NSLog(@"%d ------>",cb.mainButton.tag);
                    // NSLog(@"%d ------> ",returnInd);
                    
                    if(cb.mainButton.tag !=3)
                    { cb.frontLabel.text=@"Select";
                        [cb closeAnimation];
                    }else
                        [cb openAnimation];
                    
                    
                    
                }
                
                
                
            }

                       
        }
        
        else {
            
        }
         
    }
    if (indexPath.row == 3) {
        
        
               
        
        
        
        if([cb.frontLabel.text isEqualToString:[arrayData objectAtIndex:0] ]){
            
            [t invalidate];
            t=nil;

            
            
            
//            detailViewController3 = [[Flip_Objects3 alloc] initWithNibName:@"Flip_Objects3" bundle:nil];
//            // ...
//            // Pass the selected object to the new view controller.
//            [self.navigationController pushViewController:detailViewController3 animated:YES];
//            [detailViewController3 release];
            

        }
        
        
               
    }
    
               
    
        
    
      
}



-(void)CallMultiChoiceViewController{
    
  
    
    
    
    
    
    
    [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    
    
    NSInteger rowFromComponent0=[pickerView1 selectedRowInComponent:0];
    NSInteger rowFromComponent1=[pickerView1 selectedRowInComponent:1];
    
    
    if((rowFromComponent0==0 && rowFromComponent1==0) ||(rowFromComponent0==1 && rowFromComponent1==0)||(rowFromComponent0==2 && rowFromComponent1==0)||(rowFromComponent0==3 && rowFromComponent1==0)){
   Multi_ChoiceViewController *mcvc  = [[Multi_ChoiceViewController alloc] init ];
        [mcvc setTotalRow:rowFromComponent0+7];
    [self.navigationController pushViewController:mcvc animated:YES];
  
        [mcvc release];
    }
    
    else {
    
        ChoiceWithPriority  *ch=[[ChoiceWithPriority alloc]init];
        [ch setTotalRow:rowFromComponent0+7];
        [ch setPriorityType:[arrayData  objectAtIndex:rowFromComponent1]];
        
     [self.navigationController pushViewController:ch animated:YES];
   
        [ch release];
    
    }
    
      
}


-(void)dismissActionSheet{
    
    
   
    pickerView1.hidden=TRUE;
    [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
     [UIView commitAnimations];
     [self timeActive];
}








- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    // [list release];
    [list release];
    
    [super dealloc];
}

@end
