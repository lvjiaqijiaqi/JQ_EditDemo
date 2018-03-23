//
//  JQ_TextEdit.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/22.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "JQ_TextEdit.h"

#import "JQ_AttributeModel.h"
#import "JQ_AttachementModel.h"
#import "JQ_TextAttributeStorage+Json.h"

#import "JQ_TextStorage.h"

#import "EditColorMenu.h"
#import "EditFontMenu.h"
#import "EditStyleMenu.h"
#import "EditMenu.h"
#import "EditImageMenu.h"

#import "UIColor+HEXString.h"

typedef NS_ENUM(NSInteger, JQ_TextEditInputType) {
    JQ_TextEditInputTypeKeyNone,
    JQ_TextEditInputTypeKeyBoard,
    JQ_TextEditInputTypeStyleEdition,
    JQ_TextEditInputTypeAttachmentInsert,
};

@interface JQ_TextEdit()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,NSTextStorageDelegate>

@property(nonatomic,strong) EditMenu *editMenu;
@property(nonatomic,strong) UIView *fontEditInputView;
@property(nonatomic,strong) EditImageMenu *editImageInputView;

@property(nonatomic,strong) NSArray<EditGroupMenu *> *editGroupsMenus;

@property(nonatomic,assign) JQ_TextEditInputType textEditInputType;

@property(nonatomic,strong) JQ_TextStorage *textStorage;
@property(nonatomic,strong) JQ_TextAttributeStorage *attributeStorage;
@property(nonatomic,strong) JQ_AttributeModel *currentAttributeModel;

@end

@implementation JQ_TextEdit

#pragma mark - 组件懒加载

-(EditImageMenu *)editImageInputView{
    if (!_editImageInputView) {
        _editImageInputView = [[EditImageMenu alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 100, CGRectGetWidth(self.view.frame), 100)];
        _editImageInputView.menu = @[@"cameraIconNormal",@"imageIconNormal"];
        __weak typeof(self) weakSelf = self;
        _editImageInputView.selectHandle = ^(NSInteger index) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
            imagePicker.delegate = weakSelf;
            if (index == 0) {
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePicker.allowsEditing = NO;
            }else if (index == 1){
                 imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
            [weakSelf presentViewController:imagePicker animated:YES completion:nil];
        };
    }
    return _editImageInputView;
}

-(UITextView *)textView{
    if (!_textView) {
        _textStorage = [[JQ_TextStorage alloc] init];
        _textStorage.delegate = self;
        self.attributeStorage = [[JQ_TextAttributeStorage alloc] init];
        _textStorage.textAttributeStorage = self.attributeStorage;
        
        NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
        [_textStorage addLayoutManager: layoutManager];
        
        NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeZero];
        [layoutManager addTextContainer: textContainer];
        
        _textView = [[UITextView alloc] initWithFrame:self.view.frame textContainer:textContainer];
        _textView.editable = YES;
        _textView.scrollEnabled = YES;
        _textView.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5);
        _textView.inputView = nil;
    }
    return _textView;
}

-(EditMenu *)editMenu{
    if (!_editMenu) {
        UIWindow *window =[[UIApplication sharedApplication].delegate window];
        _editMenu = [[EditMenu alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 34, CGRectGetWidth(window.frame), 34)];
        _editMenu.menu = @[@"pullDownIcon",@"keyboardIconNormal",@"fontIconNormal",@"imageIconNormal",@"dateIconNormal",@"addressIconNormal"];
        __weak typeof(self) weakSelf = self;
        _editMenu.selectHandle = ^(NSInteger index) {
            if (index == 0) {
                if ([weakSelf.textView isFirstResponder]) {
                    [weakSelf.textView resignFirstResponder];
                }else{
                    [weakSelf.textView becomeFirstResponder];
                }
            }
            if(index == 1) {
                if (weakSelf.textEditInputType != JQ_TextEditInputTypeKeyBoard) {
                    weakSelf.textView.inputView = nil;
                    [weakSelf.textView reloadInputViews];
                    weakSelf.textEditInputType = JQ_TextEditInputTypeKeyBoard;
                    weakSelf.attributeStorage.editAttribute = [weakSelf.currentAttributeModel copyModel];
                }
                if (![weakSelf.textView isFirstResponder]) {
                    [weakSelf.textView becomeFirstResponder];
                }
            };
            if(index == 2) {
                if (weakSelf.textEditInputType != JQ_TextEditInputTypeStyleEdition) {
                    weakSelf.textView.inputView = [weakSelf fontEditInputView];
                    [weakSelf.textView reloadInputViews];
                    weakSelf.textEditInputType = JQ_TextEditInputTypeStyleEdition;
                }
                if (![weakSelf.textView isFirstResponder]) {
                    [weakSelf.textView becomeFirstResponder];
                }
            }
            if (index == 3) {
                if (weakSelf.textEditInputType != JQ_TextEditInputTypeAttachmentInsert) {
                    weakSelf.textView.inputView = [weakSelf editImageInputView].view;
                    [weakSelf.textView reloadInputViews];
                    weakSelf.textEditInputType = JQ_TextEditInputTypeAttachmentInsert;
                }
                if (![weakSelf.textView isFirstResponder]) {
                    [weakSelf.textView becomeFirstResponder];
                }
                /*UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                imagePicker.delegate = weakSelf;
                [weakSelf presentViewController:imagePicker animated:YES completion:nil];*/
            }
        };
    }
    return _editMenu;
}

-(UIView *)fontEditInputView{
    if (!_fontEditInputView) {
        __weak typeof(self) weakSelf = self;
        UIWindow *window =[[UIApplication sharedApplication].delegate window];
        _fontEditInputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(window.frame), 220)];
        
        EditFontMenu *fontMenu = [[EditFontMenu alloc] initWithFrame:CGRectMake(0, 70, CGRectGetWidth(window.frame), 70)];
        fontMenu.menu = @[@"9",@"11",@"13",@"15",@"17",@"19",@"21",@"23",@"25",@"27",@"29",@"31"];
        [fontMenu setTitle:@"字体大小"];
        fontMenu.selectHandle = ^(NSInteger fontSize) {
            weakSelf.currentAttributeModel.fontSize = fontSize;
        };
        
        EditColorMenu *colorMenu = [[EditColorMenu alloc] initWithFrame:CGRectMake(0, 140, CGRectGetWidth(window.frame), 70)];
        colorMenu.menu = @[@"Black",@"Red",@"Blue",@"Green",@"Yellow",@"Gray",@"SkyBlue",@"Auqamarin"];
        [colorMenu setTitle:@"字体颜色"];
        colorMenu.selectHandle = ^(NSString *color) {
            weakSelf.currentAttributeModel.fontColor = color;
        };
        
        EditGroupMenu *styleMenu = [[EditStyleMenu alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(window.frame), 70)];
        styleMenu.menu = @[@"boldIConNormal",@"italiqueIconNormal",@"alignLeftIconNormal",@"alignCenterIconNormal",@"alignRightIconNormal"];
        [styleMenu setTitle:@"字体样式"];
        
        [_fontEditInputView addSubview:fontMenu.view];
        [_fontEditInputView addSubview:colorMenu.view];
        [_fontEditInputView addSubview:styleMenu.view];
        _fontEditInputView.backgroundColor = [UIColor whiteColor];
        self.editGroupsMenus = @[styleMenu,fontMenu,colorMenu];
        
    }
    return _fontEditInputView;
}

-(void)initConpnent{
    [self.view addSubview:self.textView];
    [self.view addSubview:self.editMenu.view];
    self.textView.contentInset = UIEdgeInsetsMake(0, 0, 400, 0);
    self.currentAttributeModel = [[JQ_AttributeModel alloc] init];
}

#pragma mark - 控制器生命周期

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initConpnent];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doSome)];
}

-(void)doSome{
    NSLog(@"%@",[self.attributeStorage parse]);
}

- (void)viewWillAppear:(BOOL)animated
{
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillShowOrHide:) name:UIKeyboardWillShowNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillShowOrHide:) name:UIKeyboardWillHideNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillShowOrHide:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [super viewWillDisappear: animated];
}

#pragma mark - 键盘事件处理

- (void)keyboardWillShowOrHide:(NSNotification *)notification
{
    if ([notification.name isEqualToString:@"UIKeyboardWillShowNotification"] || [notification.name isEqualToString:@"UIKeyboardWillHideNotification"] || [notification.name isEqualToString:@"UIKeyboardWillChangeFrameNotification"]) {
        CGFloat newY;
        newY = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
        newY = [self.view convertPoint:CGPointMake(0, newY) fromView:nil].y;
        self.editMenu.view.frame = CGRectMake(0, newY - CGRectGetHeight(self.editMenu.view.frame), CGRectGetWidth(self.editMenu.view.frame), CGRectGetHeight(self.editMenu.view.frame));
    }
}

#pragma mark - 插入图片处理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage]; //通过key值获取到图片
    [self editViewInsertImage:image];
}

-(void)editViewInsertImage:(UIImage *)image{
    JQ_AttachementModel *attachmentModel =  [[JQ_AttachementModel alloc] init];
    CGSize imageSize = image.size;
    CGFloat ratio = 1;
    if (imageSize.width > self.textView.contentSize.width - 20) {
        ratio = (self.textView.contentSize.width - 20) / imageSize.width;
    }
    attachmentModel.image = image;
    attachmentModel.size = CGSizeMake(imageSize.width * ratio, imageSize.height * ratio);

    NSInteger loction = self.textView.selectedRange.location;
    id<JQ_AttributeModelDelegate> preModel = self.attributeStorage.editAttribute;
    self.attributeStorage.editAttribute = attachmentModel;
    NSAttributedString *text = [NSAttributedString attributedStringWithAttachment:[[NSTextAttachment alloc] init]];
    [self.textStorage insertAttributedString:text atIndex:loction];
    
    self.attributeStorage.editAttribute = preModel;
    [self.textView setSelectedRange:NSMakeRange(self.textStorage.length + 1, 0)];
    [self.textView becomeFirstResponder];
    
}

-(void)textStorage:(NSTextStorage *)textStorage didProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta{
    //NSLog(@"%@",NSStringFromCGSize(self.textView.contentSize));
}

@end
