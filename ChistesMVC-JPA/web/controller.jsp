<%-- 
    Document   : controller
    Created on : 11-ene-2018, 13:03:27
    Author     : Alvaro
--%>



<%@page import="javax.persistence.Query"%>
<%@page import="entities.Chiste"%>
<%@page import="java.util.List"%>
<%@page import="entities.Categoria"%>
<%@page import="jpautil.JPAUtil"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            EntityManager em = null;
        
            em = (EntityManager)session.getAttribute("em");
            List<Categoria> listaCategorias;
            List<Chiste> chistesMejores;
            String sql;
            Query query;
            
            
            if (em==null) {
                em=JPAUtil.getEntityManagerFactory().createEntityManager();
                session.setAttribute("em", em);
            }
            String op;
            op=request.getParameter("op"); 
            
            if(op.equals("inicio")){
                listaCategorias = em.createNamedQuery("Categoria.findAll").getResultList();
                session.setAttribute("listaCategorias", listaCategorias);
                
                
                

        %>    
                <jsp:forward page="principal.jsp"/>
            <% 
            }else if(op.equals("categoria")){
            
            
            listaCategorias = (List<Categoria>)session.getAttribute("listaCategorias");
            List<Chiste> listaChistesC = (List<Chiste>)listaCategorias.get(Short.parseShort(request.getParameter("idCategoria"))).getChisteList();
            request.setAttribute("listaChistes", listaChistesC);

            %>
           <jsp:forward page="principal.jsp"/>
            
            <%}else if(op.equals("mejores")){
                sql="select p.idchiste from Puntos p group by p.idchiste order by avg(p.puntos) DESC";
                query=em.createQuery(sql);
                chistesMejores= (List<Chiste>) query.getResultList();
                session.setAttribute("chistesMejores", chistesMejores);

            %>
            <jsp:forward page="principal.jsp"/>
            <%}%>
    </body>
</html>
