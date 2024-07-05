package com.soul.composedemo.component

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material.icons.filled.FavoriteBorder
import androidx.compose.material.icons.filled.Info
import androidx.compose.material.icons.filled.Menu
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import com.soul.composedemo.R
import com.soul.lib.utils.ToastUtils

/**
 * Description: 图标
 * Author: 祝明
 * CreateDate: 2024/7/5 11:29
 * UpdateUser:
 * UpdateDate: 2024/7/5 11:29
 * UpdateRemark:
 */
class IconActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        var isFavorite = false
        Column(modifier = Modifier.padding(top = 48.dp)) {
            Icon(
                imageVector = Icons.Filled.Menu,
                contentDescription = "Favorite",
                tint = Color.Red,
                modifier = Modifier.size(48.dp)
            )
            //本地图片
            Icon(
                painter = painterResource(id = R.drawable.ic_launcher_background),
                contentDescription = "Favorite",
                tint = Color.Red,
                modifier = Modifier.size(48.dp)
            )
            //与其他组件 组合使用
            IconButton(onClick = { ToastUtils.showShortToast("被点击了") }) {
                Icon(
                    Icons.Filled.Info,
                    contentDescription = "Info"
                )
            }

            Icon(
                imageVector = if (isFavorite) Icons.Filled.Favorite else Icons.Filled.FavoriteBorder,
                contentDescription = if (isFavorite) "Remove from favorites" else "Add to favorites"
            )

        }

    }
}

