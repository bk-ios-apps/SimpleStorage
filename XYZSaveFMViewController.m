//
//  XYZSaveFMViewController.m
//  SimpleStorage
//
//  Created by bipul on 4/21/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import "XYZSaveFMViewController.h"

@interface XYZSaveFMViewController ()
{
    NSString *dataFile;
    NSString *archiveFile;
    NSFileManager *fileManager;
}
@end

@implementation XYZSaveFMViewController
@synthesize bookName, bookAuthor, bookDescription;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    fileManager = [[NSFileManager alloc] init];
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = dirPaths[0];
    dataFile = [docsDir stringByAppendingPathComponent:@"datafile.dat"];
    archiveFile = [docsDir stringByAppendingPathComponent: @"archive.dat"];
    NSLog(@" %@",dataFile);
    //loading data from File if it exists.
    /*
    if([fileManager fileExistsAtPath:dataFile]){
        NSLog(@"file exists.");
        NSError *error = nil;
        NSString  *content = [NSString stringWithContentsOfFile:dataFile encoding:NSStringEncodingConversionAllowLossy error:&error];
        NSArray *myArray = [content componentsSeparatedByString:@"\n"];
        bookName.text = [myArray objectAtIndex:0];
        bookAuthor.text = [myArray objectAtIndex:1];
        bookDescription.text = [myArray objectAtIndex:2];
    }
    */
    //loading data from Archive if it exists.
    if([fileManager fileExistsAtPath:archiveFile ]){
        NSMutableArray *dataAry = [[NSMutableArray alloc] init];
        dataAry = [NSKeyedUnarchiver unarchiveObjectWithFile:archiveFile];
        bookName.text = [dataAry objectAtIndex:0];
        bookAuthor.text = [dataAry objectAtIndex:1];
        bookDescription.text = [dataAry objectAtIndex:2];
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveFileManager:(id)sender {
    NSString *temp = @"";
    NSError *error = nil;
    NSData *fileData = [[NSData alloc] init];
    temp = [temp stringByAppendingFormat:@"%@\n%@\n%@",bookName.text,bookAuthor.text,bookDescription.text];
    NSLog(@"temp%@",temp);
    fileData = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [fileManager createFileAtPath:dataFile contents:fileData attributes:nil];
    if (error) {
        NSLog(@"There is an Error: %@", error);
    }else {
        // If the file doesn't exists, log it.
        NSLog(@"File  doesn't exists");
    }
}

- (IBAction)saveArchive:(id)sender {
    NSMutableArray *dataAry = [[NSMutableArray alloc] init];
    [dataAry addObject:bookName.text];
    [dataAry addObject:bookAuthor.text];
    [dataAry addObject:bookDescription.text];
    [NSKeyedArchiver archiveRootObject:dataAry toFile:archiveFile];
}

-(void)backgroundTouchedHideKeyboard:(id)sender
{
    [bookName resignFirstResponder];
    [bookAuthor resignFirstResponder];
    [bookDescription resignFirstResponder];
}

@end
