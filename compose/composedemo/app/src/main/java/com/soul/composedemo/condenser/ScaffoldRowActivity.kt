package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Menu
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.BottomAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.soul.lib.utils.ToastUtils

/**
 * Description: 整体布局
 * Author: 祝明
 * CreateDate: 2024/7/5 17:15
 * UpdateUser:
 * UpdateDate: 2024/7/5 17:15
 * UpdateRemark:
 */
class ScaffoldRowActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @OptIn(ExperimentalMaterial3Api::class)
    @Composable
    private fun Greeting() {
        Scaffold(
            topBar = { MyTopAppBar() },
            floatingActionButton = {
                FloatingActionButton(onClick = { ToastUtils.showShortToast("被点击了") }) {
                    Icon(Icons.Filled.Add, contentDescription = "Add")
                }
            },
            content = { innerPadding ->
                Column(modifier = Modifier.padding(innerPadding)) {
                    Text("Hello from Scaffold!")
                    Text("More content can go here.")
                }
            },

            bottomBar = {
                BottomAppBar {
                    Row(
                        modifier = Modifier
                            .padding(8.dp)
                            .fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceAround
                    ) {
                        Text("首页", modifier = Modifier.clickable { ToastUtils.showShortToast("首页被点击了") })
                        Text("分类", modifier = Modifier.clickable { ToastUtils.showShortToast("分类被点击") })
                        Text("个人中心", modifier = Modifier.clickable { ToastUtils.showShortToast("个人中心被点击") })
                    }
                }
            },

            )
    }


    @OptIn(ExperimentalMaterial3Api::class)
    @Composable
    fun MyTopAppBar() {
        TopAppBar(
            title = { Text("Page Title") },
            navigationIcon = {
                IconButton(onClick = { ToastUtils.showShortToast("菜单按钮被点击") }) {
                    Icon(Icons.Filled.Menu, contentDescription = "Menu")
                }
            },
            actions = {
                IconButton(onClick = { ToastUtils.showShortToast("搜索按钮被点击") }) {
                    Icon(Icons.Filled.Search, contentDescription = "Search")
                }
            }
        )

    }

}