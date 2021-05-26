<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>
<center>

 <style>
      div {
        width: 100%;
        height: 100%;
     
        border: 0px solid #003458;
      }
      div.left {
        width: 70%;
        float: left;
         paddig:30px;
        box-sizing: border-box;
        background: #DEE7F3;
      }
      div.right {
        width: 30%;
        float: right;
        paddig:30px;
        box-sizing: border-box;
        background: #ece6cc;
      }
    </style> 
    
<body>    
<div class="left">

${pageName }
<h4>언제 바뀌나 테스트</h4>

${exam }
 <c:forEach var="exams" items="${exams }">
</c:forEach> 
</div>
<div class="right">
<table>
<tr></tr>
<tr>

<td>①</td><td>②</td><td>③</td><td>④</td>
 <c:forEach var="marks" items="${marks }">
</c:forEach> 
</tr>
${omr }
</table>
</div>


</center>
</body>