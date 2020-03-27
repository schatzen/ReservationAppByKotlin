package com.t304.our_neighborhood.service.retrofit2

import com.t304.our_neighborhood.vo.UserVo
import retrofit2.http.*
import java.util.*

interface RetrofitService {
    /*@Headers("Authorization: ${author.authorization}")
    @GET("v2/local/search/keyword")
    suspend fun requestSearchLocal(
        @Query("query") keyword: String,
        @Query("x") x: Double,
        @Query("y") y: Double,
        @Query("radius") radius: Int,
        @Query("page") page: Int
    ): KakaoLocalSearchModel*/

    // sign up
    @POST("reserv/member/signup")
    suspend fun insertUser(@Body vo: UserVo): Map<String, String>

    // sign in
    @POST("reserv/member/signin")
    suspend fun getUser(@Body vo: UserVo): UserVo
}