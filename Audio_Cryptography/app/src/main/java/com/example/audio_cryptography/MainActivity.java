package com.example.audio_cryptography;

import static android.util.Base64.decode;
import static android.util.Base64.encodeToString;

import static com.example.audio_cryptography.Utility.getOnlyStrings;

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
import org.w3c.dom.Text;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Base64;
import java.util.Locale;

public class MainActivity extends AppCompatActivity {

    Button button;
    Button btnText;
    Button btnStop;
    MediaPlayer player = new MediaPlayer();
    File file;
    int REQUEST_WRITE_PERMISSION=1;
    TextToSpeech textToSpeech;
    String encry = null;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        requestPermissions();
        button = findViewById(R.id.btnPlayAudio);
        btnText = findViewById(R.id.btnPlayAudio2);
        btnStop = findViewById(R.id.btnStopAudio);

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
                    textToSpeech.setLanguage(Locale.ENGLISH);
                }
            }
        });

        btnText.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                textToSpeech.speak(encry.substring(2,50), TextToSpeech.QUEUE_FLUSH, null);

            }
        });

    }

    private void startSound() {
        AssetFileDescriptor afd = null;
        try{
            afd = getResources().getAssets().openFd("NormalAudio.mp3");
            file = new File( Environment.getExternalStorageDirectory()+"/NormalAudio.mp3");
            byte [] bytes = FileUtils.readFileToByteArray(file);
            String encoded = encodeToString(bytes,0);
            CipherEncrypt(encoded,7);
            byte[] decoded = decode(encoded,0);

            try{
                 File file2 = new File(Environment.getExternalStorageDirectory()+"/hello_5.wav");
                 FileOutputStream os = new FileOutputStream(file2,true);
                 os.write(decoded);
                 os.close();
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        try{
            assert afd != null;
            player.setDataSource(file.toString());
            player.prepare();
            player.start();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    private void requestPermissions(){
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            requestPermissions(new String[]{
                    Manifest.permission.WRITE_EXTERNAL_STORAGE
            }, REQUEST_WRITE_PERMISSION);
        }
    }

    public void CipherEncrypt(String text, int s){
        StringBuffer result = new StringBuffer();
        for(int i=0;i<text.length();i++){
            if(Character.isUpperCase(text.charAt(i))){
                char ch = (char)(((int)text.charAt(i)+ s -65)% 26+65);
                result.append(ch);
            }
            else {
                char ch = (char) (((int) text.charAt(i) + s - 97) % 26 + 97);
                result.append(ch);
            }
        }
        encry = getOnlyStrings(result.toString());
        try{
            byte[] decoded = decode(result.toString(),0);
            File file2 = new File(Environment.getDataDirectory() + "/NormalAudio.mp3");
            FileOutputStream os = new FileOutputStream(file2, true);
            os.write(decoded);
            os.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }

    }



}