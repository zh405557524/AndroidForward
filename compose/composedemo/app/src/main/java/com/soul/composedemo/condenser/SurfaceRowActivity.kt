package com.soul.composedemo.condenser

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.pointer.PointerIcon.Companion.Text
import androidx.compose.ui.semantics.SemanticsProperties.Text
import androidx.compose.ui.unit.dp
import androidx.compose.material3.Text

/**
 * Description: Surface
 * Author: 祝明
 * CreateDate: 2024/7/5 17:51
 * UpdateUser:
 * UpdateDate: 2024/7/5 17:51
 * UpdateRemark:
 */
class SurfaceRowActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }

    @Composable
    private fun Greeting() {
        Surface(
            modifier = Modifier.padding(16.dp),
            shadowElevation = 4.dp,
            shape = RoundedCornerShape(8.dp),
            color = MaterialTheme.colorScheme.surface
        ) {
            Column {
                Text("This is inside a Surface", modifier = Modifier.padding(16.dp))
                IconButton(onClick = { /* Handle click */ }) {
                    Icon(Icons.Filled.Favorite, contentDescription = "Favorite")
                }
            }
        }
    }



}