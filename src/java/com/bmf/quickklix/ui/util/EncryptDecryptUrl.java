/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.util;
import java.lang.Object.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import org.apache.log4j.Logger;
/**
 *
 * @author Murthy
 */
public class EncryptDecryptUrl {
    Logger log = Logger.getLogger(EncryptDecryptUrl.class);

    private Cipher encryptCipher;
    private Cipher decryptCipher;
    private sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
    private sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();

    public EncryptDecryptUrl() throws SecurityException {
        java.security.Security.addProvider(new com.sun.crypto.provider.SunJCE());
        char[] pass = "CHANGE THIS TO A BUNCH OF RANDOM CHARACTERS".toCharArray();
        byte[] salt = {
            (byte) 0xa3, (byte) 0x21, (byte) 0x24, (byte) 0x2c,
            (byte) 0xf2, (byte) 0xd2, (byte) 0x3e, (byte) 0x19};
        int iterations = 3;
        init(pass, salt, iterations);
        return;
    }

    public void init(char[] pass, byte[] salt, int iterations) throws SecurityException {
        try {
            PBEParameterSpec ps = new javax.crypto.spec.PBEParameterSpec(salt, 20);
            SecretKeyFactory kf = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
            SecretKey k = kf.generateSecret(new javax.crypto.spec.PBEKeySpec(pass));
            encryptCipher = Cipher.getInstance("PBEWithMD5AndDES/CBC/PKCS5Padding");
            encryptCipher.init(Cipher.ENCRYPT_MODE, k, ps);
            decryptCipher = Cipher.getInstance("PBEWithMD5AndDES/CBC/PKCS5Padding");
            decryptCipher.init(Cipher.DECRYPT_MODE, k, ps);
        } catch (Exception e) {
            throw new SecurityException("Could not initialize CryptoLibrary: " + e.getMessage());
        }
    }

    /**
     * convenience method for encrypting a string.
     *
     * @param str Description of the Parameter
     * @return String the encrypted string.
     * @exception SecurityException Description of the Exception
     */
    public synchronized String encrypt(String str) throws SecurityException {
        try {
            byte[] utf8 = str.getBytes("UTF8");
            byte[] enc = encryptCipher.doFinal(utf8);
            return encoder.encode(enc);
        } catch (Exception e) {
            throw new SecurityException("Could not encrypt: " + e.getMessage());
        }
    }

    /**
     * convenience method for encrypting a string.
     *
     * @param str Description of the Parameter
     * @return String the encrypted string.
     * @exception SecurityException Description of the Exception
     */
    public synchronized String decrypt(String str) throws SecurityException {
        try {
            byte[] dec = decoder.decodeBuffer(str);
            byte[] utf8 = decryptCipher.doFinal(dec);
            return new String(utf8, "UTF8");
        } catch (Exception e) {
            throw new SecurityException("Could not decrypt: " + e.getMessage());
        }
    }


}

