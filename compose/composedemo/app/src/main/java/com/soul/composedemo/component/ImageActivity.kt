package com.soul.composedemo.component

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.Image
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import coil.compose.rememberAsyncImagePainter
import coil.compose.rememberImagePainter
import com.soul.composedemo.R

/**
 * Description: 图片显示
 * Author: 祝明
 * CreateDate: 2024/7/4 16:55
 * UpdateUser:
 * UpdateDate: 2024/7/4 16:55
 * UpdateRemark:
 */
class ImageActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    fun Greeting() {

        val scrollState = rememberScrollState()
        Column(
            modifier = Modifier
                .padding(top = 48.dp)
                .verticalScroll(scrollState)
                .fillMaxHeight()
        ) {
            //本地图片
            val image = painterResource(R.mipmap.bg_scenic)
            Image(painter = image, contentDescription = "Local Image")//本地图片
            val imageUrl =
                "https://images.pexels.com/photos/15876205/pexels-photo-15876205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
            val painter = rememberAsyncImagePainter(imageUrl)
            Image(
                painter = painter,
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(16f / 9f),//设置狂高比
                contentDescription = "net image"
            )//网络图片
            //裁剪
            Image(
                painter = image,
                contentDescription = "Scaled Image",

                contentScale = ContentScale.Crop // 裁剪图像以填充容器尺寸

            )

            //圆角，边框
            Image(
                painter = image,
                contentDescription = "Decorated Image",
                modifier = Modifier
                    .clip(RoundedCornerShape(10.dp)) // 应用圆角
                    .border(2.dp, Color.Red) // 添加红色边框
            )

// 启用淡入效果
            val image2 = rememberImagePainter(
                data = imageUrl,
                builder = {
                    crossfade(true)
                }
            )
            Image(
                painter = image2,
                modifier = Modifier.height(300.dp), // 设置高度
                contentDescription = "Animated Image"
            )
        }
    }
}