/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlet.Email;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import br.com.avicultura.chicken_tracker.Servlets.Perfil.ConsultaPerfil;
import br.com.avicultura.chicken_tracker.Utils.Email;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vinic
 */
public class EmailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) //CONFIRMAR E-MAIL
            throws ServletException, IOException {
        if (request.getParameter("seila").equals("YDLinstaPECrebanho")) {
            String usuario = request.getParameter("usuario");
            Perfil perfil = ConsultaPerfil.findById(usuario);
            perfil.setConfirmacaoEmail('S');
            HibernateUtil<Perfil> hup = new HibernateUtil<>();
            hup.atualizar(perfil);
            HttpSession sessao = request.getSession();
            sessao.setAttribute("usuario", perfil);
            sessao.setAttribute("usuario_logado", "true");
            sessao.setAttribute("nome_usuario", perfil.getUsuario());
            response.sendRedirect(
                    "seusNegocios/negocios.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String butao = request.getParameter("opcao");
        HttpSession session = request.getSession();
        if (butao.equals("esqueceuSenha")) {
            String usuario = request.getParameter("usuario");
            Perfil p = ConsultaPerfil.findById(usuario);
            Email email = new Email();
            email.setAssunto("Recuperação de senha - Chicken Tracker");
            email.setEmailDestinario(p.getEmail());
            email.setMsg("Você esqueceu sua senha? Além de idiota é burro. Se for de quimica, tudo bem"
                    + "\nClique nesse link e troque sua senha linda <3\n\n"
                    + "Link: localhost:8080/Chicken_Tracker/main/esqueceuSenha.jsp?usuario=" + usuario);

            if (email.enviarGmail()) {
                response.sendRedirect("");//Enviou
            } else {
                session.setAttribute("erroOutro", "Erro inesperado ao enviar e-mail");
                response.sendRedirect("excecoes/Outros.jsp");
            }
        } else if (butao.equals("trocarSenha")) {
            String senha = request.getParameter("senha");
            String usuario = request.getParameter("usuario");
            Perfil perfil = ConsultaPerfil.findById(usuario);
            perfil.setSenha(senha);
            HibernateUtil<Perfil> hup = new HibernateUtil<>();
            if (hup.atualizar(perfil).equals("")) {
                response.sendRedirect(
                        "seusNegocios/negocios.jsp");
            } else {
                response.getWriter().println("Seila");
            }
        } else if (butao.equals("faleConosco")) {
            String emailDestinario = request.getParameter("email");
            String assunto = request.getParameter("assunto");
            String mensagem = request.getParameter("mensagem");
            Email email = new Email();
            email.setAssunto(assunto);
            email.setEmailDestinario("ChickentrackerChickentracker@gmail.com");
            email.setMsg("Email: " + emailDestinario + "\n\nMensagem:" + mensagem);
            if (email.enviarGmail()) {
                response.getWriter().println("Certo");
            } else {
                session.setAttribute("erroOutro", "Erro inesperado ao enviar e-mail");
                response.sendRedirect("excecoes/Outros.jsp");
            }
        }

    }

}
