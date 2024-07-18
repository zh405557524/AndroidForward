package com.soul.composedemo.animation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.Crossfade
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

/**
 * Description: 淡入淡出的动画
 * Author: 祝明
 * CreateDate: 2024/7/18 18:21
 * UpdateUser:
 * UpdateDate: 2024/7/18 18:21
 * UpdateRemark:
 */
class CrossfadeActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        var flag by remember { mutableStateOf(true) }
        Column(modifier = Modifier.padding(top = 48.dp)) {
            Crossfade(targetState = flag, animationSpec = tween(1200)) {
                when (it) {
                    false -> screen1()
                    true -> screen2()
                }
            }

            Button(onClick = { flag = !flag }) {
                Text(text = "切换")
            }
        }

    }

    @Composable
    private fun screen1() {
        Box(
            modifier = Modifier
                .padding(top = 48.dp)
                .size(200.dp)
                .background(Color.Red),
            contentAlignment = Alignment.Center
        ) {

        }
    }

    @Composable
    private fun screen2() {
        Box(
            modifier = Modifier
                .padding(top = 48.dp)
                .size(200.dp)
                .background(Color.Green),
            contentAlignment = Alignment.Center
        ) {

        }

    }

}