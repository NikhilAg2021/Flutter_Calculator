package com.example.audiocrpytography;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utility {

    public static String getOnlyStrings(String s){
        Pattern pattern =Pattern.compile("[^a-z A-Z]");
        Matcher matcher = pattern.matcher(s);
        String mint =matcher.replaceAll(replacement:"");
        return mint;

    }

    public static String getOnlyDigits(String s)
        Pattern pattern=Pattern.compile("[0-9]");
        Matcher matcher = pattern.matcher(s);
        String numDigit = matcher.replaceAll(replacement:"");
        return numDigit;





}
