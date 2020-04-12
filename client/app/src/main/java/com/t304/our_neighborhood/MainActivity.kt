package com.t304.our_neighborhood

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import com.t304.our_neighborhood.fragment.HomeFragment
import com.t304.our_neighborhood.fragment.MyPageFragment
import com.t304.our_neighborhood.fragment.NoticeFragment
import com.t304.our_neighborhood.fragment.ReservationFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Load first Fragment by default
        loadFragment(HomeFragment())

        bnav_main.setOnNavigationItemSelectedListener {
            menuItem ->
            when {
                menuItem.itemId == R.id.action_home -> {
                    loadFragment(HomeFragment())
                    return@setOnNavigationItemSelectedListener true
                }

                menuItem.itemId == R.id.action_reserv -> {
                    loadFragment(ReservationFragment())
                    return@setOnNavigationItemSelectedListener true
                }

                menuItem.itemId == R.id.action_notice -> {
                    loadFragment(NoticeFragment())
                    return@setOnNavigationItemSelectedListener true
                }
                menuItem.itemId == R.id.action_my_page -> {
                   loadFragment(MyPageFragment())
                    return@setOnNavigationItemSelectedListener true
                }
                else -> {
                    return@setOnNavigationItemSelectedListener false
                }
            }
        }
    }

    private fun loadFragment(fragment: Fragment) {
        supportFragmentManager.beginTransaction().also {
            fragmentTransaction ->  fragmentTransaction.replace(R.id.fragmentContainer, fragment)
            fragmentTransaction.commit()
        }
    }
}
