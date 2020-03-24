package com.t304.our_neighborhood.fragment

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import androidx.navigation.ui.setupWithNavController
import androidx.viewpager2.widget.ViewPager2
import com.google.android.gms.maps.*
import com.google.android.gms.maps.model.LatLng
import com.t304.our_neighborhood.R
import com.t304.our_neighborhood.adapter.DetailViewPagerAdapter
import kotlinx.android.synthetic.main.fragment_detail.view.*

class DetailFragment : Fragment(), OnMapReadyCallback {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val v = inflater.inflate(R.layout.fragment_detail, container, false)

        // init mapView
        v.mapView.apply {
            onCreate(savedInstanceState)
            onResume()
            getMapAsync(this@DetailFragment)
        }

        //init toolbar
        v.toolbar_detail.apply {
            setupWithNavController(findNavController())
            title = ""
        }

        // init viewpager
        v.vp_detail_image.apply {
            adapter = DetailViewPagerAdapter()
            orientation = ViewPager2.ORIENTATION_HORIZONTAL
        }

        v.scrollview.setOnTouchListener { _, event ->
            when (event.action) {
                MotionEvent.ACTION_DOWN ->
                    v.btn_detail_reservate.apply {
                        animate().translationY(height.toFloat())
                        visibility = View.GONE
                    }
                MotionEvent.ACTION_UP ->
                    v.btn_detail_reservate.apply {
                        animate()
                            .translationY(0f)
                            .duration = 130
                        visibility = View.VISIBLE
                    }
            }
            false
        }

        return v
    }

    override fun onMapReady(p0: GoogleMap?) {
        val seoul = LatLng(37.566, 126.978)
        
        p0?.run {
            moveCamera(CameraUpdateFactory.newLatLng(seoul))
            moveCamera(CameraUpdateFactory.zoomTo(10f))
        }

    }
}
