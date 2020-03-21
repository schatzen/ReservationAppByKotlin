package com.t304.our_neighborhood.service.retrofit2

import com.jakewharton.retrofit2.adapter.kotlin.coroutines.CoroutineCallAdapterFactory
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitHelper {
    private var retrofit: Retrofit = Retrofit.Builder()
        .baseUrl("???")
        .addConverterFactory(GsonConverterFactory.create())
        .addCallAdapterFactory(CoroutineCallAdapterFactory())
        .build()

    fun getService(): RetrofitService = retrofit.create(RetrofitService::class.java)
}