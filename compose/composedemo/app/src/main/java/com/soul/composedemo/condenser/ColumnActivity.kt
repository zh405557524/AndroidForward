package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material3.Button
import androidx.compose.material3.Divider
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.soul.lib.utils.ToastUtils

/**
 * Description: 竖向列表
 * Author: 祝明
 * CreateDate: 2024/7/5 16:42
 * UpdateUser:
 * UpdateDate: 2024/7/5 16:42
 * UpdateRemark:
 */
class ColumnActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        Column(
            modifier = Modifier
                .padding(top = 48.dp)
                .padding(16.dp)
                .fillMaxWidth(),
            verticalArrangement = Arrangement.SpaceEvenly,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {

            Text("Head", fontSize = 20.sp, fontWeight = FontWeight.Bold)
            Divider(color = Color.Gray, thickness = 1.dp)
            Text("Content goes here. More detailed description can be added.")
            Row {
                Button(onClick = { ToastUtils.showShortToast("被点击了") }) {
                    Text("Button1")
                }
                Spacer(Modifier.padding(8.dp))
                Button(onClick = { ToastUtils.showShortToast("被点击了") }) {
                    Text("Button2")
                }
            }

        }
    }

}