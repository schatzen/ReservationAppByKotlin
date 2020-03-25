package com.t304.our_neighborhood.service.retrofit2

import com.t304.our_neighborhood.vo.UserVo
import retrofit2.http.*

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

    @POST("reserv/member")
    suspend fun insertUser(
        @Body vo: UserVo
    ) : Map<String, String>
}