# Forge
常用的小案例太多，一直存放在本地，有时间就把有用的上传一点


- QQPageViewController

用PageViewController实现的项目的分页tab显示，代码的侵入性太强，每次都拷贝粘贴太多代码，现在集中到一个文件里，方便调用

![Alt text](https://github.com/qinjun998/Forge/blob/master/images/PageVC.gif)



- 使用方法1

覆盖父类方法，设置数据源
```OC
- (NSMutableArray *)contentVCs{
    NSMutableArray * _contentVCs =  [super contentVCs];  //super
    [_contentVCs addObject:[ZZKPage1VC new]];
    [_contentVCs addObject:[ZZKPage2VC new]];
    [_contentVCs addObject:[ZZKPage3VC new]];
    return _contentVCs;
}

- (NSMutableArray *)tabTitles{
    NSMutableArray * _tabTitles =  [super tabTitles];  //super
    _tabTitles =[@[@"参与",@"发布",@"收藏"] mutableCopy];
    return _tabTitles;
}
```

- 使用方法2

viewDidLoad方法中在[super viewDidLoad]之前初始化数据源

```OC
    self.tabTitles =  [@[@"参与",@"发布",@"收藏"] mutableCopy];
    [self.contentVCs addObject:[ZZKPage1VC new]];
    [self.contentVCs addObject:[ZZKPage2VC new]];
    [self.contentVCs addObject:[ZZKPage3VC new]];
    [super viewDidLoad];
```

## QQUITextFieldDatePicker

点击TextField弹出日期等选择看起来是个简单的工作，实际操作过程中实际上问题非常多，比如多个输入框的识别、和键盘处理的冲突、键盘状态的确定和取消。每个问题都很麻烦，每次做这个东西都让人头大。
这个问题的解决方案的代码侵入性非常高，几乎没有重用性。所以需要用更简单的办法.按理本来说这个问题应该用自定义控件的继承来解决的，可是用Category看起来更加简洁。这个案例里用一个单一的类别解决了这个问题。

- TextField+DatePicker类别导入之后，使用起来代码只有一行即可实现功能。同理你可以在此基础上实现性别、输入数字等其他功能


```OC
   self.begin.datePickerInput = YES;
   self.end.datePickerInput = YES;
```

![Alt text](https://github.com/qinjun998/Forge/blob/master/images/dataPicker.gif)


## RuntimeDemo

Runtime的一些应用

<img width="200" height="350" src="https://github.com/qinjun998/Forge/blob/master/images/runtime1.png"/>


## 标尺
网上找的一个标尺/刻度尺例子。为了便于使用，进行了cell改造

Cell使用方式

```OC
YSYRulerCell *cell=[tableView dequeueReusableCellWithIdentifier:[YSYRulerCell cellReuseIdentifier] forIndexPath:indexPath];
[cell initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kRulerCellHeight-10) theMinValue:0 theMaxValue:100 theStep:2 theUnit:@"" theNum:5];
```

![Alt text](https://github.com/qinjun998/Forge/blob/master/images/biaochi.gif)

## 进度条

项目中使用的第三方的一个进度条，因为移动时缺乏动画效果，自己又重新手写了一个进度条。这个没有用的就传上来给需要的人

![Alt text](https://github.com/qinjun998/Forge/blob/master/images/progressView.gif)


## 旋转动画
一个无限旋转动画，可控制其暂停、继续操作。
全部动画代码封装到一个类别UIImageView+Rotation.h中使用

![Alt text](https://github.com/qinjun998/Forge/blob/master/images/xuanzhuan.gif)

## 数字选择
单独封装成一个YSYNumberPickerView，使用覆盖数据源pickerDataSource，然后从resultValue获得选取的值

```OC
#import "YSYNumberPickerView.h"

@property(nonatomic,assign) NSInteger resultValue;
@property(nonatomic,strong) NSArray  *pickerDataSource;

```


![Alt text](https://github.com/qinjun998/Forge/blob/master/images/numberpicker.gif)


## 连续旋转和缩放

![Alt text](https://github.com/qinjun998/Forge/blob/master/images/xuanzhuansuofang.gif)