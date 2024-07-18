package com.soul.composedemo.animation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.expandVertically
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.shrinkHorizontally
import androidx.compose.animation.slideInVertically
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Description: 隐藏显示动画
 * Author: 祝明
 * CreateDate: 2024/7/18 17:36
 * UpdateUser:
 * UpdateDate: 2024/7/18 17:36
 * UpdateRemark:
 */
class AnimationVisibilityActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { greeting() }
    }

    @Composable
    private fun greeting() {
        var state by remember { mutableStateOf(true) }

        Column(
            modifier = Modifier
                .padding(top = 48.dp)
                .fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {

            AnimatedVisibility(visible = state,//显示隐藏
                enter = slideInVertically(
                    initialOffsetY = { -40 }
                ) + expandVertically(
                    expandFrom = Alignment.Top
                ) + fadeIn(initialAlpha = 0.3f),//进入动画
                exit = shrinkHorizontally() + fadeOut()//退出动画

            ) {
                Text(
                    text = "这是一个普通文本",
                    fontWeight = FontWeight.W900,
                    style = MaterialTheme.typography.titleSmall
                )
            }
            Spacer(Modifier.padding(vertical = 50.dp))
            Button(onClick = { state = !state }) {
                Text(if (state) "隐藏" else "显示")
            }


        }

    }

}



