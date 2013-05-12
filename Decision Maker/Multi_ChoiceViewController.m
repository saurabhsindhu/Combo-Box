//
//  Multi_ChoiceViewController.m
//  Multi Choice
//
//  Created by Mac on 22/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Multi_ChoiceViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation Multi_ChoiceViewController


@synthesize detailTableView,selectedIndex,totalRow;

UIImageView *outImage,*inImage;
UILabel *num;
NSTimer *mainTimer,*secondTimer;

UIView *animationView;

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;



- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag>4 ) {
        
        
        
        CGRect viewFrame = detailTableView.frame;
        viewFrame.origin.y += animatedDistance;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [detailTableView setFrame:viewFrame];
        
        [UIView commitAnimations];
    }   
}




-(void)viewDidLoad{
    
    
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
    animationView=[[UIView alloc]initWithFrame:CGRectMake(0, 460, 320, 300)];
    
    
    
    
	NSLog(@"<<< Leaving %s >>>", __PRETTY_FUNCTION__);
    
    doneButton = [UIButton buttonWithType:UIButtonTypeCustom]; 
    UIImage *doneImage = [UIImage imageNamed:@"decide_btn-1.png"]; 
    [doneButton setBackgroundImage:doneImage forState:UIControlStateNormal]; 
    doneButton.frame = CGRectMake(0.0, 400, 53, 33);
    [doneButton addTarget:self action:@selector(decision) forControlEvents:UIControlEventTouchUpInside]; 
    UIBarButtonItem *doneButtonitem = [[UIBarButtonItem alloc] 
                                       initWithCustomView:doneButton] ; 
    self.navigationItem.rightBarButtonItem = doneButtonitem;
    [self.view addSubview: animationView];
    
   // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mulimage.png"]];
    
    
    
    
    detailTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 42*totalRow) style:UITableViewStyleGrouped];
    
       
    [detailTableView setDataSource:self];
    [detailTableView setDelegate:self];
    
    [self.view addSubview:detailTableView];
    detailTableView.scrollEnabled=NO;
    
    [super viewDidLoad];
    
    
    
}

-(NSString *)numToAlpha:(int)num{
    
    
    
    NSString *alpha;
    switch (num) {
        case 1:
            alpha=@"First";
            break;
            
        case 2:
            alpha=@"Second";
            
            break;
            
        case 3:
            alpha=@"Third";
            
            break;
            
        case 4:
            alpha=@"Fourth";
            
            break;
            
        case 5:
            alpha=@"Fifth";
            
            break;
            
        case 6:
            alpha=@"Sixth";
            
            break;
            
        case 7:
            alpha=@"Seventh";
            
            break;
            
        case 8:
            alpha=@"Eighth";
            
            break;
        case 9:
            alpha=@"Ninth";
            
            break;
            
        case 10:
            alpha=@"Tenth";
            
            break;
        default:
            alpha=@"None";
            break;
    }
    
    
    
    
    
    return alpha;
    
    
    
    
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

-(void)decision{
    
    
    
    for(int i=1;i<=totalRow;i++){
        
        [(UITextField *)[[self view]viewWithTag:i] resignFirstResponder];
        
    }
    
    int flage=0,flage1=0;
    
    for(int i=1;i<totalRow;i++){
        
        
        for(int j=i+1;j<totalRow+1;j++){
            
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
    
    
    
    
    
    if (flage1==1) {
        
        
        
        
        
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"" message:@"You need to enter your Options!"              delegate:self cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
        
        
        [alert show];
        [alert release];
        
    }
    else if(flage==1){
        
        
        
        
        
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@""              message:@"Choices entered should be different"                      delegate:self          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
        
        [alert show];
        
        
        [alert release];
        
    }
    
    
    
    
    
    else {
        
        doneButton.hidden=TRUE;
        for(int i=1;i<=totalRow;i++){
            
            ((UITextField *)[[self view]viewWithTag:i] ).userInteractionEnabled=FALSE;
            
        }

        
        CGRect textFieldRect = [self.view.window convertRect:field.bounds fromView:field];
        CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:detailTableView];
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
        
        CGRect viewFrame = detailTableView.frame;
        viewFrame.origin.y -= animatedDistance;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [detailTableView setFrame:viewFrame];
        
        [UIView commitAnimations];
        
                
        outImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1st.png"]];
        
        inImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2nd.png"]];
        
        CGRect rect=CGRectMake(80,0,150,150);
        
        
        
        animationView.frame=CGRectMake(0, 250, 320, 300);
        
        [self.view addSubview:animationView];
        
        
        outImage.frame=rect;
        
        
        
        
        inImage.frame=rect;
        num=[[UILabel alloc]initWithFrame:rect];
        num.textAlignment=UITextAlignmentCenter;
        num.backgroundColor=[UIColor clearColor];
        
        num.alpha=1;
        [num setFont:[UIFont fontWithName:@"Arial" size:70]];
        inImage.alpha=0.4;
        
        [animationView addSubview:outImage];
        [animationView addSubview:inImage];
        [animationView addSubview:num];
        animationView.hidden=FALSE;
        outImage.hidden=FALSE;
        inImage.hidden=FALSE;
        num.hidden=FALSE;
        mainTimer=    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
        
        secondTimer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(onTimerNum) userInfo:nil repeats:YES];
        
        
    }
    
    
    
    
}

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
    
    for(int i=1;i<=totalRow;i++){
        
        [(UITextField *)[[self view]viewWithTag:i] resignFirstResponder];
        
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    //register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)        name:UIKeyboardWillShowNotification object:self.view.window]; 
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
      [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil]; 
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 36;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return totalRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    tableView.backgroundColor = [UIColor clearColor];
    tableView.opaque = NO;
    tableView.backgroundView = nil;
    
    
	if (cell == nil)
	{
		
		cell =
        [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
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
		selectionBackground = [UIImage imageNamed:@"topRow.png"];
	}
	else if (row == totalRow-1)
	{
		rowBackground = [UIImage imageNamed:@"bottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"bottomRow.png"];
	}
	else
	{
		rowBackground = [UIImage imageNamed:@"middleRow.png"];
		selectionBackground = [UIImage imageNamed:@"middleRow.png"];
	}
	((UIImageView *)cell.backgroundView).image = rowBackground;
	((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;
	
    
    
    
    field = [[UITextField alloc]initWithFrame:CGRectMake(30,7,260,36)];
	field.borderStyle = UITextBorderStyleNone;
    [field addTarget:self 
              action:@selector(editingEnded:) 
    forControlEvents:UIControlEventEditingDidEndOnExit]; 
    [field setTag:indexPath.row+1];

    [field setDelegate:self];
    field.textAlignment = UITextAlignmentCenter;
    [field setReturnKeyType:UIReturnKeyDone]; 
      
  field.placeholder = [NSString stringWithFormat:@"Enter %@ Choice",[self numToAlpha:indexPath.row+1]];
    field.textColor = [UIColor grayColor];
    
    [cell addSubview:field];
    
        
    return cell;
}

-(void)backButtonPressed{
    
    
    [mainTimer invalidate];
    mainTimer=nil;
    [secondTimer invalidate];
    secondTimer=nil;
    
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField.tag>4) {
        
        
        CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
        CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:detailTableView];
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
        
        CGRect viewFrame = detailTableView.frame;
        viewFrame.origin.y -= animatedDistance;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [detailTableView setFrame:viewFrame];
        
        [UIView commitAnimations];
    }
}



-(void)onTimerNum{
    
    
    
    
    static int count=0;
    int r=arc4random()%totalRow+1;
    num.text=[NSString stringWithFormat:@"%d",r];
    if(count>=(arc4random()%10+10))
    {    
        
        
        
        count=0;
        
        
        
        if(mainTimer!=nil && [mainTimer isValid]==TRUE && secondTimer!=nil && [secondTimer isValid]==TRUE){
            
            
           
            
            [mainTimer invalidate];
            mainTimer=nil;
            [secondTimer invalidate];
            secondTimer=nil;
            num.transform=CGAffineTransformMakeScale(0.1,0.1);
            num.alpha=0.3;
            
            [UIView beginAnimations:nil context:nil];  
            [UIView setAnimationDuration:0.5];
            
            num.alpha=1;
            
            
            
            num.transform=CGAffineTransformIdentity;    
            
            
            [UIView commitAnimations];
            
           
            
            UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"  Congratulation!!! The decision made is..." message:[(UITextField *)[[self view]viewWithTag:r] text] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            
            UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(7, 13, 40, 40)];
            
            NSString *path = [[NSString alloc] initWithString:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"PINBALL.png"]];
            UIImage *bkgImg = [[UIImage alloc] initWithContentsOfFile:path];
            [imageView1 setImage:bkgImg];
            [bkgImg release];
            [path release];
            
            [successAlert setTag:1];
            [successAlert addSubview:imageView1];
            [imageView1 release];
            
            
            [successAlert show];
            [successAlert release];

            doneButton.hidden=FALSE;
            for(int i=1;i<=totalRow;i++){
                
                ((UITextField *)[[self view]viewWithTag:i] ).userInteractionEnabled=TRUE;
                
            }

        }
        
        
        
    }else
        
    {
        
        
        count++;
        
        num.transform=CGAffineTransformMakeScale(0.1,0.1);
        num.alpha=0.3;
        [UIView beginAnimations:nil context:nil];  
        [UIView setAnimationDuration:0.5];
        
        num.alpha=1;
        
         doneButton.enabled = NO;
        
        num.transform=CGAffineTransformIdentity;    
        
        
        [UIView commitAnimations];
        
        
        
    }
    
    
    
}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    
    if(alertView.tag==1){
        
        doneButton.enabled = YES;
        
        CGRect viewFrame = detailTableView.frame;
        viewFrame.origin.y += animatedDistance;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [detailTableView setFrame:viewFrame];
        
        [UIView commitAnimations];
        
        
        
        animationView.hidden=TRUE;
        outImage.hidden=TRUE;
        inImage.hidden=TRUE;
        num.hidden=TRUE;
        
    }
    
    
    
    
}


-(void)onTimer{
    
    
    inImage.transform=CGAffineTransformConcat(inImage.transform, CGAffineTransformMakeRotation(-0.10));
    
    
    outImage.transform=CGAffineTransformConcat(outImage.transform, CGAffineTransformMakeRotation(0.10));
    
    
    
}






- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
