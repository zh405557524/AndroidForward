package com.soul.jni

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.TextView
import com.soul.jni.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    val TAG = "MainActivity"
    private lateinit var binding: ActivityMainBinding

    public var name = "soul"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setTheme(androidx.appcompat.R.style.Theme_AppCompat_Light)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Example of a call to a native method
        binding.sampleText.text = stringFromJNI()

        Log.i(TAG, "name:$name")
        changeName("sam")
        Log.i(TAG, "change name:$name")
        val student = Student()
        setStudent(student)
        Log.i(TAG, "student:$student")
        val createStudent = createStudent()
        Log.i(TAG, "createStudent:$createStudent")
    }

    /**
     * A native method that is implemented by the 'jni' native library,
     * which is packaged with this application.
     */
    external fun stringFromJNI(): String
    external fun changeName(name: String): String

    external fun setStudent(student: Student);

    external fun createStudent(): Student

    companion object {
        // Used to load the 'jni' library on application startup.
        init {
            System.loadLibrary("jni")
        }
    }
}