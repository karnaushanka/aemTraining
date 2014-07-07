<%@include file="/libs/foundation/global.jsp"%>
<div class="first_level_menu">
<ul class="first_level">
      <li class="list_item_first_level">
      <a href="">
          <span class="logo"> <img alt="" src="/content/dam/viachaslau/logo-white.png"></span>
          </a>
    </li>
<%
%><%@ page import="java.util.Iterator,
        com.day.text.Text, 
        com.day.cq.wcm.api.PageFilter, com.day.cq.wcm.api.Page" %><%
    /* get starting point of navigation */
    Page navRootPage = currentPage.getAbsoluteParent(2); 
    if (navRootPage == null && currentPage != null) { 
    navRootPage = currentPage; 
    }
    if (navRootPage != null) { 
        Iterator<Page> children = navRootPage.listChildren(new PageFilter(request));
        while (children.hasNext()) { 
            Page child = children.next(); 
            %>
    <li class="list_item_first_level">
      <a href="<%= child.getPath() %>.html">
         <%= child.getTitle() %></a>
    </li>

<%
        } 
    } 
%>
    </ul>
</div>
<div class="second_level_menu">
<ul class="second_level">
    <%
%><%@ page import="java.util.Iterator,
         com.day.cq.wcm.api.PageFilter"%><%
     /* Create a new Page object using the path of the current page */    
     String listroot = properties.get("listroot", currentPage.getPath());
     Page rootPage = pageManager.getPage(listroot);
     /* iterate through the child pages and gather properties */
     if (rootPage != null) {
         Iterator<Page> children = rootPage.listChildren(new PageFilter(request));
         while (children.hasNext()) {
             Page child = children.next();
             String title = child.getTitle() == null ? child.getName() : child.getTitle();
             String date = child.getProperties().get("date","");
             %>
 <li class="list_item_second_level">
      <a href="<%= child.getPath() %>.html">
         <%= child.getTitle() %></a>
    </li>

    <%
         }
     }
 %>