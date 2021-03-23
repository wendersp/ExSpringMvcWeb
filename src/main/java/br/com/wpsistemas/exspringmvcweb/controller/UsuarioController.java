/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.wpsistemas.exspringmvcweb.controller;

import br.com.wpsistemas.exspringmvcweb.modelo.dao.UsuarioDao;
import br.com.wpsistemas.exspringmvcweb.modelo.entidades.Usuario;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author wender
 */
@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    private UsuarioDao usuarioDao;

    @RequestMapping(value = "listarTodos", method = RequestMethod.GET)
    public ModelAndView listaTodos(ModelMap model) {
        model.addAttribute("usuarios", usuarioDao.listarTodos());
        return new ModelAndView("usuario/usuarioCons", model);
    }

    @GetMapping(value = "novo")
    public String Novo(@ModelAttribute("usuario") Usuario usuario, ModelMap model) {
        return "usuario/usuarioFrm";
    }

    @PostMapping("/salvar")
    public String salvar(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult result, RedirectAttributes attr) {
        if (result.hasErrors()) {
            return "usuario/usuarioFrm";
        }
        String msg;
        if (usuario.getId() == null) {
            usuario.setId(System.currentTimeMillis());
            usuarioDao.incluir(usuario);
            msg = "Usuario salvo com sucesso...";
        } else {
            usuarioDao.alterar(usuario);
            msg = "Usuario alterado com sucesso...";
        }
        attr.addFlashAttribute("message", msg);
        return "redirect:/usuario/listarTodos";
    }

    @GetMapping("/alterar/{id}")
    public ModelAndView alterar(@PathVariable("id") Long id, ModelMap model) {
        Usuario usuario = usuarioDao.pesquisar(id);
        model.addAttribute("usuario", usuario);
        return new ModelAndView("usuario/usuarioFrm", model);
    }

    @GetMapping("/excluir/{id}")
    public String excluir(@PathVariable("id") Long id, RedirectAttributes attr) {
        Usuario usuario = usuarioDao.pesquisar(id);
        usuarioDao.excluir(usuario);
        attr.addFlashAttribute("message", "Usuário excluído com sucesso.");
        return "redirect:/usuario/listarTodos";
    }

}
