/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Compilador;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author Bios
 */
public class TesteAnalisador {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        //Coloque o caminho do Code.txt
        Lexer analisador = new Lexer(new BufferedReader(new FileReader("")));
        while (true) {
            Token token = analisador.yylex();
            if(token == null) break;
        }        
    }
    
}
