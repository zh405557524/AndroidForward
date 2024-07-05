package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Star
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.soul.lib.utils.ToastUtils

/**
 * Description: 横向列表
 * Author: 祝明
 * CreateDate: 2024/7/5 16:05
 * UpdateUser:
 * UpdateDate: 2024/7/5 16:05
 * UpdateRemark:
 */
class RowActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        Column(
            modifier = Modifier.padding(top = 48.dp)
        ) {
            Row(
                modifier = Modifier.padding(8.dp),
                horizontalArrangement = Arrangement.SpaceBetween,//水平排列方式
                verticalAlignment = Alignment.CenterVertically//垂直对齐方式
            ) {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }

            Row(
                modifier = Modifier
                    .padding(all = 8.dp)
                    .fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceAround,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(Icons.Filled.Star, contentDescription = "Star Icon")
                Column {
                    Text("Title", fontWeight = FontWeight.Bold)
                    Text("Description goes here.")
                }
                Button(onClick = { ToastUtils.showShortToast("被点击了") }) {
                    Text("Action")
                }
            }
        }

    }

}