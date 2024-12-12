<%-- 
    Document   : header
    Created on : 30 abr 2024, 14:37:05
    Author     : Alumno
--%>

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
<%
HttpSession sesion=request.getSession();
if (sesion.getAttribute("logueado")==null){
    response.sendRedirect("login.jsp");
    }
%>

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

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="assets/vendor/libs/apex-charts/apex-charts.css" />
        <link rel="stylesheet" href="assets/js/style.css" />
        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->

                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                    <div class="app-brand demo">
                        <a href="index.jsp" class="app-brand-link">
                            <img src="assets/img/escudo.png" height="70px" alt="alt"/>
                            <span class=" demo fw-bolder fs-5">Panel</span>
                        </a>

                        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                            <i class="bx bx-chevron-left bx-sm align-middle"></i>
                        </a>
                    </div>

                    <div class="menu-inner-shadow"></div>

                    <ul class="menu-inner py-1">
                        <!-- Dashboard -->




                        <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Administracion</span>
                        </li>
                        <li class="menu-item">
                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-cog"></i>
                                <div data-i18n="Account Settings">Mantenimiento</div>
                            </a>
                            <ul class="menu-sub">                                

                                <li class="menu-item">
                                    <a href="conceptos.jsp" class="menu-link">
                                        <div data-i18n="Connections">Conceptos</div>
                                    </a>
                                </li>
                                <li class="menu-item">
                                    <a href="ciudades.jsp" class="menu-link">
                                        <div data-i18n="Connections">Ciudades</div>
                                    </a>
                                </li>
                                <li class="menu-item">
                                    <a href="tipodeexamenes.jsp" class="menu-link">
                                        <div data-i18n="Connections">Tipos de Examen</div>
                                    </a>
                                </li>

                                <li class="menu-item">
                                    <a href="instructores.jsp" class="menu-link">
                                        <div data-i18n="Notifications">Instructores</div>
                                    </a>
                                </li>

                                <li class="menu-item">
                                    <a href="compañia.jsp" class="menu-link">
                                        <div data-i18n="Connections">Compañias</div>
                                    </a>
                                </li>
                                <li class="menu-item">
                                    <a href="pelotones.jsp" class="menu-link">
                                        <div data-i18n="Connections">Pelotones</div>
                                    </a>
                                </li>

                                <li class="menu-item">
                                    <a href="secciones.jsp" class="menu-link">
                                        <div data-i18n="Connections">Secciones</div>
                                    </a>
                                </li>
                                <li class="menu-item">
                                    <a href="materias.jsp" class="menu-link">
                                        <div data-i18n="Connections">Materias</div>
                                    </a>
                                </li>
                                <li class="menu-item">
                                    <a href="examenesp.jsp" class="menu-link">
                                        <div data-i18n="Tables">Examenes</div>
                                    </a>
                                </li>
                                <li class="menu-item">
                                    <a href="periodos.jsp" class="menu-link">
                                        <div data-i18n="Tables">Periodos</div>
                                    </a>
                                </li> 
                            </ul>
                        </li>
                        <!-- Tables -->
                        <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Ingreso</span>
                        </li>
                        <li class="menu-item">
                            <a href="inscripciones.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-globe"></i>
                                <div data-i18n="Tables">Inscriptos online</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="postulantes.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-user"></i>
                                <div data-i18n="Tables">Postulantes</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="resultados.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-check-square"></i>
                                <div data-i18n="Tables">Calificaciones</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="ingresante.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-user-check"></i>
                                <div data-i18n="Tables">Ingresantes</div>
                            </a>
                        </li>
                        <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Finanzas</span>
                        </li>
                        <li class="menu-item">
                            <a href="facturacion.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-money"></i>
                                <div data-i18n="Tables">Facturacion</div>
                            </a>
                        </li>
                        <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Informes</span>
                        </li>
                        <li class="menu-item">
                            <a href="informefacturageneral.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-file"></i>
                                <div data-i18n="Tables">Facturas Gral.</div>
                            </a>
                        </li>
                         <li class="menu-item">
                            <a href="informefacturadetallado.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-file-find"></i>
                                <div data-i18n="Tables">Facturas Detall.</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="informeresultadosgeneral.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-file"></i>
                                <div data-i18n="Tables">Calificaciones Gral.</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="informeresultadosdetallado.jsp" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-file-find"></i>
                                <div data-i18n="Tables">Calificaciones Detall.</div>
                            </a>
                        </li>
                    </ul>
                </aside>


                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->

                    <nav
                        class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                        id="layout-navbar"
                        >
                        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                <i class="bx bx-menu bx-sm"></i>
                            </a>
                        </div>

                        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">


                            <ul class="navbar-nav flex-row align-items-center ms-auto">
                                <!-- Place this tag where you want the button to render. -->


                                <!-- User -->
                                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                    <a class="nav-link dropdown-toggle hide-arrow d-flex" href="javascript:void(0);" data-bs-toggle="dropdown">
                                        <span class="fw-semibold d-block"><%=sesion.getAttribute("user") %></span><i class="menu-icon tf-icons bx bx-chevron-down"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="logout.jsp">
                                                <i class="bx bx-power-off me-2"></i>
                                                <span class="align-middle">Cerrar sesion</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <!--/ User -->
                            </ul>
                        </div>
                    </nav>

                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">
