/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletsUsuario;

import classes.UsuarioDAO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.Usuario;

/**
 *
 * @author Aluno05
 */
@WebServlet(name = "AtualizarServlet", urlPatterns = {"/AtualizarServlet"})
@MultipartConfig
public class AtualizarServlet extends HttpServlet {
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Usuario u = (Usuario) session.getAttribute("usuario");
        
        request.getRequestDispatcher("WEB-INF/perfil.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario u = (Usuario) session.getAttribute("usuario");
        
        String senha = request.getParameter("senha");
        
                 
        if(senha.length() < 6 || senha.length() > 15){
            request.setAttribute("erro", "A senha deve conter entre 6 e 15 caracteres!");
            request.getRequestDispatcher("WEB-INF/perfil.jsp").forward(request, response); 
            return;
        } else {
            u.setSenha(senha); 
        }
        
        Part imagem = request.getPart("imagem");
        
        InputStream iStream = imagem.getInputStream();
        ByteArrayOutputStream oStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[10240];
        
        while (iStream.read(buffer) > 0 ) {
            oStream.write(buffer);
        }

        
        u.setImagem(oStream.toByteArray());
        
        boolean atualizado = UsuarioDAO.atualizarUsuario(u);
        
        String msg = "";
        
        if (atualizado) {
            msg = "Dados atualizados com sucesso";
        } else {
            msg = "Erro ao atualizar os dados. Tente novamente";
        }
        
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("WEB-INF/perfil.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
