package com.gusterwoei.calabashtest;

import android.support.annotation.LayoutRes;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by guster on 06/10/2017.
 */

public abstract class BaseActivity extends AppCompatActivity {

    @Nullable @BindView(R.id.toolbar)
    protected Toolbar toolbar;

    @Override
    public void setContentView(@LayoutRes int layoutResID) {
        super.setContentView(layoutResID);
        ButterKnife.bind(this);
    }

    @Nullable
    public Toolbar getToolbar() {
        return toolbar;
    }

    protected AppService getAppService() {
        return AppService.get(getApplicationContext());
    }
}
