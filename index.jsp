<html>

<head>
	<title>Bulletin Board - add title - mod title</title>
</head>

<body>
  <%@ page import = "java.lang.*" %>
  <%@ page import = "java.sql.*" %>
    
  <%
      Class.forName("org.mariadb.jdbc.Driver");
      String url = "jdbc:mariadb://localhost:3306/javatest?user=javauser&password=javadude";
      Connection conn = DriverManager.getConnection(url);      

//      Connection conn = DriverManager.getConnection("jdbc/TestDB");

      Statement stmt = conn.createStatement();
 
      String sqlStr = "select * from testdata";
 
      ResultSet rset = stmt.executeQuery(sqlStr);
  %>
        <table border=1>
          <tr>
            <th>Seq</th>
            <th>Name</th>
            <th>ID</th>
          </tr>
  <%
      while (rset.next()) {
  %>
          <tr>
            <td><%= rset.getInt("id") %></td>
            <td><%= rset.getString("foo") %></td>
            <td><%= rset.getInt("bar") %></td>
          </tr>
  <%
      }
  %>
        </table>
 
  <%
    try {
    	  rset.close();
      	stmt.close();
      	conn.close();
    } catch (Exception e) {
    	System.out.println("Exception : " + e.getMessage());
	}

  %>

<!--
	<table border=1>
		<tr>
			<th>SEQ
			</th>
			<th>TITLE
			</th>
			<th>WRITER
			</th>
			<th>DATE
			</th>
		</tr>

		<tr>
			<td>100001
			</td>
			<td>Bible was written by Mattew called Matthew's good news
			</td>
			<td>Matthew
			</td>
			<td>2017.11.01
			</td>
		</tr>

		<tr>
			<td>100002
			</td>
			<td>Abraham was meant to give his son to God, because God wanted to do that
			</td>
			<td>Abraham
			</td>
			<td>2017.11.02
			</td>
		</tr>	</table>
-->

<!--%
  Connection conn = null;
  Statement stmt = null;  // Or PreparedStatement if needed
  ResultSet rs = null;

  try {
    conn = ... get connection from connection pool ...
    stmt = conn.createStatement("select ...");

    rs = stmt.executeQuery();
    ... iterate through the result set ...
    rs.close();
    rs = null;
    stmt.close();
    stmt = null;
    conn.close(); // Return to connection pool
    conn = null;  // Make sure we don't close it twice

  } catch (SQLException e) {
  } finally {
    // Always make sure result sets and statements are closed,
    // and the connection is returned to the pool
    if (rs != null) {
      try { rs.close(); } catch (SQLException e) { ; }
      rs = null;
    }
    if (stmt != null) {
      try { stmt.close(); } catch (SQLException e) { ; }
      stmt = null;
    }
    if (conn != null) {
      try { conn.close(); } catch (SQLException e) { ; }
      conn = null;
    }
  }

%-->


<!--
  <%
    double num = Math.random();
    if (num > 0.95) {
  %>
      <h2>You'll have a luck day!</h2><p>(<%= num %>)</p>
  <%
    } else {
  %>
      <h2>Well, life goes on ... </h2><p>(<%= num %>)</p>
  <%
    }
  %>
  <a href="<%= request.getRequestURI() %>"><h3>Try Again</h3></a>
-->


</body>	

</html>