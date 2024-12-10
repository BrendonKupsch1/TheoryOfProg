// Caesar cipher Java with a shift of 3, with encrypt, decrypt, and solve methods
// Brendon Kupsch

import java.util.Scanner;

public class Cipher {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        try {
            System.out.println("Enter a message to encrypt: ");
            String message = input.nextLine();
            System.out.println("Enter a shift value: ");
            int shift = input.nextInt();
            System.out.println("Encrypted message: " + encrypt(message, shift));
            System.out.println("Decrypted message: " + decrypt(encrypt(message, shift), shift));
            System.out.println("Solved message: " + solve(encrypt(message, shift)));
        } finally {
            input.close();
        }
    }

    public static String encrypt(String message, int shift) {
        String encrypted = "";
        for (int i = 0; i < message.length(); i++) {
            char c = message.charAt(i);
            if (Character.isUpperCase(c)) {
                c = (char) (c + shift);
                if (c > 'Z') {
                    c = (char) (c - 26);
                }
            } else if (Character.isLowerCase(c)) {
                c = (char) (c + shift);
                if (c > 'z') {
                    c = (char) (c - 26);
                }
            }
            encrypted += c;
        }
        return encrypted;
    }

    public static String decrypt(String message, int shift) {
        String decrypted = "";
        for (int i = 0; i < message.length(); i++) {
            char c = message.charAt(i);
            if (Character.isUpperCase(c)) {
                c = (char) (c - shift);
                if (c < 'A') {
                    c = (char) (c + 26);
                }
            } else if (Character.isLowerCase(c)) {
                c = (char) (c - shift);
                if (c < 'a') {
                    c = (char) (c + 26);
                }
            }
            decrypted += c;
        }
        return decrypted;
    }

    public static String solve(String message) {
        String solved = "";
        for (int i = 0; i < 26; i++) {
            solved += "Shift " + i + ": " + decrypt(message, i) + "\n";
        }
        return solved;
    }
}