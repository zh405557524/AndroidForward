package com.soul.composedemo

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/**
 * Description: 文字显示
 * Author: 祝明
 * CreateDate: 2024/7/4 15:46
 * UpdateUser:
 * UpdateDate: 2024/7/4 15:46
 * UpdateRemark:
 */
class TextActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    fun Greeting() {

//        val fontFamily = FontFamily(
//            Font(R.font.my_custom_font_regular, FontWeight.Normal),
//            Font(R.font.my_custom_font_bold, FontWeight.Normal),
//        )

        Column(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.White)
                .padding(top = 48.dp)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text(
                text = "文字显示",
                style = TextStyle(
                    fontWeight = FontWeight.Bold,
                    fontSize = 20.sp,
                    letterSpacing = 2.sp,
                    color = Color.Magenta
                ),
                textAlign = TextAlign.Center,//对齐

                modifier = Modifier
                    .clickable {}//点击事件
                    .fillMaxWidth(),//设置宽度
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,//属性用于控制当文本长度超过其分配的空间时的显示行为
//                Clip (TextOverflow.Clip): 这是默认设置。如果文本太长，超出容器的部分将被剪切掉，不会显示。
//            Ellipsis (TextOverflow.Ellipsis): 当文本超出显示区域时，会在尾部显示省略号（...）。这表明还有更多的文本没有显示出来。
//            Visible (TextOverflow.Visible): 即使文本超出分配的空间，仍然会显示完整的文本，这可能会导致文本覆盖到其他界面元素上。
                color = Color.Red,
                textDecoration = TextDecoration.Underline//属性用于添加文本的装饰样式，如下划线、删除线等
//             Underline (TextDecoration.Underline): 在文本下方添加一条线，常用于表示可点击的链接或强调重要性。
//            LineThrough (TextDecoration.LineThrough): 在文本中添加一条删除线，常用于显示某项内容已经被取消或已完成。
//            Combined (TextDecoration.combine): 允许你组合多种装饰，例如同时使用下划线和删除线。

            )
            val annotatedText = buildAnnotatedString {
                withStyle(style = SpanStyle(color = Color.Blue)) {
                    append("Blue text ")
                }
                withStyle(style = SpanStyle(fontWeight = FontWeight.Bold, fontSize = 18.sp)) {
                    append("Bold text ")
                }
                append("Normal text")
            }

            Text(annotatedText)//富文本


        }
    }

}









