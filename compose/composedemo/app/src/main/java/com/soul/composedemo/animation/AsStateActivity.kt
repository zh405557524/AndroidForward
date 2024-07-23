package com.soul.composedemo.animation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.rounded.Favorite
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

/**
 * Description: 单数值变化动画
 * 你只需提供结束值（或目标值），API 就会从当前值到指定值开始动画。
 * Author: 祝明
 * CreateDate: 2024/7/19 9:53
 * UpdateUser:
 * UpdateDate: 2024/7/19 9:53
 * UpdateRemark:
 */
class AsStateActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        var change by remember { mutableStateOf(false) }
        var flag by remember { mutableStateOf(false) }

        val buttonSize by animateDpAsState(
            targetValue = if (change) 32.dp else 24.dp
        )

        if (buttonSize == 32.dp) {
            change = false
        }

        IconButton(
            modifier = Modifier.padding(top = 48.dp),
            onClick = {
                change = true
                flag = !flag
            }) {
            Icon(
                Icons.Rounded.Favorite,
                contentDescription = "",
                modifier = Modifier.size(buttonSize),
                tint = if (flag) Color.Red else Color.Gray
            )
        }
    }


    @Composable
    private fun Greeting2() {
        var text by remember { mutableStateOf("") }
        var foucusState by remember { mutableStateOf(false) }

        val size by animateFloatAsState(targetValue = if (foucusState) 1f else 0.5f)

        Column(
            Modifier
                .padding(top = 48.dp)
                .fillMaxSize()
        ) {


        }


    }

}