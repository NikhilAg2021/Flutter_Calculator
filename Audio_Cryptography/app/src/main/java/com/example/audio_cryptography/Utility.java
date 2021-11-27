package com.example.audio_cryptography;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Utility {


    public static String getOnlyStrings(String s){
        Pattern pattern = Pattern.compile("[^a-z A-Z]");
        Matcher matcher = pattern.matcher(s);
        String mint = matcher.replaceAll("");
        return mint;
    }

    public static String getOnlyDigits(String s){
        Pattern pattern = Pattern.compile("[^0-9]");
        Matcher matcher = pattern.matcher(s);
        String numDigit = matcher.replaceAll("");
        return numDigit;
    }

}
