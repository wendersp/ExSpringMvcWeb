/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.wpsistemas.exspringmvcweb.modelo.dao;

import br.com.wpsistemas.exspringmvcweb.modelo.entidades.Usuario;
import java.util.List;

/**
 *
 * @author wender
 */
public interface UsuarioDao {
    
    void incluir(Usuario usuario);
    
    void alterar(Usuario usuario);
    
    void excluir(Usuario usuario);
    
    Usuario pesquisar(Long id);
    
    List<Usuario> pesquisar(String nome);
    
    List<Usuario> listarTodos();
    
    
    
}
