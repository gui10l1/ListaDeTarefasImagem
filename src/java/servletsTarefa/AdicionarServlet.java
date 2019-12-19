/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servletsTarefa;

import classes.TarefaDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.Tarefa;
import modelo.Usuario;

/**
 *
 * @author Aluno07
 */
@WebServlet(name="AdicionarServlet", urlPatterns={"/AdicionarServlet"})
@MultipartConfig
public class AdicionarServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();

        Usuario u = (Usuario) session.getAttribute("usuario");

        if (u == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        ArrayList<Tarefa> tarefas = TarefaDAO.buscarTarefaDoUsusario(u);
        u.setTarefas(tarefas);

        request.setAttribute("tarefas", tarefas);
        
        request.getRequestDispatcher("WEB-INF/adicionar.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
        
        String imagem = null;
        String assunto = request.getParameter("assunto");
        Part arquivoImagem = request.getPart("imagem");
        String nomeImagem = Paths.get(arquivoImagem.getSubmittedFileName()).getFileName().toString();
        
        String diretorio = "/Users/Aluno07/Desktop/imagem_tarefa";
        String idUsuario = String.valueOf(u.getId());
        
        File diretorioDoUsuario = new File(diretorio, idUsuario); 
        
        if(diretorioDoUsuario.exists() || diretorioDoUsuario.mkdir()){
            File diretorioDaImagem = new File(diretorioDoUsuario, nomeImagem);
            
            try(InputStream stream = arquivoImagem.getInputStream()){
                Files.copy(stream, diretorioDaImagem.toPath(), StandardCopyOption.REPLACE_EXISTING);
                
                imagem = nomeImagem;
            }
        }
                        
        Tarefa t = new Tarefa();
        
        t.setAssunto(assunto);
        t.setIdUsuario(u.getId()); 
        t.setCaminhoImagem(imagem); 
        
        boolean inserido = TarefaDAO.inserirTarefa(t);
        
        if(inserido){
            response.sendRedirect("HomeServlet"); 
        }else{
            request.setAttribute("erro", "Algum erro aconteceu");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
