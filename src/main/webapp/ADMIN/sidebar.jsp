
  <%@page import="entities.admin"%>
  <%@page import="dao.clientDAO"%>
  
  <%
  
  	clientDAO adao = new clientDAO();
  
  	admin a = new admin();
  
  	if(session.getAttribute("admin") == null){
  		response.sendRedirect("login.jsp");
  	}else{
  		a = (admin)session.getAttribute("admin");
  	}
  
  %>
  
  
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block"><%=a.getName() %></a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="index.jsp" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Phones
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="phones.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Phones</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="addPhone.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add phone</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="categories.jsp" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                Categories
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="orders.jsp" class="nav-link">
              <i class="nav-icon fas fa-truck-fast"></i>
              <p>
                Orders
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="users.jsp" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Users
              </p>
            </a>
          </li> 
          <li class="nav-item">
            <a href="actionAdmin?action=Logout" class="nav-link">
              <i class="nav-icon fas fa-power-off"></i>
              <p>
                Logout
              </p>
            </a>
          </li> 
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
