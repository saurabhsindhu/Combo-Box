//
//  ChoiceWithPriority.m
//  Decision Maker
//
//  Created by cis on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ChoiceWithPriority.h"
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@implementation ChoiceWithPriority
//BOOL stop=FALSE;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

int b[15];

@synthesize uiTableView,dataArray,totalRow,slateImage,priorityType,stop;







-(void)editingEnded:(id)sender{
    [sender resignFirstResponder]; 
}

-(void) keyboardWillShow:(NSNotification *) note {
    
    doneButton.enabled = NO;
    
    [self.view addGestureRecognizer:tapRecognizer];
    
    
}

-(void) keyboardWillHide:(NSNotification *) note
{
    doneButton.enabled = YES;
    
    [self.view removeGestureRecognizer:tapRecognizer];
}

-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {    
    
    for(int i=totalRow;i<=totalRow+totalRow;i++){
        
        
               [(UITextField *)[[self view]viewWithTag:i] resignFirstResponder];
        
        NSLog(@"%@",[(UITextField *)[[self view]viewWithTag:i] text]);
        
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    //register for keyboard notifications
    
    CGFloat tableBorderLeft ;
    CGFloat tableBorderRight ;
    CGFloat tableBorderTop;

   
    if(totalRow<7){
    tableBorderLeft =15;
     tableBorderRight = 65;
       tableBorderTop=7;
    }else{
    
        tableBorderLeft =17;
        tableBorderRight = 12;
        tableBorderTop=8;

    
    }
   
    
    
    CGRect tableRect = self.view.frame;
    tableRect.origin.x += tableBorderLeft; // make the table begin a few pixels right from its origin
    tableRect.size.width -= tableBorderLeft + tableBorderRight; // reduce the width of the table
    
   
    tableRect.origin.y=tableBorderTop;
    uiTableView.frame = tableRect;
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)        name:UIKeyboardWillShowNotification object:self.view.window]; 
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil]; 
}







-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

static NSString *cellIdentifier=@"cell"; 


  // [a addObject:[NSNumber numberWithInt:indexPath.row] ];
       
       UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        
        cell.backgroundView =
        [[[UIImageView alloc] init] autorelease];
		cell.selectedBackgroundView =
        [[[UIImageView alloc] init] autorelease];
        

		
    }
    
    
    
    b[indexPath.row]=indexPath.row;
    
    	UIImage *rowBackground;
	//UIImage *selectionBackground;
	//NSInteger row = [indexPath row];
	
	/*if (row == 0)
	{
		rowBackground = [UIImage imageNamed:@"topRow.png"];
		selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
	}
	else if (row == totalRow-1)
	{
		rowBackground = [UIImage imageNamed:@"bottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
	}
	else
	{*/
		rowBackground = [UIImage imageNamed:@"cellBack1.png"];
		//
    
    
    //selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
	//}
    
    
    
    //cell.backgroundColor=[UIColor clearColor];
    
	((UIImageView *)cell.backgroundView).image = rowBackground;
    
	//((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;
	

    
    
        
    
    
    
    
    
    BOOL checked=FALSE;
    
   
    
    
     cell.textLabel.backgroundColor=[UIColor clearColor];
     
    
    UIImage *image = (checked) ? [UIImage imageNamed:@"check1.png"] : [UIImage imageNamed:@"uncheck1.png"];
    
    NSMutableDictionary *item=[[NSMutableDictionary alloc]init];
    
    
    [item setObject:cell forKey:@"cell"];
    [item setObject:[NSNumber numberWithBool:!checked]  forKey:@"checked"];
    
    [dataArray addObject:item];
    UIButton *btn=nil;  
    if(self.totalRow <7)
        btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30,30 )];
    else
   btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25,25 )];  
  
    [btn setTag:indexPath.row ];
    
    [btn addTarget:self action:@selector(checkButtonTapped:event:) forControlEvents:UIControlEventTouchUpInside];
    
  
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    cell.accessoryView =btn;
    
    field = [[[UITextField alloc]initWithFrame:CGRectMake(30,7,350,36)] retain];
	field.borderStyle = UITextBorderStyleNone;
    [field addTarget:self 
              action:@selector(editingEnded:) 
    forControlEvents:UIControlEventEditingDidEndOnExit]; 
    [field setTag:indexPath.row+totalRow];
    
    
    
    [field setDelegate:self];
    field.textAlignment = UITextAlignmentLeft;
    [field setReturnKeyType:UIReturnKeyDone]; 
    
    //field.placeholder = [NSString stringWithFormat:@"Enter %d Choice",indexPath.row+1];//[self numToAlpha:indexPath.row+1]];
    field.textColor = [UIColor grayColor];
    
     
    if([priorityType isEqualToString:@"Quick Desicion"]){
    
    
        [field setEnabled:FALSE];
    field.placeholder = [NSString stringWithFormat:@" %@ Choice",[self numToAlpha:indexPath.row+1]];
    
    }
    else{
    
    
    field.placeholder = [NSString stringWithFormat:@"Enter %@ Choice",[self numToAlpha:indexPath.row+1]];
    }
    
    
    
    
    [cell addSubview:field];
    
    

    return  cell;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return 1;
} 

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    return nil;


}




- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField.tag>=totalRow) {
        
        
        CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
        
        
        
        
        CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.uiTableView];
       
               
        
        
        
        CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
       
        
        
        CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
        
       
        
        CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
        
        
        
        
        
        CGFloat heightFraction = numerator / denominator;
        
        if (heightFraction < 0.0)
        {
            heightFraction = 0.0;
        }
        else if (heightFraction > 1.0)
        {
            heightFraction = 1.0;
        }
        UIInterfaceOrientation orientation =[[UIApplication sharedApplication] statusBarOrientation];
        if (orientation == UIInterfaceOrientationPortrait ||
            orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
            
        }
        else
        {
            animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
        }
        
        CGRect viewFrame = self.uiTableView.frame;
        viewFrame.origin.y -= animatedDistance;
        
        CGRect viewFrame1 = self.slateImage.frame;
        viewFrame1.origin.y -= animatedDistance;
        

        
        
        
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [self.uiTableView setFrame:viewFrame];
        [self.slateImage setFrame:viewFrame1];
        
        [UIView commitAnimations];
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag>=totalRow ) {
        
        
        
        CGRect viewFrame = self.uiTableView.frame;
        viewFrame.origin.y += animatedDistance;
        CGRect viewFrame1 = self.slateImage.frame;
        viewFrame1.origin.y += animatedDistance;
        

        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [self.uiTableView setFrame:viewFrame];
        [self.slateImage setFrame:viewFrame1];

        [UIView commitAnimations];
    }   
}





-(NSString *)numToAlpha:(int)num{
    
    
    
    NSString *alpha;
    switch (num) {
        case 1:
            alpha=@"1st";
            break;
            
        case 2:
            alpha=@"2nd";
            
            break;
            
        case 3:
            alpha=@"3rd";
            
            break;
            
        case 4:
            alpha=@"4th";
            
            break;
            
        case 5:
            alpha=@"5th";
            
            break;
            
        case 6:
            alpha=@"6th";
            
            break;
            
        case 7:
            alpha=@"7th";
            
            break;
            
        case 8:
            alpha=@"8th";
            
            break;
        case 9:
            alpha=@"9th";
            
            break;
            
        case 10:
            alpha=@"10th";
            
            break;
        default:
            alpha=@"None";
            break;
    }
    
    
    
    
    
    return alpha;
    
    
    
    
}









-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
if(totalRow<7)
     return 50;
else
     return 36;
}


-(void)checkButtonTapped:(id)sender event:(id)event
{

    UIButton *bt=(UIButton *)sender;
 
    
    if (bt != nil)
        {
                  
        
        
            NSMutableDictionary *item = [dataArray objectAtIndex:bt.tag];
            
            BOOL checked = [[item objectForKey:@"checked"] boolValue];
            
            [item setObject:[NSNumber numberWithBool:!checked] forKey:@"checked"];
            
            
            
            UITableViewCell *cell = [item objectForKey:@"cell"];
            
            UIButton *but1 = (UIButton *)cell.accessoryView;
            
                       
            UIImage *newImage = (checked) ? [UIImage imageNamed:@"check1.png"] : [UIImage imageNamed:@"uncheck1.png"];
            [but1 setBackgroundImage:newImage forState:UIControlStateNormal];
        
        
        
        
                
        
        
        
        
        }
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{



    return totalRow;

}









- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}




- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  
    
          
    dateLable =[[UILabel alloc]initWithFrame:CGRectMake(12, 10, 250, 30)];
    
    [dateLable setFont:[UIFont fontWithName:@"Georgia-BoldItalic" size:20]];  
    dateLable.backgroundColor=[UIColor clearColor];
    

    
    [self.view addSubview:dateLable];

    
    slateImage.image=[UIImage imageNamed:@"slate2"];//[NSString stringWithFormat:@"slate%d",totalRow ]];
    
   
    if(totalRow<7 )
    {  slateImage.frame=CGRectMake(10, 10, 250,totalRow*50+20);
      
        
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"wallBack1.png"]];
    }
    else
    {
        
    slateImage.frame=CGRectMake(10, 10, 300,totalRow*36+20);
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"wallBack2.png"]];
    }
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom]; 
    UIImage *backImage = [UIImage imageNamed:@"maker_btn.png"]; 
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal]; 
    backButton.frame = CGRectMake(0.0, 0.0, 116, 33);
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside]; 
    UIBarButtonItem *backButtonitem = [[UIBarButtonItem alloc] 
                                       initWithCustomView:backButton] ; 
    self.navigationItem.leftBarButtonItem = backButtonitem;
    

    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
    
    
    doneButton = [UIButton buttonWithType:UIButtonTypeCustom]; 
    UIImage *doneImage = [UIImage imageNamed:@"decide_btn-1.png"]; 
    
    [doneButton setBackgroundImage:doneImage forState:UIControlStateNormal]; 
    doneButton.frame = CGRectMake(0.0, 0.0, 53, 33);
    [doneButton addTarget:self action:@selector(getResulte) forControlEvents:UIControlEventTouchUpInside]; 
    
    
    UIBarButtonItem *doneButtonitem = [[UIBarButtonItem alloc] 
                                       initWithCustomView:doneButton] ; 
    self.navigationItem.rightBarButtonItem = doneButtonitem;
    
    doneButton.enabled = YES;
 
    //   NSString *path = [[NSBundle mainBundle] pathForResource:@"CheckMark" ofType:@"plist"];
	//self.dataArray = [NSMutableArray arrayWithContentsOfFile:path];
    self.dataArray = [[NSMutableArray alloc]init];
       
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    stop=FALSE;
}



-(void)backButtonPressed{
    
      
    stop=TRUE;
    
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)getResulte{

int flage=0,flage1=0;
    
    
    
    
    
    if([priorityType isEqualToString:@"Set Priority"]){

       
    for(int i=totalRow;i<=totalRow+totalRow;i++){
        
        [(UITextField *)[[self view]viewWithTag:i] resignFirstResponder];
        
    }
    
    
    
    for(int i=totalRow;i<totalRow+totalRow-1;i++){
        
        
        for(int j=i+1;j<totalRow+totalRow;j++){
            
            if([((UITextField *)[[self view]viewWithTag:i]).text length]==0 || [((UITextField *)[[self view]viewWithTag:j]).text length]==0){
                
                flage1=1;
                break;
            }
            if([[[self removeSpace:[(UITextField *)[[self view]viewWithTag:i] text]]uppercaseString ]isEqualToString:[[self removeSpace:[(UITextField *)[[self view]viewWithTag:j] text]]uppercaseString]]){
                
                
                flage=1;
                break; 
            }
            
            
            
            
        }
        
        
        
    }
    
    
    }
    else{
    
        flage1=0;
        flage=0;
    
    
    
    
    
    
    
    
    
    
    
    }
    
    
    if (flage1==1) {
        
        
        
        
        
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"" message:@"You need to enter your Options!"              delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
        
        
        [alert show];
        [alert release];
        
    }
    else if(flage==1){
        
        
        
        
        
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@""              message:@"Choices entered should be different"                      delegate:self          cancelButtonTitle:@"OK"otherButtonTitles:nil];
        
        [alert show];
        
        
        [alert release];
        
    }
    
    
    
    
    
    else {

    
    
        doneButton.hidden=TRUE;
       // for(int i=totalRow;i<(totalRow+totalRow);i++){
                     //  ((UITextField *)[[self view]viewWithTag:i] ).enabled=FALSE;
            
      //  }

    
   NSMutableArray *selVal=[[NSMutableArray alloc]init];
    
    NSLog(@"%d", dataArray.count);


    for(int i=0;i<dataArray.count;i++){
    
        NSMutableDictionary *item=[dataArray objectAtIndex:i];
        
        
        NSLog(@"%d", [[item objectForKey:@"checked"] boolValue]);
        
        if([[item objectForKey:@"checked"] boolValue]==FALSE  ){
        
            
            [selVal addObject:[NSNumber numberWithInt:i]];    
            
            
            
            
        
        }
           }





    ViewController *vc=[[ViewController alloc]init];
    
    NSMutableArray *finalResulte=[vc priority:dataArray.count highPriorty:selVal];

        [vc release];  
    
    const int max=[finalResulte count];   
    int a[max];
       

    
    for(int i=0;i<finalResulte.count;i++){
       
              
        a[i]=[[finalResulte objectAtIndex:i] intValue];
      //  b[i]=i;
        NSLog(@"%d   %d   ",a[i],b[i]);
            
    }
    
        
        float dealy=0;
    
    for(int i=0;i<finalResulte.count;i++){
          
        
        for(int j=i;j<finalResulte.count;j++)
          {
          
            
              
              
              NSLog(@"%d   %d    %d   %d",a[i],a[j],b[i],b[j]);
              
              if(b[j]==a[i]){
              
                  int tmp=b[i];
                  b[i]=b[j];
                  b[j]=tmp;
                  
                 // sleep(5);
                  
                  [self performSelector:@selector(swapRowSource:) withObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:b[i]],[NSNumber numberWithInt:b[j]], nil] afterDelay:dealy];
                 
                  
                  dealy=dealy+.5;
                  
                  
                  
                  
                  //[self swapRowSource:b[i] destination:b[j]];
                  
                               
                  NSLog(@"%d   %d    %d   %d",a[i],a[j],b[i],b[j]);
              
                  break;
              }
              
         
                   
        }

      
     }
              
              
              
    }              
}


-(NSString *)removeSpace:(NSString *)str{
    
    int index1,index2;
    NSString *str1;
    int i=0;
    
    while ([str characterAtIndex:i]==32) {
        
        i++;
        if([str length]==i){
            
            return @"";
            
        }
        
        
    }
    
    NSLog(@"%d",i);
    index1=i;
    
    str1= [str substringFromIndex:index1];
    i=[str1 length]-1;
    
    
    while ([str1 characterAtIndex:i]==32) {
        i--;
    }
    index2=i;
    
    
    NSLog(@"%c",[str characterAtIndex:index2]);
    str1= [str1 substringToIndex:index2+1];
    
    return str1;
    
}






-(void)swapRowSource:(NSArray *)path{ 
         
         
    int source=[[path objectAtIndex:0]intValue];
    int destination=[[path objectAtIndex:1]intValue];
       
       
    static int count=0;
    
           
            
        
    if(count == dataArray.count-1){
    
    
        count=0;
        
        
        [self performSelector:@selector(resulte) withObject:nil afterDelay:0.5];
              
            
    
    }
    else{
    count++;    
        
     
        NSMutableDictionary *item=[dataArray objectAtIndex:source];    
        
        NSMutableDictionary *item1=[dataArray objectAtIndex:destination];
        
        
        UITableViewCell *sCell=[item objectForKey:@"cell"];
        UITableViewCell *dCell= [item1 objectForKey:@"cell"];
        
        CGRect sFrame=sCell.frame;
        CGRect dFrame=dCell.frame;
        
             [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        
        sCell.frame=dFrame; 
        
        
        
        
        
        
        sCell.layer.shadowColor = [[UIColor blackColor] CGColor];
        
        sCell.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
        
        sCell.layer.shadowOpacity =5.0f;
        
        sCell.layer.shadowRadius = 10.0f;
        
        
        
        
        
        dCell.frame=sFrame;
        
        
        
        dCell.layer.shadowColor = [[UIColor blackColor] CGColor];
        
        dCell.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
        
        dCell.layer.shadowOpacity =5.0f;
        
        dCell.layer.shadowRadius = 10.0f;
        
        
        [UIView commitAnimations];
        
   
        
        
    
       [self performSelector:@selector(cellNormal:) withObject:sCell afterDelay:0.5]; 
        
     
        [self performSelector:@selector(cellNormal:) withObject:dCell afterDelay:0.5]; 
        
     
    }    

       
    
    
    }



-(void)resulte{


    if(stop == FALSE){
        
       UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Congratulation!!!\nYour Priortized Decision has been made" message:@"Do You Want to Save Decision in Photo Library" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil ];
       
        NSDate* date = [NSDate date];
    
        //Create the dateformatter object
    
        NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    
    //Set the required date format
    
        [formatter setDateFormat:@"yyyy-MM-dd  HH:MM:SS"];
    
    //Get the string date
    
        NSString* str = [formatter stringFromDate:date];
    

        
        CGRect datelabel=dateLable.frame;
        datelabel.origin.y=slateImage.frame.size.height+10;
        
        
        dateLable.frame=datelabel;
    
    dateLable.text=str;
        [dateLable release];  
    
    //Display on the console
    

    
    
    
    [successAlert show];
    
    [successAlert release];
    
doneButton.hidden=FALSE;
    
        
     //   for(int i=totalRow;i<(totalRow+totalRow);i++){
        
         //            ((UITextField *)[[self view]viewWithTag:i] ).enabled=TRUE;
            
   
    // }
     
     
      }



}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{


    if(buttonIndex!=alertView.cancelButtonIndex){
    
    
    
          UIGraphicsBeginImageContext(([[UIScreen mainScreen] bounds]).size );
            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
        
    
    
    }







}





-(void)cellNormal:(UITableViewCell *)cell{


    cell.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    cell.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    cell.layer.shadowOpacity =0.0f;
    
    cell.layer.shadowRadius = 0.0f;
      
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    
    int  verson=[[[UIDevice currentDevice] systemVersion]intValue];
    if(verson<5){
        
    
        
        [uiTableView release];
        [slateImage release];
        [dataArray release];
       
        
        [field release];
        [doneButton release]; 
        [tapRecognizer release];
        
    
        [priorityType release];   
    

    
    
    
    }

    
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
