package com.gusterwoei.calabashtest;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import butterknife.BindView;
import butterknife.OnClick;

public class LoginActivity extends BaseActivity {

    @BindView(R.id.edt_username)
    protected EditText edtUsername;
    @BindView(R.id.edt_password)
    protected EditText edtPassword;
    @BindView(R.id.btn_login)
    protected Button btnLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        initView();
    }

    private void initView() {

    }

    @OnClick(R.id.btn_login)
    protected void login() {
        String username = edtUsername.getText().toString();
        String password = edtPassword.getText().toString();
        if(!getAppService().validateLogin(username, password)) {
            Toast.makeText(this, "Invalid Credentials", Toast.LENGTH_LONG).show();
            return;
        }

        // mock async return
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                startActivity(new Intent(getApplicationContext(), MainActivity.class));
                finish();
            }
        }, 3000);
    }
}
