package com.example.audiocrpytography;

import static com.example.audiocrpytography.Utility.getOnlyStrings;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.Manifest;
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.speech.tts.TextToSpeech;
import android.view.View;
import android.widget.Button;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Base64;
import java.util.Locale;

public class MainActivity extends AppCompatActivity {

    Button button;
    Button btntext;
    Button btnStop;
    MediaPlayer player = newMediaPlayer();

    private MediaPlayer newMediaPlayer() {
        
    }

    File file;
    int REQUEST_WRITE_PERMISSION = 1;
    TextToSpeech textToSpeech;
    String encrypt = null;

    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        requestPermissions();

        button = findViewById(R.id.btnPlayAudio);
        button = findViewById(R.id.btnPlayAudio2);
        button = findViewById(R.id.btnStopAudio);

        btnStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                player.stop();
            }
        });

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                startSound();

            }
        });
        textToSpeech = new TextToSpeech(getApplicationContext(), new TextToSpeech.OnInitListener() {
            @Override
            public void onInit(int status) {
                if(status!= TextToSpeech.ERROR){
                    TextToSpeech.setLanguage(Locale.UK) ;
                }
            }
        });

        btntext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                TextToSpeech.speak(encry.substring(2,50), TextToSpeech.QUEUE_FLUSH, params:null);
            }
        });
    }

    private void requestPermissions() {
    }

    private void startSound() {
        AssetFileDescriptor afd = null;
        try {
            String fileName;
            afd = getResources().getAssets().openFd(fileName:"NormalAudio.mp3");
            file = new File(Environment.getExternalStorageDirectory() + "/NormalAudio.mp3");
            byte[] bytes = FileUtils.readFileToByteArray(file);
            String encoded = Base64.encodeToString(bytes, flags:0);
            CipherEncrypt(encoded,s:5);
            byte[] decoded = Base64.decode(encoded,flags:0);

            try{
                File file2 = new File(pathname: Environment.getExternalStorageDirectory() + "/hello-5.wav");
                FileOutputStream os = new FileOutputStream(file2, append:true);
                os.write(decoded);
                os.close();
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
         catch (Exception e) {
            e.printStackTrace();
        }
        try{
            assert afd!=null;
            player.setDataSource(file.toString());
            player.prepare();
            player.start();
        }
        catch(Exception e){
            e.printStackTrace();
        }

    }

    private void requestPermission(String[] strings, int REQUEST_WRITE_PERMISSION) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            requestPermission(new String[]{
                    Manifest.permission.WRITE_EXTERNAL_STORAGE
            }, REQUEST_WRITE_PERMISSION);
        }
    }

    public void CipherEncrypt(String text, int s) {
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < text.length(); i++) {
            if (Character.isUpperCase(text.charAt(i))) {
                char ch = (char) (((int) text.charAt(i) + s - 65) % 26 + 65);
                result.append(ch);
            } else {
                char ch = (char) (((int) text.charAt(i) + s - 97) % 26 + 97);
                result.append(ch);
            }
        }

        encry = getOnlyStrings(result.toString());
        try{
            byte[] decoded = Base64.decode(result.toString(), flags:0);
            File file2 = new File( pathname:Environment.getExternalStorageDirectory() + "/NormalAudio.mp3");
            FileOutputStream os= new FileOutputStream(file2, append:true);
            os.write(decoded);
            os.close();

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}