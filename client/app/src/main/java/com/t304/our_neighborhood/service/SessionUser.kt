package com.t304.our_neighborhood.service

import com.t304.our_neighborhood.vo.UserVo

object SessionUser {
    var user = UserVo(
        member_idx = 0,
        member_name = "",
        member_id = "",
        member_pwd = "",
        member_tel = "",
        member_comment = "",
        member_grade = "",
        member_regdate = ""
    )
}