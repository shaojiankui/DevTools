//
//  ToolsListViewController.m
//  DevTools
//
//  Created by Jakey on 2017/10/9.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "ToolsListViewController.h"
#import "ToolsListItem.h"

#import "GUIDViewController.h"
@interface ToolsListViewController ()<NSCollectionViewDelegate,NSCollectionViewDataSource,NSCollectionViewDelegateFlowLayout>
{
    NSArray *_lists;
    
}
@end

@implementation ToolsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    _lists = @[@{@"name":@"GUID",@"detail":@"GUID生成",@"icon":@"",@"ViewController":@"GUIDViewController",@"star":@(NO)},
               @{@"name":@"JSON格式化",@"detail":@"JSON格式化，美化，压缩",@"icon":@"json.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"JavaScript工具",@"detail":@"js美化、解压缩、混淆",@"icon":@"javascript.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"CSS工具",@"detail":@"css美化、格式化、压缩",@"icon":@"css.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"PHP工具",@"detail":@"php美化、格式化、解密",@"icon":@"php.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"java工具",@"detail":@"java代码在线美化",@"icon":@"java.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"html工具",@"detail":@"html美化、格式化、压缩",@"icon":@"html.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"正则测试工具",@"detail":@"正则表达式测试工具",@"icon":@"regex.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"sql工具",@"detail":@"sql美化，格式化，压缩",@"icon":@"sql.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"ruby工具",@"detail":@"ruby代码美化",@"icon":@"ruby.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"python工具",@"detail":@"pyc文件反编译,python美化、格式化",@"icon":@"python.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"图片base64编码",@"detail":@"图片base64编码",@"icon":@"",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"进制转换",@"detail":@"常用进制转换工具",@"icon":@"",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"时间戳转换",@"detail":@"在线时间戳转换",@"icon":@"time.png",@"ViewController":@"",@"star":@(NO)},
               @{@"name":@"HTML转Markdown",@"detail":@"HTML转Markdown",@"icon":@"markdown.png",@"ViewController":@"",@"star":@(NO)},

               ];
    self.collectionView.wantsLayer = YES;
    self.collectionView.backgroundColors = @[[NSColor clearColor]];
    [self.collectionView reloadData];
    
    // Watch for changes to the CollectionView's selection, just so we can update our status display.
//    [self.collectionView addObserver:self forKeyPath:@"selectionIndexPaths" options:0 context:NULL];

}
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    if (object == self.collectionView && [keyPath isEqual:@"selectionIndexPaths"]) {
//
//        /*
//         We're being notified that our imageCollectionView's
//         "selectionIndexPaths" property has changed.  Update our status
//         TextField with a summary (item count) of the new selection.
//         */
//        NSSet<NSIndexPath *> *newSelectedIndexPaths = self.collectionView.selectionIndexPaths;
//
//    }
//}
- (IBAction)segmentControlClicked:(id)segmentControl{
    NSInteger index = [segmentControl selectedSegment];
}


-(NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_lists count];
}
- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath{
    ToolsListItem *item =  [collectionView makeItemWithIdentifier:@"ToolsListItem" forIndexPath:indexPath];
    [item congfigCell:[_lists objectAtIndex:indexPath.item]];
    return item;
}
- (void)collectionView:(NSCollectionView *)collectionView didSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths{
    [collectionView deselectItemsAtIndexPaths:indexPaths];
    NSIndexPath *indexPath = [[indexPaths allObjects] firstObject];
    id info =  [_lists objectAtIndex:indexPath.item];
    NSString *className =  [info objectForKey:@"ViewController"];
    
    if (className.length>0) {
        Class c = NSClassFromString(className);
        [self presentViewControllerAsModalWindow:[[c alloc]init]];
    }

}
#define COLLECTION_SPACE 8.0
#define COLLECTION_COUNT 4

-(NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (collectionView.bounds.size.width - (COLLECTION_SPACE *(COLLECTION_COUNT+1))) / COLLECTION_COUNT;
    return NSMakeSize(width, 100);
}
- (NSEdgeInsets)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return NSEdgeInsetsMake(COLLECTION_SPACE, COLLECTION_SPACE, COLLECTION_SPACE, COLLECTION_SPACE);
}
- (CGFloat)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return COLLECTION_SPACE;
}
//- (CGFloat)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 10;
//}
@end
