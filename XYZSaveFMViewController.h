//
//  XYZSaveFMViewController.h
//  SimpleStorage
//
//  Created by bipul on 4/21/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZSaveFMViewController : UIViewController
{
    UITextField *bookName;
    UITextField *bookAuthor;
    UITextField *bookDescription;
}

@property (strong, nonatomic) IBOutlet UITextField *bookName;
@property (strong, nonatomic) IBOutlet UITextField *bookAuthor;
@property (strong, nonatomic) IBOutlet UITextField *bookDescription;

- (IBAction)saveFileManager:(id)sender;
- (IBAction)saveArchive:(id)sender;
- (IBAction)backgroundTouchedHideKeyboard:(id)sender;


@end
