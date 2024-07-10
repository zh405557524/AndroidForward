package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.indication
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.MoreVert
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier

/**
 * Description:appBar
 * Author: 祝明
 * CreateDate: 2024/7/10 9:48
 * UpdateUser:
 * UpdateDate: 2024/7/10 9:48
 * UpdateRemark:
 */
class TopAppBarActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @OptIn(ExperimentalMaterial3Api::class)
    @Composable
    private fun Greeting() {
        val interactionSource = remember { MutableInteractionSource() }
        TopAppBar(
            title = {
                Text(text = "主页")
            },
            navigationIcon = {
                IconButton(
                    onClick = { finish()},
                    interactionSource = interactionSource,  // 使用自定义的交互源
                    modifier = Modifier.indication(interactionSource, null),
                ) {
                    Icon(Icons.Filled.ArrowBack, null)
                }
            },
            actions = {
                IconButton(onClick = { }) {
                    Icon(Icons.Filled.Search, null)
                }
                IconButton(onClick = { /*TODO*/ }) {
                    Icon(Icons.Filled.MoreVert, null)
                }
            }
        )

    }
}