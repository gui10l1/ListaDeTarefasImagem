package servletsTarefa;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;


@WebServlet(name="MostarImagemTarefaServlet", urlPatterns={"/MostarImagemTarefaServlet"})
public class MostarImagemTarefaServlet extends HttpServlet { 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String imagem = request.getParameter("imagem");
        
        HttpSession session = request.getSession();
        
        Usuario u = (Usuario) session.getAttribute("usuario");
        
        String idUsuario = String.valueOf(u.getId());
        
        String diretorio = "/Users/Aluno07/Desktop/imagem_tarefa";
        
        File diretorioDoUsuario = new File(diretorio, idUsuario);
        
        if(diretorioDoUsuario.exists()){
            File diretorioDaImagem = new File(diretorioDoUsuario, imagem);
            
            try(InputStream stream = Files.newInputStream(diretorioDaImagem.toPath(), StandardOpenOption.READ)){
                 String contentType = URLConnection.guessContentTypeFromStream(stream);
                 
                 response.setContentType(contentType);
                 
                 byte[] buffer = new byte[1240];
                 
                 while(stream.read(buffer) != -1){
                     
                     response.getOutputStream().write(buffer);
                     
                 }
            }
            
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
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
