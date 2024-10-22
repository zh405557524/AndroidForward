package com.soul.composedemo.animation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.animateColor
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.TargetBasedAnimation
import androidx.compose.animation.core.VectorConverter
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color

/**
 * Description: 像 Transition 一样持有一个或多个子动画，但这些动画一进入构图就开始运行，除非它们被移除，否则不会停止
 * Author: 祝明
 * CreateDate: 2024/7/24 16:56
 * UpdateUser:
 * UpdateDate: 2024/7/24 16:56
 * UpdateRemark:
 */
class RememberInfiniteTransitionActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        val infiniteTransition = rememberInfiniteTransition()
        val color by infiniteTransition.animateColor(initialValue = Color.Red, //初始值
            targetValue = Color.Blue, //目标值
            animationSpec = infiniteRepeatable(animation = tween(1000,
                easing = LinearEasing), // 一个动画值的转换持续 1 秒，缓和方式为 LinearEasing
                repeatMode = RepeatMode.Reverse // 指定动画重复运行的方式，
                // Reverse 为 init -> target, target -> init, init -> target
                // Repeat 为 init -> target, init -> target, init -> target
            ), label = "")
        Box(Modifier
            .fillMaxSize()
            .background(color = color)) {}
    }

}