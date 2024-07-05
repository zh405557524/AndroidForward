package com.soul.composedemo.component

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults.elevatedCardElevation
import androidx.compose.material3.CardElevation
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.soul.lib.utils.ToastUtils

/**
 * Description: 卡牌的用法
 * Author: 祝明
 * CreateDate: 2024/7/5 14:26
 * UpdateUser:
 * UpdateDate: 2024/7/5 14:26
 * UpdateRemark:
 */
class CardActivity : ComponentActivity() {

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
            //基本用法
            Card(
                modifier = Modifier
                    .padding(8.dp)
                    .fillMaxWidth()
                    .clickable { ToastUtils.showShortToast("被点击了") },
                shape = RoundedCornerShape(8.dp),
                elevation = elevatedCardElevation(8.dp)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(text = "Card Title", style = MaterialTheme.typography.bodyLarge)
                    Text(text = "Card content goes here. This can be a description or any other content.")
                }
            }
        }

    }

}