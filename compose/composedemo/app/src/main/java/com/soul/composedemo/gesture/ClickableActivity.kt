package com.soul.composedemo.gesture

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.unit.dp

/**
 * Description: 点击事件
 * Author: 祝明
 * CreateDate: 2024/7/26 14:42
 * UpdateUser:
 * UpdateDate: 2024/7/26 14:42
 * UpdateRemark:
 */
class ClickableActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        val count = remember { mutableStateOf(0) }
        val state = remember { mutableStateOf("手势检测器") }

        Column(modifier = Modifier
            .padding(16.dp)
            .padding(top = 48.dp)) {
            Text(text = "点击了${count.value.toString()}次", modifier = Modifier.clickable { count.value++ })

            Text(text = state.value, modifier = Modifier
                .padding(top = 48.dp)
                .size(200.dp, 200.dp)
                .pointerInput(Unit) {
                    detectTapGestures(
                        onPress = { state.value = "按下" },
                        onDoubleTap = { state.value = "双击" },
                        onLongPress = { state.value = "长按" },
                        onTap = { state.value = "点击" },
                    )
                })

        }

    }

}