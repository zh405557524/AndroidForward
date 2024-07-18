package com.soul.composedemo.animation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.animateContentSize
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * Description: 尺寸更改动画
 * Author: 祝明
 * CreateDate: 2024/7/18 18:05
 * UpdateUser:
 * UpdateDate: 2024/7/18 18:05
 * UpdateRemark:
 */
class AnimateContentSizeActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        var text by remember { mutableStateOf("animateContentSize 动画") }

        Box(
            modifier = Modifier
                .padding(top = 48.dp)
                .fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Text(text, modifier = Modifier
                .clickable {
                    text += text
                }
                .animateContentSize()
            )
        }

    }


}