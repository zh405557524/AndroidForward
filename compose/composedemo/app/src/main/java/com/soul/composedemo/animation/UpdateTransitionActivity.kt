package com.soul.composedemo.animation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.core.animateDp
import androidx.compose.animation.core.spring
import androidx.compose.animation.core.tween
import androidx.compose.animation.core.updateTransition
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

/**
 * Description:  管理一个或多个动画作为它的子项，并在多个状态之间同时运行它们。
 * Author: 祝明
 * CreateDate: 2024/7/23 16:53
 * UpdateUser:
 * UpdateDate: 2024/7/23 16:53
 * UpdateRemark:
 */
class UpdateTransitionActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {

        var currentState by remember { mutableStateOf(BoxState.Collapsed) }
        val transition = updateTransition(currentState)

        val rect by transition.animateDp(transitionSpec = {
            when {
                BoxState.Collapsed isTransitioningTo BoxState.Expanded -> { // 从Collapsed到Expanded的动画
                    spring(stiffness = 20F) //spring 动画模拟了现实世界中的弹簧运动
                }

                else -> { // 从Expanded到Collapsed的动画
                    tween(durationMillis = 500) //动画时间
                }
            }
        }, label = ""

        ) { state ->
            when (state) {
                BoxState.Collapsed -> 0.dp
                BoxState.Expanded -> 200.dp
            }
        }
        Box(modifier = Modifier
            .padding(top = 48.dp)
            .size(rect)
            .background(Color(0xFF0079D3))) {}

        Button(onClick = {
            currentState = when (currentState) {
                BoxState.Collapsed -> BoxState.Expanded
                BoxState.Expanded -> BoxState.Collapsed
            }
        }, modifier = Modifier.padding(top = 48.dp)) {
            Text(text = "切换状态")
        }

    }

    private enum class BoxState {
        Collapsed, Expanded
    }


}
