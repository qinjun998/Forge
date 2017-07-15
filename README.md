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


