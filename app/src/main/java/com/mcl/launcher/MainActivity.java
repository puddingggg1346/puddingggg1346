package com.mcl.launcher;

import android.app.Activity;
import android.os.Bundle;

public class MainActivity extends Activity {
    static { System.loadLibrary("mcl"); }
    private static native void nativeInit();

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        nativeInit();
    }
}
