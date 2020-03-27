/*
package com.t304.our_neighborhood.service

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences

public class SessionManager {

    //lateinit var pref: SharedPreferences
    //lateinit var editor : SharedPreferences.Editor
    //lateinit var con: Context
    //var PRIVATE_MODE: Int = 0

    constructor(con: Context) {
        this.con = con
        pref = con.getSharedPreferences("pref_name",PRIVATE_MODE)
        editor = pref.edit()
    }

    companion object{
        val IS_LOGIN: String = "isLoggedIn"
        val KEY_IDX : Int = 0
        val KEY_NAME : String = ""
        val KEY_ID : String = ""
        val KEY_PWD : String = ""
        val KEY_TEL : String = ""
        val KEY_COMMENT : String = ""
        val KEY_GRADE : String = ""
        val KEY_REGDATE : String = ""

    }

    fun createLoginSession(member_idx: Int ,memebr_id: String, member_pwd: String,
    member_name:String, member_tel:String, member_comment:String, member_grade:String, member_regdate:String) {
        editor.putBoolean(IS_LOGIN,true)
        editor.putInt(KEY_IDX.toString(),member_idx)
        editor.putString(KEY_ID,memebr_id)
        editor.putString(KEY_PWD,member_pwd)
        editor.putString(KEY_NAME,member_name)
        editor.putString(KEY_TEL,member_tel)
        editor.putString(KEY_COMMENT,member_comment)
        editor.putString(KEY_GRADE,member_grade)
        editor.putString(KEY_REGDATE,member_regdate)
    }

    fun checkLogin()
    {
        if (!this.isLoggedIn())
        {
            var i : Intent = Intent(con,)
        }
    }

}*/
