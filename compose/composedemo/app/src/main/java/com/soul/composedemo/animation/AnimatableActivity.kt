package com.soul.composedemo.animation

import android.os.Bundle
import android.view.animation.Animation
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.Animatable
import androidx.compose.animation.core.AnimationSpec
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

/**
 * Description: Animatable
 * 会在内部储存一个值，当值通过 animateTo 被改变时，它可以产生动画。这就是支持 animate*AsState 实现的 API。
 * 它确保了一致的延续性和互斥性，这意味着值的变化总是连续的，任何正在进行的动画都会被取消。
 * Author: 祝明
 * CreateDate: 2024/7/23 14:25
 * UpdateUser:
 * UpdateDate: 2024/7/23 14:25
 * UpdateRemark:
 */
class AnimatableActivity : ComponentActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {

        var flag by remember { mutableStateOf(false) }
        val color = remember { Animatable(Color.Gray) }

        Column(Modifier.padding(top = 48.dp)) {
            Box(Modifier
                .size(300.dp)
                .background(color.value))
            Button(onClick = { flag = !flag }) {
                Text(text = "改变颜色")
            }
        }

        LaunchedEffect(flag) {
            color.animateTo(targetValue = if (flag) {
                Color.Green
            } else {
                Color.Red
            }, animationSpec = tween(1000))

        }
    }



}







