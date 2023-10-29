package clickashowbooking;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Encryption {
	
	private  SecretKeySpec sk;
	private  byte[] key;

	  public  void setKey( String k) {
	    MessageDigest sha = null;
	    try {
	      key = k.getBytes("UTF-8");
	      sha = MessageDigest.getInstance("SHA-1");
	      key = sha.digest(key);
	      key = Arrays.copyOf(key, 16);
	      sk = new SecretKeySpec(key, "AES");
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }

	  
	  public  String encrypt( String s,  String secret) {
	    try {
	      setKey(secret);
	      Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	      cipher.init(Cipher.ENCRYPT_MODE, sk);
	      return Base64.getEncoder()
	        .encodeToString(cipher.doFinal(s.getBytes("UTF-8")));
	    } catch (Exception e) {
		      e.printStackTrace();
	    }
	    return null;
	  }

	  public  String decrypt( String s,  String secret) {
	    try {
	      setKey(secret);
	      Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
	      cipher.init(Cipher.DECRYPT_MODE, sk);
	      return new String(cipher.doFinal(Base64.getDecoder()
	        .decode(s)));
	    } catch (Exception e) {
		      e.printStackTrace();
	    }
	    return null;
	  }
}
