package com.soul.composedemo

import android.content.DialogInterface.OnClickListener
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.soul.composedemo.ui.theme.ComposedemoTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { Greeting() }
    }


    @Composable
    fun Greeting() {
        ComposedemoTheme(false, false) {
            Column(modifier = Modifier.padding(top = 48.dp)) {
                ButtonWithAction("文字") { startActivity(TextActivity::class.java) }

            }
        }
    }

    @Composable
    fun ButtonWithAction(name: String, onClickListener: () -> Unit) {
        Button(
            onClick = onClickListener,
            modifier = Modifier
                .padding(8.dp)
                .fillMaxWidth()
        ) {
            Text(text = name)
        }
    }

    private fun startActivity(classz: Class<*>) {
        startActivity(Intent(this, classz))
    }
}

