package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

/**
 * Description: 流式布局
 * Author: 祝明
 * CreateDate: 2024/7/5 17:03
 * UpdateUser:
 * UpdateDate: 2024/7/5 17:03
 * UpdateRemark:
 */
class FlowRowActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @OptIn(ExperimentalLayoutApi::class)
    @Composable
    private fun Greeting() {
        Column(
            modifier = Modifier.padding(top = 48.dp)
        ) {
            FlowRow(
                modifier = Modifier.padding(8.dp),
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                repeat(10) {
                    Chip("Item $it")
                }
            }
        }
    }

    @Composable
    fun Chip(content: String) {
        Card(
            modifier = Modifier
                .padding(4.dp)
                .background(Color.White)
        ) {
            Text(
                text = content,
                modifier = Modifier.padding(8.dp),
                color = Color.White
            )
        }
    }
}