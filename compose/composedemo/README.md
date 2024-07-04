# Compose
- [Compose 官方文档](https://developer.android.com/jetpack/compose)

## 一、Compose 核心概念
### 1、声明式 UI 构建
> 在 Compose 中，UI 是通过一系列的 @Composable 函数来声明的。这意味着你描述 UI 应该是什么样子，而 Compose
这与传统的 Android 视图系统（如 XML 布局）有很大不同，后者需要你明确地修改 UI 的各个部分以达到期望的状态。

### 2. @Composable 注解
> *  作用：此注解用于标记一个函数，使其能够构建 UI。只有被 @Composable 注解的函数才能调用其他 @Composable 函数。
*  函数约束：@Composable 函数应该专注于 UI 的渲染。它们不应包含复杂的业务逻辑或进行网络请求和数据库操作。

### 3. 组合与重用
> *  组合：通过在一个 @Composable 函数中调用其他 @Composable 函数，你可以创建复杂的 UI。这种组合方式让 UI 的组件化和复用变得非常自然。

### 4.状态管理
> * 基础：在 Compose 中，状态是被定义为可以导致 UI 重新绘制的任何数据。当状态发生变化时，Compose 会自动重新调用相应的 @Composable 函数以更新 UI。
* 使用 State：使用 mutableStateOf 和 remember 管理状态，并保持 UI 的响应性。

### 5.生命周期意识
> * 重组：Compose UI 可以根据状态的改变进行智能重组，只更新需要变更的部分而不是整个 UI 树。
* 性能优化：理解 Compose 的重组机制可以帮助你优化性能，避免不必要的计算和渲染。

##  二、基础布局
### 1、Column
> * Column 用于垂直排列其子元素。你可以通过 verticalArrangement 参数来控制子元素之间的间距和整体的对齐方式。
```kotlin
@Composable
fun ColumnExample() {
    Column(
        modifier = Modifier.padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        Text("First Item")
        Text("Second Item")
        Text("Third Item")
    }
}
```

### 2、Row
> 与 Column 类似，Row 用于水平排列其子元素。通过 horizontalArrangement 参数可以控制子元素的排列方式。
```kotlin
@Composable
fun RowExample() {
    Row(
        modifier = Modifier.padding(16.dp),
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        Text("Left")
        Text("Center")
        Text("Right")
    }
}
```

### 3、Box
> Box 允许你在三维空间内重叠组件，即一个组件可以覆盖在另一个组件上面。这非常适合创建覆盖效果，如放置一个文本标签在图片上。
```kotlin
@Composable
fun BoxExample() {
    Box(modifier = Modifier.size(100.dp, 100.dp)) {
        Text("Underneath", Modifier.align(Alignment.BottomStart))
        Button(onClick = { /* Do something */ }, Modifier.align(Alignment.TopEnd)) {
            Text("On Top")
        }
    }
}
```

### 4、Spacer
> Spacer 是一个用于在组件之间添加空间的简单工具。它没有内容，只占用指定的空间。
```kotlin
@Composable
fun SpacerExample() {
    Column {
        Text("Top Text")
        Spacer(modifier = Modifier.height(20.dp))
        Text("Bottom Text")
    }
}
```

### 5、Surface
> Surface 是一个带有背景颜色的矩形容器，可以用来添加阴影、圆角和其他效果。
```kotlin
@Composable
fun SurfaceExample() {
    Surface(
        color = Color.Blue,
        shape = RoundedCornerShape(8.dp),
        elevation = 4.dp,
        modifier = Modifier.padding(16.dp)
    ) {
        Text("Hello, World!")
    }
}
```

### 6、ScrollableColumn
> ScrollableColumn 是一个可以滚动的 Column。当 Column 中的内容超出屏幕时，用户可以滚动以查看剩余的内容。
```kotlin
@Composable
fun ScrollableColumnExample() {
    ScrollableColumn {
        repeat(50) {
            Text("Item $it")
        }
    }
}
```

### 7、LazyColumn
> LazyColumn 是一个性能优化的列表组件，它只会渲染当前可见的部分。这使得 LazyColumn 适用于大型数据集。
```kotlin
@Composable
fun LazyColumnExample() {
    LazyColumn {
        items(100) {
            Text("Item $it")
        }
    }
}
```

### 8、LazyRow
> LazyRow 是一个横向滚动的列表组件，它只会渲染当前可见的部分。
```kotlin
@Composable
fun LazyRowExample() {
    LazyRow {
        items(100) {
            Text("Item $it")
        }
    }
}
```

### 9、BoxWithConstraints
> BoxWithConstraints 是一个可以获取到其尺寸的容器组件。你可以使用它来根据容器的尺寸来调整子元素的大小。
```kotlin
@Composable
fun BoxWithConstraintsExample() {
    BoxWithConstraints {
        Text("Width: $maxWidth, Height: $maxHeight")
    }
}
```

### 10、ConstraintLayout
> ConstraintLayout 是一个强大的布局组件，它允许你通过约束来定义子元素的位置。这使得 ConstraintLayout 非常适合复杂的 UI 布局。
```kotlin
@Composable
fun ConstraintLayoutExample() {
    ConstraintLayout {
        val (button1, button2, button3) = createRefs()

        Button(onClick = { /* Do something */ }, modifier = Modifier.constrainAs(button1) {
            top.linkTo(parent.top)
            start.linkTo(parent.start)
        }) {
            Text("Button 1")
        }

        Button(onClick = { /* Do something */ }, modifier = Modifier.constrainAs(button2) {
            top.linkTo(button1.bottom)
            start.linkTo(parent.start)
        }) {
            Text("Button 2")
        }

        Button(onClick = { /* Do something */ }, modifier = Modifier.constrainAs(button3) {
            top.linkTo(button2.bottom)
            start.linkTo(parent.start)
        }) {
            Text("Button 3")
        }
    }
}
```

### 11、Padding 和 Size
> * Padding：通过 padding 参数可以为组件添加内边距。
* Size：通过 size 参数可以设置组件的大小。
```kotlin
@Composable
fun PaddingAndSizeExample() {
    Text(
        "Hello, World!",
        modifier = Modifier.padding(16.dp).size(100.dp)
    )
}
```
### 12、Flexibility with Modifiers
> * Modifier 是一个用于修改组件的工具。你可以使用 Modifier 来设置组件的大小、位置、颜色、形状等。
* 常用 Modifier：Modifier.padding、Modifier.size、Modifier.background、Modifier.clickable、Modifier.fillMaxSize、Modifier.align、Modifier.offset 等。

####  1. 尺寸和布局
*  size: 设置组件的固定尺寸。
*  fillMaxWidth/fillMaxHeight: 让组件填充可用的最大宽度或高度。
*  width/height: 设置组件的宽度或高度。
*  padding: 添加内边距。
*  offset: 移动组件的位置。
```kotlin
@Composable
fun ModifierExample() {
    Text(
        "Hello, World!",
        modifier = Modifier
            .padding(all = 8.dp)
            .width(200.dp)
            .height(50.dp)
    )
}
```
#### 2. 背景和形状
*  background: 设置背景颜色或背景形状。
*  border: 添加边框。
*  clip: 裁剪组件的形状。
*  shape: 设置组件的形状。
```kotlin
@Composable
fun AppearanceExample() {
    Text(
        "Hello, World!",
        modifier = Modifier
            .background(Color.LightGray)
            .border(2.dp, Color.Black)
            .clip(RoundedCornerShape(4.dp))
    )
}
```

#### 3. 交互和动画
*  clickable: 为组件添加点击事件。
*  draggable: 为组件添加拖动事件。
*  focusable: 为组件添加焦点。
*  pointerInput: 为组件添加指针事件。
*  scrollable: 添加滚动行为。
```kotlin
@Composable
fun InteractionExample() {
    var text by remember { mutableStateOf("Hello, World!") }

    Text(
        text,
        modifier = Modifier
            .clickable { text = "Clicked!" }
            .draggable { delta -> /* Do something */ }
            .focusable()
            .pointerInput(Unit) {
                detectTapGestures { /* Do something */ }
            }
    )
}
```

#### 4. 性能优化
* graphicsLayer: 允许硬件加速的图层变换。
* alpha: 设置透明度。
```kotlin
@Composable
fun PerformanceExample() {
    Image(
        painter = painterResource(id = R.drawable.example_image),
        contentDescription = null,
        modifier = Modifier.graphicsLayer(alpha = 0.5f)
    )
}
```
#### 5、链式调用
```kotlin
@Composable
fun ModifierExample() {
    Text(
        "Hello, World!",
        modifier = Modifier
            .padding(16.dp)
            .size(100.dp)
            .background(Color.Blue)
            .clickable { /* Do something */ }
            .fillMaxSize()
            .align(Alignment.Center)
            .offset(10.dp, 10.dp)
    )
}
```

## 三、基础组件
### 1、Text
> Text 用于显示文本。你可以通过 style 参数来设置文本的样式。
```kotlin
@Composable
fun TextExample() {
    Text(
        text = "Hello, World!",
        style = TextStyle(
            color = Color.Black,
            fontSize = 16.sp,
            fontWeight = FontWeight.Bold
        )
    )
}
```
### 2、Button
> Button 是一个可点击的按钮组件。你可以通过 onClick 参数来设置按钮的点击事件。
```kotlin
@Composable
fun ButtonExample() {
    Button(onClick = { /* Do something */ }) {
        Text("Click Me")
    }
}
```

### 3、TextField
> TextField 是一个用于输入文本的输入框组件。你可以通过 value 和 onValueChange 参数来控制输入框的值。
```kotlin
@Composable
fun TextFieldExample() {
    var text by remember { mutableStateOf("") }

    TextField(
        value = text,
        onValueChange = { text = it },
        label = { Text("Enter your name") }
    )
}
```

### 4、Checkbox
> Checkbox 是一个复选框组件。你可以通过 checked 和 onCheckedChange 参数来控制复选框的状态。
```kotlin
@Composable
fun CheckboxExample() {
    var checked by remember { mutableStateOf(false) }

    Checkbox(
        checked = checked,
        onCheckedChange = { checked = it },
        label = { Text("Check me") }
    )
}
```

### 5、RadioButton
> RadioButton 是一个单选按钮组件。你可以通过 selected 和 onSelectedChange 参数来控制单选按钮的状态。
```kotlin
@Composable
fun RadioButtonExample() {
    var selected by remember { mutableStateOf("") }

    Column {
        RadioButton(
            selected = selected == "A",
            onClick = { selected = "A" },
            label = { Text("Option A") }
        )
        RadioButton(
            selected = selected == "B",
            onClick = { selected = "B" },
            label = { Text("Option B") }
        )
    }
}
```
### 6、Slider
> Slider 是一个滑块组件。你可以通过 value 和 onValueChange 参数来控制滑块的值。
```kotlin
@Composable
fun SliderExample() {
    var value by remember { mutableStateOf(0f) }

    Slider(
        value = value,
        onValueChange = { value = it },
        valueRange = 0f..100f
    )
}
```

### 7、ProgressBar
> ProgressBar 是一个进度条组件。你可以通过 progress 参数来控制进度条的进度。
```kotlin
@Composable
fun ProgressBarExample() {
    var progress by remember { mutableStateOf(0.5f) }

    LinearProgressIndicator(progress = progress)
}
```
### 8、CircularProgressIndicator
> CircularProgressIndicator 是一个圆形进度条组件。你可以通过 progress 参数来控制进度条的进度。
```kotlin
@Composable
fun CircularProgressIndicatorExample() {
    var progress by remember { mutableStateOf(0.5f) }

    CircularProgressIndicator(progress = progress)
}
```
### 9、Image
> Image 是一个用于显示图片的组件。你可以通过 painter 参数来设置图片。
```kotlin
@Composable
fun ImageExample() {
    Image(
        painter = painterResource(id = R.drawable.image),
        contentDescription = "Image"
    )
}
```
### 10、Icon
> Icon 是一个用于显示图标的组件。你可以通过 imageVector 参数来设置图标。
```kotlin
@Composable
fun IconExample() {
    Icon(
        imageVector = Icons.Default.Favorite,
        contentDescription = "Favorite"
    )
}
```
### 11、Divider
> Divider 是一个用于分割组件的分割线。你可以通过 color 和 thickness 参数来设置分割线的颜色和厚度。
```kotlin
@Composable
fun DividerExample() {
    Divider(color = Color.Black, thickness = 1.dp)
}
```
### 12、Snackbar
> Snackbar 是一个用于显示消息的组件。你可以通过 actionLabel 和 onActionClick 参数来设置消息的操作。
```kotlin
@Composable
fun SnackbarExample() {
    var snackbarVisible by remember { mutableStateOf(false) }

    if (snackbarVisible) {
        Snackbar(
            action = {
                Button(onClick = { snackbarVisible = false }) {
                    Text("Dismiss")
                }
            }
        ) {
            Text("Hello, World!")
        }
    }
}
```
### 13、Dialog
> Dialog 是一个用于显示对话框的组件。你可以通过 onDismissRequest 参数来设置对话框的关闭事件。
```kotlin
@Composable
fun DialogExample() {
    var dialogVisible by remember { mutableStateOf(false) }

    if (dialogVisible) {
        AlertDialog(
            onDismissRequest = { dialogVisible = false },
            title = { Text("Title") },
            text = { Text("Message") },
            confirmButton = {
                Button(onClick = { dialogVisible = false }) {
                    Text("OK")
                }
            }
        )
    }
}
```
### 14、BottomSheet
> BottomSheet 是一个底部抽屉组件。你可以通过 sheetState 参数来控制抽屉的状态。
```kotlin
@Composable
fun BottomSheetExample() {
    val sheetState = rememberModalBottomSheetState(ModalBottomSheetValue.Hidden)

    ModalBottomSheetLayout(sheetState = sheetState) {
        Button(onClick = { sheetState.show() }) {
            Text("Show Bottom Sheet")
        }
    }
}
```

### 15、TopAppBar
> TopAppBar 是一个顶部应用栏组件。你可以通过 title 和 navigationIcon 参数来设置应用栏的标题和导航图标。
```kotlin
@Composable
fun TopAppBarExample() {
    TopAppBar(
        title = { Text("Title") },
        navigationIcon = {
            IconButton(onClick = { /* Do something */ }) {
                Icon(Icons.Default.ArrowBack, contentDescription = "Back")
            }
        }
    )
}
```

### 16、Card
> Card 是一个卡片组件。你可以通过 content 参数来设置卡片的内容。
```kotlin
@Composable
fun CardExample() {
    Card(
        modifier = Modifier.padding(8.dp),
        elevation = 4.dp
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text("Card Title", style = MaterialTheme.typography.h6)
            Text("Card content goes here.")
        }
    }
}

```

### 17、FloatingActionButton
> FloatingActionButton 是一个浮动操作按钮组件。你可以通过 onClick 参数来设置按钮的点击事件。
```kotlin
@Composable
fun FloatingActionButtonExample() {
    FloatingActionButton(onClick = { /* 处理点击事件 */ }) {
        Icon(Icons.Filled.Add, contentDescription = "Add")
    }
}
```

### 18、Switch
> Switch 是一个开关组件。你可以通过 checked 和 onCheckedChange 参数来控制开关的状态。
```kotlin
@Composable
fun SwitchExample() {
    var checked by remember { mutableStateOf(false) }

    Switch(
        checked = checked,
        onCheckedChange = { checked = it },
        colors = SwitchDefaults.colors(checkedThumbColor = Color.Green)
    )
}
```

## 四、主题与样式
### 1、MaterialTheme
> MaterialTheme 是一个用于设置应用主题的组件。你可以通过 colors、typography 和 shapes 参数来设置主题的颜色、字体和形状。
```kotlin
@Composable
fun AppTheme(content: @Composable () -> Unit) {
    MaterialTheme(
        colors = lightColors(
            primary = Color.Blue,
            secondary = Color.Green,
            onPrimary = Color.White
        ),
        typography = Typography(
            body1 = TextStyle(fontFamily = FontFamily.Serif, fontSize = 16.sp)
        ),
        shapes = Shapes(
            small = RoundedCornerShape(4.dp),
            medium = RoundedCornerShape(8.dp),
            large = RoundedCornerShape(16.dp)
        )
    ) {
        content()
    }
}

```
### 2、颜色系统
> Material Design 颜色系统包括主色、辅助色、表面颜色、背景颜色、错误颜色等。
常见颜色属性
primary：主要颜色，用于应用栏、按钮等。
secondary：次要颜色，用于强调小部件。
background：背景颜色。
surface：表面颜色，用于卡片、抽屉等。
onPrimary、onSecondary：分别用于在主要和次要颜色上显示的文本或图标颜色。
```kotlin
@Composable
fun ColorExample() {
    Column {
        Surface(color = MaterialTheme.colors.primary) {
            Text("Primary Color", color = MaterialTheme.colors.onPrimary)
        }
        Surface(color = MaterialTheme.colors.secondary) {
            Text("Secondary Color", color = MaterialTheme.colors.onSecondary)
        }
        Surface(color = MaterialTheme.colors.surface) {
            Text("Surface Color", color = MaterialTheme.colors.onSurface)
        }
        Surface(color = MaterialTheme.colors.background) {
            Text("Background Color", color = MaterialTheme.colors.onBackground)
        }
        Surface(color = MaterialTheme.colors.error) {
            Text("Error Color", color = MaterialTheme.colors.onError)
        }
    }
}
```

### 3、类型排印
> Typography 是一个用于设置字体样式的组件。你可以通过 h1、h2、h3、body1、body2 等参数来设置不同类型的文本样式。
```kotlin
val AppTypography = Typography(
    h1 = TextStyle(fontWeight = FontWeight.Bold, fontSize = 30.sp),
    body1 = TextStyle(fontWeight = FontWeight.Normal, fontSize = 16.sp),
    button = TextStyle(fontWeight = FontWeight.Bold, fontSize = 14.sp)
)
```
### 4、形状
> 形状用于定义 UI 组件的边角，如卡片的圆角。通过 Shapes 类，你可以统一定义小、中、大三种尺寸的形状。
```kotlin
val AppShapes = Shapes(
    small = RoundedCornerShape(4.dp),
    medium = RoundedCornerShape(8.dp),
    large = RoundedCornerShape(16.dp)
)
```

## 5、状态管理
### 1、remember 和 mutableStateOf
> remember 是一个用于保存状态的工具。它可以帮助你在组件重组时保持状态的一致性。mutableStateOf 是一个用于创建可变状态的工具。
```kotlin
@Composable
fun Counter() {
    var count by remember { mutableStateOf(0) }

    Button(onClick = { count++ }) {
        Text("Count is $count")
    }
}
```
### 2、 State Hoisting（状态提升）
> 状态提升是一种将状态从子组件提升到父组件的技术。这样可以使得状态在多个组件之间共享。
```kotlin
@Composable
fun ControlledCounter(count: Int, onCountChange: (Int) -> Unit) {
    Button(onClick = { onCountChange(count + 1) }) {
        Text("Count is $count")
    }
}

@Composable
fun Parent() {
    var count by remember { mutableStateOf(0) }
    ControlledCounter(count = count, onCountChange = { count = it })
}
```
### 3、使用 LiveData 或 Flow
> 你可以使用 LiveData 或 Flow 来管理状态。通过 observeAsState() 或 collectAsState()，你可以将 LiveData 或 Flow 转换为 Compose 可以使用的状态。
```kotlin
@Composable
fun LiveDataExample() {
    val count = remember { mutableStateOf(0) }

    val liveData = remember { MutableLiveData(0) }
    val liveDataCount by liveData.observeAsState()

    val flow = flow { emit(0) }
    val flowCount by flow.collectAsState()

    Button(onClick = { count.value++ }) {
        Text("Count is ${count.value}")
    }
}

@Composable
fun UserView(model: UserModel) {
    val userData by model.userData.observeAsState()

    Text("User name is ${userData?.name}")
}

class UserModel : ViewModel() {
    private val _userData = MutableLiveData<User>()
    val userData: LiveData<User> = _userData

    init {
        // 假设加载用户数据
        _userData.value = User(name = "Alice")
    }
}

```

## 6、测试
### 1、单元测试
> Compose 提供了一套用于测试 UI 的工具。你可以使用 @Preview 注解来预览 UI，使用 @ComposableTest 注解来测试 UI。
```kotlin
@get:Rule
val composeTestRule = createComposeRule()

@Test
fun testButtonShowsProperly() {
    composeTestRule.setContent {
        Button(onClick = {}) {
            Text("Click Me")
        }
    }

    composeTestRule.onNodeWithText("Click Me").assertIsDisplayed()
}
```




