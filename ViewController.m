//
//  ViewController.m
//  Priority
//
//  Created by Mac on 13/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
//#import <QuartzCore/QuartzCore.h>
#import "QuartzCore/QuartzCore.h"

@implementation ViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad{




    [super viewDidLoad];


}




-(NSMutableArray *)priority:(int)maxVal highPriorty:(NSMutableArray *)highPre {
    
    
      
   //[self.view addSubview:tabView];
    
   const int max=maxVal;
    
      
    NSLog(@"\nValue Is %d",max);
    int a[max];
    int count=0,flage=0;
    
    
    
    while(count!=max){
    
        //NSLog(@"\nValue Is %d",count);
      
        
        int r=arc4random()%max;
            
    if(highPre.count>0 && count==0){
        
           
        int index=0;
        for(index=0;index < highPre.count ;){
     
            
            NSLog(@"--------------------%d",[[highPre objectAtIndex:index] intValue]);
           if(index==highPre.count-arc4random()%highPre.count)
               break;
                            
             for(int j=0;j< highPre.count;j++){
               
                 r=arc4random()%max;
                 NSLog(@"\nValue Is %d",r);

                 
            if([[highPre objectAtIndex:j] intValue]==r){
                
                for(int i=0;i<= count;i++){
                    
                                         
                                         
                            if(a[i]==r){
                        
                                flage=1;
                                break;
                        
                        
                            }else{
                                flage=0;
                            }
                    }
                
                  if(flage!=1){
                    
                    a[count]=r;
                    count++;
                    index++;
                    flage=0;
                    
                        }
                
                     }  
                
                    }
               
          }
        
        }  
        
        for(int i=0;i<= count;i++){
            
            NSLog(@"\nValue Is %d",r);

            if(a[i]==r){
            
                flage=1;
                break;
            
            
            }else{
                    flage=0;
            }
        }
    
    
    
    
        if(flage!=1){
        
            a[count]=r;
            count++;
            flage=0;
        
        }
    
    
    }
    
    

    
    NSLog(@"--------------------------------------\n\n\n");
    NSMutableArray *retArr=[[NSMutableArray alloc]init];   
    for(int i=0;i<count ;i++)
    {        
        [retArr addObject:[NSNumber numberWithInt:a[i]]];     
    NSLog(@"\n Final Value Is %d",a[i]);
    }
   
   

    return retArr;


}



  

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations

    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
