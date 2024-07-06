
package com.example.apo

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.media.Ringtone
import android.media.RingtoneManager
import android.net.Uri
import android.os.BatteryManager
import android.widget.Toast
class BatteryReceiver : BroadcastReceiver() {
    private val BATTERY_THRESHOLD = 90

    override fun onReceive(context: Context, intent: Intent) {
        if (Intent.ACTION_BATTERY_CHANGED == intent.action) {
            val level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
            val scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
            val batteryPct = (level / scale.toFloat() * 100).toInt()

            if (batteryPct >= BATTERY_THRESHOLD) {
                Toast.makeText(context, "Battery level reached $BATTERY_THRESHOLD%", Toast.LENGTH_LONG).show()
                val notification: Uri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION)
                val ringtone: Ringtone = RingtoneManager.getRingtone(context, notification)
                ringtone.play()
            }
        }
    }
}