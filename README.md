# Forge
常用的小案例太多，一直存放在本地，有时间就把有用的上传一点


- QQPageViewController

用PageViewController实现的项目的分页tab显示，代码的侵入性太强，每次都拷贝粘贴太多代码，现在集中到一个文件里，方便调用

![Alt text](https://github.com/qinjun998/Forge/blob/master/images/PageVC.gif)



- 使用方法1

覆盖父类方法，设置数据源

- (NSMutableArray *)contentVCs{

    NSMutableArray * _contentVCs =  [super contentVCs];
    
    [_contentVCs addObject:[ZZKPage1VC new]];
    
    [_contentVCs addObject:[ZZKPage2VC new]];
    
    [_contentVCs addObject:[ZZKPage3VC new]];
    
    return _contentVCs;
}

- (NSMutableArray *)tabTitles{

    NSMutableArray * _tabTitles =  [super tabTitles];
    
    _tabTitles =[@[@"参与",@"发布",@"收藏"] mutableCopy];
    
    return _tabTitles;
}

- 使用方法2

viewDidLoad方法中在[super viewDidLoad]之前初始化数据源

    self.tabTitles =  [@[@"参与",@"发布",@"收藏"] mutableCopy];
    
    [self.contentVCs addObject:[ZZKPage1VC new]];
    
    [self.contentVCs addObject:[ZZKPage2VC new]];
    
    [self.contentVCs addObject:[ZZKPage3VC new]];

    [super viewDidLoad];


## QQUITextFieldDatePicker

点击TextField弹出日期等选择看起来是个简单的工作，实际操作过程中实际上问题非常多，比如多个输入框的识别、和键盘处理的冲突、键盘状态的确定和取消。每个问题都很麻烦，每次做这个东西都让人头大的。
这个问题的解决方案的代码侵入性非常高高，几乎没有重用性。所以需要用更简单的办法，本来说这个问题应该用继承自定义控价来解决的，可是用Category看起来更加简洁。这个案例里用一个单一的类别解决了这个问题。

- **这个类别导入之后，使用起来代码就一行

![Alt text](https://github.com/qinjun998/Forge/blob/master/images/dataPicker.gif)

```OC
   self.begin.datePickerInput = YES;
   self.end.datePickerInput = YES;
```
