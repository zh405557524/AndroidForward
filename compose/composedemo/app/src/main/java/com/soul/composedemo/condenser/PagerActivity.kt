package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * Description: ViewPager
 * Author: 祝明
 * CreateDate: 2024/7/10 13:51
 * UpdateUser:
 * UpdateDate: 2024/7/10 13:51
 * UpdateRemark:
 */
class PagerActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }

    }

    @OptIn(ExperimentalFoundationApi::class)
    @Composable
    private fun Greeting() {
        val pagerState = rememberPagerState { 10 }
// 显示 10 个项目
        HorizontalPager(
            state = pagerState,
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 48.dp)
        ) { page ->
            // 每一页的内容，比如显示个文本
            Text(
                text = "Page: $page",
                modifier = Modifier.fillMaxWidth()
            )
        }
    }

    @OptIn(ExperimentalFoundationApi::class)
    @Composable
    fun HorizontalPagerWithIndicator() {
//        val pagerState = rememberPagerState()
//        val scope = rememberCoroutineScope()


    }


}