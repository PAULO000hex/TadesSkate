package main.java.br.sp.senac.tads3a.grupo1.utils;

import at.favre.lib.crypto.bcrypt.BCrypt;

/**
 *
 * @author Wesley
 */
public class CryptoUtils {

    public static String hashSenha(String senhaAberta) {
        return BCrypt.withDefaults().hashToString(12, senhaAberta.toCharArray());
    }

    public static boolean verificarSenha(String senhaAberta, String senhaFechada) {
        BCrypt.Result result = BCrypt.verifyer().verify(senhaAberta.toCharArray(), senhaFechada);
        return result.verified;
        
    }

    public static void main(String[] args) {
        String senha = "admin";
        String crypt = hashSenha(senha);

        System.out.println("Hash: " + crypt);


    }
}
