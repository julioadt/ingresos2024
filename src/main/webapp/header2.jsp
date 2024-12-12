<%-- 
    Document   : header
    Created on : 30 abr 2024, 14:37:05
    Author     : Alumno
--%>
<%@include file="jsp/conexion.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->


<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Ingresos 2024</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="assets/img/escudo.png" />
        
        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />
        <script src="assets/vendor/libs/jquery/jquery.js"></script>
        <script src="assets/js/index.var.js"></script>

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="assets/css/demo.css" />
        <link rel="stylesheet" href="assets/js/style.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="assets/vendor/libs/apex-charts/apex-charts.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
        
        <style>
            .pointr{
                cursor: pointer;
            }
        </style>
        
    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->

                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                   

                    <div class="menu-inner-shadow"></div>

                    <ul class="menu-inner py-1">
                        
                        
                        <li class="menu-item mt-5">
                            <a href="login.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-user"></i>
                                <div data-i18n="Tables">ADMINISTRACION</div>
                            </a>
                        </li>
                        
                        
                        
                         <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Inscripcion</span>
                        </li>


                        <li class="menu-item">
                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-file"></i>
                                <div data-i18n="Account Settings">Inscribete</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item">
                                    <a href="inscripcion.jsp" class="menu-link">
                                        <div data-i18n="Connections">Nueva Inscripcion</div>
                                    </a>


                            </ul>
                        </li>
                        <!-- Dashboard -->



                         <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Ingresantes</span>
                        </li>
                        <%  

       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from periodos where estado='PUBLICO';");
   while(rs.next()){
                        %>
                        <li class="menu-item pointr periods" indice="<%=rs.getString(1)%>">
                            <a onclick="cargaringresantes('<%=rs.getString(1)%>')" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-calendar-check"></i>
                                <div data-i18n="Tables"><%=rs.getString(2)%></div>
                            </a>
                        </li>
                        <%
                            }
                        }
                        catch (Exception e) {
                          out.println("error PSQL"+ e); 
                        }
                        %>








                    </ul>
                </aside>


                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->

                    <nav
                        class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                        id="layout-navbar" style="height: 150px;"
                        >
                        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                <i class="bx bx-menu bx-sm"></i>
                            </a>
                        </div>

                        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">

                            <div class="d-flex px-5">
                                <img src="assets/img/escudo.png" height="120px" alt="alt"/>
                                <h2 class="mt-5">Ingreso a las Fuerzas Armadas</h2>
                            </div>
                            
                        </div>
                    </nav>

                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">
