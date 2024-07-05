package com.soul.composedemo.component

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Slider
import androidx.compose.material3.SliderDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.soul.lib.utils.LogUtil

/**
 * Description: 滑块
 * Author: 祝明
 * CreateDate: 2024/7/5 14:47
 * UpdateUser:
 * UpdateDate: 2024/7/5 14:47
 * UpdateRemark:
 */
class SliderActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        Column(
            modifier = Modifier.padding(top = 48.dp)
        ) {
            //基本用法
            MySlider()
            MySlider2()
        }
    }

    @Composable
    private fun MySlider() {
        var sliderValue by remember { mutableStateOf(0.1f) }

        Slider(
            value = sliderValue,//当前滑块的值
            onValueChange = { sliderValue = it },//当滑块的值改变时调用的回调函数
            modifier = Modifier.padding(16.dp),
            valueRange = 0f..1f,//设定滑块值的范围
            onValueChangeFinished = {//当用户完成滑动后触发的回调
                LogUtil.i("TAG", "onValueChangeFinished: $sliderValue")
            }
        )
    }

    @Composable
    private fun MySlider2() {
        var sliderValue by remember { mutableStateOf(0.1f) }

        Slider(
            value = sliderValue,
            onValueChange = { sliderValue = it },
            modifier = Modifier.padding(16.dp),
            valueRange = 0f..1f,
            onValueChangeFinished = {
                LogUtil.i("TAG", "onValueChangeFinished: $sliderValue")
            },
            colors = SliderDefaults.colors(
                thumbColor = Color.Red,
                activeTrackColor = Color.Blue,
                inactiveTrackColor = Color.Gray
            )
        )
    }


}