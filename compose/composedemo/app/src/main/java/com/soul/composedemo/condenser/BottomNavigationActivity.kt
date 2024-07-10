package com.soul.composedemo.condenser

import android.graphics.Color
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.windowInsetsBottomHeight
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material3.BottomAppBar
import androidx.compose.material3.BottomAppBarDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.contentColorFor
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.Dp

/**
 * Description: BottomNavigation
 * Author: 祝明
 * CreateDate: 2024/7/10 10:12
 * UpdateUser:
 * UpdateDate: 2024/7/10 10:12
 * UpdateRemark:
 */
class BottomNavigationActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }

    }

    @Composable
    private fun Greeting() {
        val items = listOf("Home", "Favorite", "Profile")
        BottomAppBar {
            items.forEachIndexed { index, s ->
                Column {
                    IconButton(
                        onClick = { /*TODO*/ },
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Filled.Favorite, null)
                    }
                    Text(text = s)
                }
            }
        }
    }


}








