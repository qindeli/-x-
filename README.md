# DLCircleProgessView
![](https://github.com/qindeli/DLCircleProgessView/raw/master/截图.png)


<br>
 * 初始化
```
DLCircleProgessView *circleProgessView = [[DLCircleProgessView alloc] initWithFrame:CGRectMake(30, 60, 300, 300)];
```

* 设置进度条颜色
```
circleProgessView.fillLineColor = [UIColor redColor];
```

* 设置当前值大小，默认是0
```
circleProgessView.value = 30;
```

* 设置最大值,默认是100
```
circleProgessView.maximumValue = 100;
```

* 添加到视图上
```
[self.view addSubview:circleProgessView];
```
