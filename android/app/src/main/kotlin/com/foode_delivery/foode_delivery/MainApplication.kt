package com.foode_delivery.foode_delivery
import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("en_US")
        MapKitFactory.setApiKey("29912d8e-0cd4-4f9f-83b5-09c4de40c494")
        MapKitFactory.initialize(this)
    }
}