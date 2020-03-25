package com.t304.our_neighborhood.vo

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@Parcelize
data class UserVo (
    var member_idx : Int = 0,
    var member_name : String,
    var member_id : String,
    var member_pwd : String,
    var member_tel : String,
    var member_comment : String = "",
    var member_grade : String = "",
    var member_regdate : String = ""
) : Parcelable