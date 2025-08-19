<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, java.io.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.MessagingException" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.MimeBodyPart" %>
<%@ page import="javax.mail.internet.MimeMultipart" %>
<%@ page import="javax.mail.util.ByteArrayDataSource" %>
<%@ page import="oracle.jdbc.pool.OracleDataSource" %>
<%@ page import="com.itextpdf.text.Document" %>
<%@ page import="com.itextpdf.text.Paragraph" %>
<%@ page import="com.itextpdf.text.pdf.PdfWriter" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.lang.StringBuilder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <!-- ==================== BLOCO 1: Meta Tags ==================== -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ==================== TITLE ==================== -->
    <title>Ford Fancar</title>

    <!-- ==================== BLOCO 2: Importação de CSS ==================== -->
     <link rel="stylesheet" href="css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link rel="icon" href="assets/icons/Logo_ford_Vertical.png" type="image/x-icon">

    <style>
        @font-face {
            font-family: 'Poppins';
            src: url('..assets/fonts/Poppins/Poppins-Regular.woff2') format('woff2'),
                url('..assets/fonts/Poppins/Poppins-Regular.woff') format('woff'),
                url('..assets/fonts/Poppins/Poppins-Regular.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        /* Estilos para o site Ford Fancar - Versão moderna e responsiva */

        /* Variáveis CSS */
        :root {
            /* Cores principais */
            --ford-blue: #0B2D5C;
            --ford-blue-light: #1E4D8C;
            --ford-blue-dark: #071D3A;
            --accent-color: #0066FF;
            --accent-hover: #0052CC;
            
            /* Cores neutras */
            --white: #FFFFFF;
            --off-white: #F5F7FA;
            --light-gray: #E5E9F0;
            --medium-gray: #9BA4B4;
            --dark-gray: #4A5568;
            --black: #1A202C;
            
            /* Gradientes */
            --gradient-blue: linear-gradient(135deg, var(--ford-blue-light) 0%, var(--ford-blue) 100%);
            --gradient-blue-dark: linear-gradient(135deg, var(--ford-blue) 0%, var(--ford-blue-dark) 100%);
            --gradient-accent: linear-gradient(135deg, var(--accent-color) 0%, var(--ford-blue-light) 100%);
            
            /* Sombras */
            --shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 8px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 8px 16px rgba(0, 0, 0, 0.15);
            --shadow-xl: 0 12px 24px rgba(0, 0, 0, 0.2);
            
            /* Bordas */
            --border-radius-sm: 4px;
            --border-radius-md: 8px;
            --border-radius-lg: 12px;
            --border-radius-xl: 20px;
            --border-radius-full: 9999px;
            
            /* Tipografia */
            --font-family: 'Montserrat', sans-serif;
            --font-size-xs: 0.75rem;   /* 12px */
            --font-size-sm: 0.875rem;  /* 14px */
            --font-size-md: 1rem;      /* 16px */
            --font-size-lg: 1.125rem;  /* 18px */
            --font-size-xl: 1.25rem;   /* 20px */
            --font-size-2xl: 1.5rem;   /* 24px */
            --font-size-3xl: 1.875rem; /* 30px */
            --font-size-4xl: 2.25rem;  /* 36px */
            --font-size-5xl: 3rem;     /* 48px */
            
            /* Espaçamento */
            --spacing-xs: 0.25rem;  /* 4px */
            --spacing-sm: 0.5rem;   /* 8px */
            --spacing-md: 1rem;     /* 16px */
            --spacing-lg: 1.5rem;   /* 24px */
            --spacing-xl: 2rem;     /* 32px */
            --spacing-2xl: 3rem;    /* 48px */
            --spacing-3xl: 4rem;    /* 64px */
            
            /* Transições */
            --transition-fast: 0.2s ease;
            --transition-normal: 0.3s ease;
            --transition-slow: 0.5s ease;
            --transition-very-slow: 0.8s ease;
            
            /* Z-index */
            --z-negative: -1;
            --z-normal: 1;
            --z-dropdown: 10;
            --z-sticky: 100;
            --z-fixed: 200;
            --z-modal: 300;
            --z-popover: 400;
            --z-tooltip: 500;
        }

        /* Reset e Estilos Base */
        *, *::before, *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .main-header-nav-mobile {
            display: none;
        }

        html {
            font-size: 16px;
            scroll-behavior: smooth;
        }

        body {
            font-family: "poppins", sans-serif;
            overflow-x: hidden;
        }

        a {
            text-decoration: none;
            color: inherit;
            transition: color var(--transition-normal);
        }

        ul {
            list-style: none;
        }

        img {
            max-width: 100%;
            height: auto;
            display: block;
        }

        button, 
        .button {
            cursor: pointer;
            border: none;
            outline: none;
            background: none;
            font-family: inherit;
        }

        input, 
        textarea,
        select {
            font-family: inherit;
            border: none;
            outline: none;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 var(--spacing-lg);
        }

        /* Loader */
        .loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: var(--white);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: var(--z-modal);
            transition: opacity 0.5s ease, visibility 0.5s ease;
        }

        .loader-content {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .loader-logo {
            width: 100px;
            height: 30px;
            margin-bottom: var(--spacing-lg);
        }

        .loader-bar {
            width: 200px;
            height: 4px;
            background-color: var(--light-gray);
            border-radius: var(--border-radius-full);
            overflow: hidden;
            position: relative;
        }

        .loader-bar span {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 0;
            background: var(--gradient-blue);
            animation: loading 2s infinite ease-in-out;
        }

        @keyframes loading {
            0% {
                width: 0;
                left: 0;
            }
            50% {
                width: 100%;
                left: 0;
            }
            100% {
                width: 0;
                left: 100%;
            }
        }

        /* Header */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #00065f;
            z-index: var(--z-sticky);
            transition: all var(--transition-normal);
        }

        .header-wrapper {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 80px;
        }

        .logo {
            flex: 0 0 auto;
        }

        .main-nav {
            flex: 1 1 auto;
            display: flex;
            justify-content: flex-end;
        }

        .nav-list {
            display: flex;
            align-items: center;
        }

        .nav-item {
            margin-left: var(--spacing-xl);
        }

        .nav-link {
            font-size: var(--font-size-md);
            font-weight: 500;
            color: var(--white);
            position: relative;
            padding: var(--spacing-xs) 0;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: var(--white);
            transform: scaleX(0);
            transform-origin: right;
            transition: transform var(--transition-normal);
        }

        .nav-link:hover {
            color: var(--white);
        }

        .nav-link:hover::after {
            transform: scaleX(1);
            transform-origin: left;
        }

        .menu-toggle {
            display: none;
            flex-direction: column;
            justify-content: space-between;
            width: 30px;
            height: 20px;
            background: none;
            border: none;
            cursor: pointer;
            position: absolute;
            top: 30px;
            right: 30px;
            z-index: 1000;
        }

        .menu-toggle span {
            display: block;
            height: 3px;
            background: #fff;
            border-radius: 2px;
            transition: 0.3s ease;
            width: 100%;
            z-index: 1000;
        }

        .menu-toggle.active span:nth-child(1) {
            transform: rotate(45deg) translate(5px, 5px);
        }

        .menu-toggle.active span:nth-child(2) {
            opacity: 0;
        }

        .menu-toggle.active span:nth-child(3) {
            transform: rotate(-45deg) translate(6px, -6px);
        }

        .bar {
            width: 100%;
            height: 2px;
            background-color: var(--white);
            border-radius: var(--border-radius-full);
            transition: all var(--transition-normal);
        }

        /* Hero Section */
        .hero {
            padding-top: 80px;
            background-color: #ececec;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            padding: var(--spacing-3xl) 0;
        }

        /* Slider */
        .slider-container {
            flex: 0 0 60%;
            max-width: 60%;
            position: relative;
            overflow: hidden;
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-lg);
        }

        .slider {
            position: relative;
            width: 100%;
            height: 500px;
        }

        .slide {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity var(--transition-slow);
            background-color: #00065f;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .slide.active {
            opacity: 1;
            z-index: var(--z-normal);
        }

        .slide-content {
            text-align: center;
            padding: var(--spacing-xl);
            width: 100%;
        }

        .slide-title {
            font-size: var(--font-size-4xl);
            font-weight: 700;
            color: var(--white);
            margin-bottom: var(--spacing-lg);
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .slide-image {
            max-width: 80%;
            margin: 0 auto;
            transition: transform var(--transition-slow);
        }

        .slide.active .slide-image {
            animation: fadeInUp 1s ease forwards;
        }

        .vehicle-img {
            max-width: 100%;
            height: auto;
        }

        .slider-control {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 50px;
            height: 50px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: var(--border-radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--white);
            font-size: var(--font-size-xl);
            z-index: 2;
            transition: all var(--transition-normal);
            cursor: pointer;
        }

        .slider-control:hover {
            background-color: rgba(255, 255, 255, 0.4);
        }

        .slider-control.prev {
            left: var(--spacing-md);
        }

        .slider-control.next {
            right: var(--spacing-md);
        }

        .slider-indicators {
            position: absolute;
            bottom: var(--spacing-lg);
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            z-index: var(--z-dropdown);
        }

        .indicator {
            width: 12px;
            height: 12px;
            border-radius: var(--border-radius-full);
            background-color: rgba(255, 255, 255, 0.3);
            margin: 0 var(--spacing-xs);
            cursor: pointer;
            transition: all var(--transition-normal);
        }

        .indicator.active {
            background-color: var(--white);
            width: 30px;
        }

        /* Formulário de Contato */
        .contact-form-container {
            flex: 0 0 35%;
            max-width: 35%;
            background-color: var(--white);
            border-radius: var(--border-radius-lg);
            padding: var(--spacing-xl);
            box-shadow: var(--shadow-lg);
        }

        .contact-form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: var(--spacing-lg);
            position: relative;
        }

        .form-control {
            width: 100%;
            padding: var(--spacing-md);
            background-color: var(--off-white);
            border: 2px solid transparent;
            border-radius: var(--border-radius-md);
            font-size: var(--font-size-md);
            transition: all var(--transition-normal);
        }

        .form-control:focus {
            border-color: var(--accent-color);
            background-color: var(--white);
            box-shadow: var(--shadow-sm);
        }

        .form-control::placeholder {
            color: var(--medium-gray);
        }

        .form-feedback {
            position: absolute;
            bottom: -18px;
            left: 0;
            font-size: var(--font-size-xs);
            color: #E53E3E;
        }

        .submit-button {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: var(--spacing-md) var(--spacing-lg);
            background-color: #00065f;
            font-size: var(--font-size-md);
            font-weight: 600;
            border-radius: var(--border-radius-md);
            position: relative;
            overflow: hidden;
        }

        .submit-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            transition: all var(--transition-normal);
        }

        .submit-button:hover::before {
            left: 100%;
        }

        .submit-button:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .submit-button i {
            margin-left: var(--spacing-sm);
            transition: transform var(--transition-normal);
        }

        .submit-button:hover i {
            transform: translateX(4px);
        }

         .submit-button span {
            color: white;
         }

        .car-parts-section-background-div {
            width: 100%;
            height: auto;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-items: center;
            justify-content: center;
        }

        .car-parts-section {
            width: 1200px;
            height: 700px;
            margin: 0 auto;
            background-color: #ffffff;
            display: flex;
            align-items: center;
            justify-items: center;
            justify-content: center;
        }

        .car-parts-section-center-content-div {
            width: 100%;
            height: 100%;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-items: center;
            justify-content: center;
        }

        .car-parts-section-center-content-div-title {
            width: 100%;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .car-parts-section-center-content-div-title h1 {
            font-size: 28px;
            font-weight: 600;
            color: #313131;
            font-family: 'Poppins', sans-serif;
        }


        .car-parts-section-center-content-div-presentation {
            width: 100%;
            height: 400px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .car-parts-section-center-content-div-center {
            margin-top: -100px;
            margin-right: -300px;
        }

        .car-parts-section-center-content-div-car-parts {
            width: 85%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .car-parts-section-center-content-div-car-parts-div {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .car-parts-section-center-content-div-car-parts-div-img {
            width: 1300px;
            height: 400px;
            margin: 0;
        }

        .info-icons {
            width: 1000px;
            height: 300px;
            position: absolute;
            display: flex;
            justify-content: space-between;
        }

        .info-icons img {
            width: 40px;
            height: 40px;
        }

        .info-icons img:hover {
            cursor: pointer;
        }

        .action-button-div {
            width: 40px;
            height: 40px;
        }

        .about-div {
            opacity: 0;
            visibility: hidden;
            position: absolute;
            width: 230px;
            background-color: #010651;
            font-weight: 300;
            font-family: 'Poppins', sans-serif;
            padding: 10px;
            border-radius: 5px;
            z-index: 1;
            transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out;
        }

        .action-button-div:hover .about-div {
            opacity: 1;
            visibility: visible;
        }

        .about-img-div {
            width: 100%;
            height: 50%;
        }

        .about-img-div img {
            width: 100%;
            height: 100%;
        }

        .about-text-div p {
            color: #ffffff;
            font-size: 13px;
            margin: 0;
        }

        .about-text-div b {
            color: #ffffff;
            font-size: 13px;
            margin: 0;
        }

        .car-parts-section-background-div-mob {
            display: none;
        }

        .mobile-slide {
            display: none;
        }



        .adress-section {
            width: 100%;
            height: 1000px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            justify-items: center;
            align-items: center;
            background-color: #cfcfcf;
        }

        .adress-section-center-content-div img {
            width: 100px;
            margin-top: 70px;
        }

        .adress-section-center-content-div p {
            text-align: justify;
            color: rgb(80, 80, 80);
            margin-top: 50px;
            margin-bottom: 50px;
        }

        .adress-section-center-content-div {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .adress-section-center-content-div h1 {
            font-size: 38px;
            font-weight: bold;
            font-family: 'Poppins', sans-serif;
            color: rgb(59, 59, 59);
            margin-top: 120px;
            margin-bottom: 40px;
        }

        .adress-section-center-content-carousel-div {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .adress-section-center-content-carousel-images-div {
            position: relative;
            width: 90%;
            max-width: 1100px;
            height: 600px;
            overflow: hidden;
        }

        .carousel-track {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .carousel-image {
            width: 100%;
            height: 600px;
            object-fit: cover;
            flex-shrink: 0;
        }

        .carousel-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            color: rgb(77, 77, 77);
            background-color: transparent;
            border: none;
            padding: 10px;
            cursor: pointer;
            z-index: 10;
        }

        .carousel-arrow.left-arrow {
            left: 10px;
        }

        .carousel-arrow.right-arrow {
            right: 10px;
        }

        .swiper {
            width: 100%;
            max-width: 1100px;
            height: 650px;
        }

        .swiper-slide {
            display: flex;
            flex-direction: column;
            justify-content: center;
            justify-items: center;
            align-items: center;
            justify-content: flex-start;
        }

        .swiper-slide img {
            width: 100%;
            height: 100%;
            max-height: 500px;
        }

        .mobile-section {
            display: none;
        }

        .mob {
            display: none;
        }

        .adress-section-mob {
            display: none;
        }

        .location-info {
            position: relative;
            display: flex;
            align-items: center;
            border-radius: 10px;
            background-color: #010651;
            left: 50%;
            transform: translateX(-50%);
            padding: 5px 10px;
            z-index: 9999;
        }

        .location-info a {
            text-decoration: none;
            color: white;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
        }

        .location-info p {
            color: white;
        }

        .location-info img.location-icon {
            width: 20px;
            height: 20px;
            margin-right: 8px;
        }

        .location-info p {
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
            color: #ffffff;
            margin: 0;
        }

        .location-info img {
            width: 30px;
            height: 30px;
            margin-right: 20px;
        }

        #whatsapp-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: transparent;
            border: none;
            cursor: pointer;
            z-index: 99999;
        }

        #whatsapp-btn img {
            width: 60px;
            height: auto;
        }
            
        #wa-container {
            position: fixed;
            bottom: 90px;
            right: 20px;
            width: 300px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: none;
            z-index: 99999;
            font-family: 'Poppins', sans-serif;
        }

        #wa-container input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-family: 'Poppins', sans-serif;
        }

        .checkbox {
            position: absolute;
            float: left;
            left: 0;
            text-align: left;
        }

        #wa-container p {
            font-size: 12px;
            color: #555;
            margin: 10px 0;
            line-height: 1.4;
        }

        #submit-btn {
            width: 100%;
            padding: 10px;
            background-color: #25D366;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

         .mobile-nav {
            display: none;
         }

         .main-footer {
            width: 100%;
            height: 380px;
            background-color: rgb(20, 20, 20);
        }

        .main-footer-center-content-div {
            width: 1200px;
            height: 100%;
            margin: 0 auto;
        }

        .main-footer-center-content-lists-div {
            display: flex;
        }

        .footer-img-div img {
            width: 180px;
            margin-top: 10px;
        }

        .main-footer-lists-div {
            margin-left: 100px;
            margin-right: 50px;
        }

        .main-footer-lists-div h4 {
            color: white;
            margin: 0;
            margin-top: 50px;
            margin-bottom: 8px;
            font-size: 20px;
            font-weight: 500;
        }

        .main-footer-lists-div ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .main-footer-lists-div ul li {
            margin-bottom: 4px;
            font-size: 15px;
            font-weight: 300;
        }

        .main-footer-lists-div a {
            color: rgb(245, 245, 245);
            text-decoration: none;
        }

        .main-footer-center-content-div hr {
            border: none;
            outline: 1px solid grey;
            margin-top: 50px;
        }

        .main-footer-icons {
            width: 30px;
            position: absolute;
            margin: 0;
        }

        .list-margin li {
            margin-left: 30px;
            margin-bottom: 15px;
        }

        .main-footer-center-content-div p {
            color: white;
            font-size: 13px;
            font-weight: 300;
        }

        @media (max-width: 768px) {
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            .main-header {
                display: none;
            }

            .hamburger-menu {
                font-size: 30px;
                color: white;
                cursor: pointer;
                z-index: 9999;
            }

            .mobile-nav {
                position: fixed;
                top: 0;
                right: -100%;
                width: 70%;
                height: 100vh;
                background-color: #010651;
                transition: right 0.3s ease-in-out;
                padding-top: 60px;
                z-index: 999;
                display: block;
            }

            .mobile-nav.active {
                right: 0;
            }

            .mobile-nav ul {
                list-style-type: none;
                padding: 0;
                text-align: center;
            }

            .mobile-nav ul li {
                padding: 15px;
            }

            .mobile-nav ul li a {
                color: white;
                text-decoration: none;
                font-size: 18px;
                display: block;
            }

            .background-div {
                width: 90%;
                padding: 5px;
                height: 220px;
                background-color: #010651;
            }

            .carousel-images {
                width: 700px;
                height: 380px;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
            }

            .carousel-item img {
                width: 100%;
                height: auto;
                position: absolute;
            }

            .carousel-item h1 {
                color: white;
                font-size: 30px;
                margin-top: -150px;
            }

            .form-center-content-div {
                width: 100%;
                height: 80%;
                display: flex;
                flex-direction: column;
            }

            .form-center-content-div input {
                width: 96%;
            }

            .car-parts-section-background-div-mob {
                width: 100%;
                max-width: 100%;
                height: 670px !important;
                background-color: #ffffff;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                justify-items: center;
            }

            .car-parts-section-mob {
                width: 100%;
                height: auto;
                margin: 0 auto;
                background-color: #ffffff;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .car-parts-section-center-content-div-title-mob {
                width: 100%;
                height: auto;
                display: flex;
                text-align: center;
            }

            .car-parts-section-center-content-div-title-mob h1 {
                font-size: 32px;
                font-weight: 500;
                color: #313131;
                font-family: 'Poppins', sans-serif;
                font-style: italic;
                margin-bottom: 30px;
            }

            .car-parts-section-center-content-div-presentation-mob {
                width: 100%;
                max-width: 400px;
                height: 700px;
                height: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .car-parts-section-center-content-div-center-mob {
                width: 100%;
                height: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .car-parts-section-center-content-div-sidebar-mob {
                width: 100%;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 10px;
            }

            .car-parts-section-center-content-div-sidebar-mob a {
                width: 100px;
                padding: 10px;
                font-size: 14px;
                text-align: center;
                text-decoration: none;
                color: white;
                font-family: 'Poppins', sans-serif;
                border-radius: 5px;
                background-color: #00065f;
                cursor: pointer;
            }

            .car-container-mob {
                width: 100%;
                max-width: 100%;
                height: auto;
                display: flex;
                justify-content: center;
                justify-items: center;
                align-items: center;
            }

            .car-parts-section-center-content-div-car-parts-div-img {
                width: 100%;
                height: auto;
            }

            .car-parts-section-center-content-div-car-parts-div-img img {
                width: 100%;
                max-width: 100%;
                height: auto;
                margin: 0 auto;
            }

            .car-parts-section-center-content-div-car-parts-div {
                width: 90%;
            }

            .pc-slide {
                display: none;
            }

            .mobile-slide {
                display: block;
            }

            .info-icons-mob {
                width: 100%;
                height: 100px;
                position: absolute;
                display: flex;
                justify-content: space-between;
            }

            .info-icons-mob img {
                width: 30px;
                height: 30px;
            }

            .info-icons-mob img:hover {
                cursor: pointer;
            }

            .action-button-div-mob {
                width: 40px;
                height: 40px;
                margin-left: -20px;
                position: absolute;
            }

            .about-div-mob {
                opacity: 0;
                visibility: hidden;
                position: absolute;
                width: 200px;
                background-color: #010651;
                font-weight: 300;
                font-family: 'Poppins', sans-serif;
                padding: 10px;
                border-radius: 5px;
                z-index: 1;
                transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out;
            }

            .action-button-div-mob:hover .about-div-mob {
                opacity: 1;
                visibility: visible;
            }

            .about-img-div-mob {
                width: 100%;
                height: auto;
            }

            .about-img-div-mob img {
                width: 100%;
                height: auto;
            }

            .about-text-div-mob p {
                color: #ffffff;
                font-size: 13px;
                margin: 0;
            }

            .about-text-div-mob b {
                color: #ffffff;
                font-size: 13px;
                margin: 0;
            }

            .adress-section-center-content-div h1 {
                font-size: 28px;
                text-align: center;
            }

            .adress-section-center-content-carousel-div {
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 50px;
            }

            .adress-section-center-content-carousel-images-div {
                position: relative;
                width: 100%;
                height: 600px;
                overflow: hidden;
            }

            .carousel-track {
                display: flex;
                transition: transform 0.5s ease-in-out;
            }

            .carousel-image {
                width: 100%;
                height: 600px;
                object-fit: cover;
                flex-shrink: 0;
            }

            .swiper {
                height: 300px;
            }

            .swiper-slide {
                width: 90%;
                height: auto;
            }

            .carousel-image {
                height: 300px;
            }

            .main-footer {
                height: auto;
                padding: 20px 0;
            }

            .main-footer-center-content-div {
                width: 90%;
                text-align: center;
            }

            .main-footer-center-content-lists-div {
                flex-direction: column;
                align-items: center;
            }

            .footer-img-div img {
                width: 150px;
                margin-bottom: 20px;
            }

            .main-footer-lists-div {
                margin: 0;
                text-align: center;
            }

            .main-footer-lists-div h4 {
                margin-top: 20px;
            }

            .main-footer-icons {
                width: 20px;
            }

            .list-margin li {
                margin-left: 0;
                margin-bottom: 10px;
            }

            .models-section {
                display: none;
            }

            .mobile-section {
                width: 100%;
                text-align: center;
                display: block;
            }

            .models-section-center-content-div {
                max-width: 100%;
                margin: 0 auto;
            }

            .swiper-container2 {
                width: 100%;
                height: 600px;
                margin: 20px auto;
                position: relative;
                padding: 0 15px;
                box-sizing: border-box;
            }

            .swiper-slide {
                width: 100%;
                height: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-right: 30px;
            }

            .models-section-blocks-item-div {
                width: 100%;
                height: 100%;
                background-color: rgb(239, 240, 255);
                border-radius: 10px;
                display: flex;
                padding: 20px;
                box-sizing: border-box;
                justify-content: center;
                align-items: center;
            }

            .models-section-blocks-item-data-div {
                width: 100%;
                height: auto;
                display: flex;
                flex-direction: column;
                justify-content: center;
                justify-items: center;
            }

            .models-section-blocks-item-data-div img {
                width: 100%; 
                height: auto;
            }

            .swiper-pagination2 {
                bottom: 10px;
                text-align: center;
            }

            .swiper-pagination-bullet {
                background: #000;
                opacity: 0.7;
                width: 10px;
                height: 10px;
            }
            
            .form-hr {
                display: none;
            }

            .form-price {
                width: auto;
            }

            .adress-section {
                display: none;
            }

            .location-info {
                position: absolute;
                display: flex;
                align-items: center;
                justify-content: center;
                justify-items: center;
                padding: 22px;
                border-radius: 10px;
                background-color: #010651 !important;
                transform: translateY(20px);
                left: 50%;
                transform: translateX(-50%);
                padding: 5px 10px;
                margin-top: 0px;
                z-index: 9999;
                width: 200px !important;
            }
            
            .location-info a {
                text-decoration: none;
                color: white;
                font-family: 'Poppins', sans-serif;
                font-weight: 500;
                transform: translateY(20px);
            }
            
            .location-info p {
                color: white !important;
            }
            
            .location-info img.location-icon {
                width: 20px;
                height: 20px;
                margin-right: 8px;
            }
            
            .location-info p {
                font-size: 16px;
                font-family: 'Poppins', sans-serif;
                color: #3b3b3b;
                margin: 0;
            }
            
            .location-info img {
                width: 30px;
                height: 30px;
                margin-right: 20px;
            }

            .adress-section-mob {
                width: 100%;
                height: 830px !important;
                display: block;
                background-color: #f0f0f0;
                display: flex;
                justify-content: center;
                align-items: center;
                align-items: center;
            }

            .adress-section-center-content-div {
                width: 100%;
                max-width: 100%;
                margin: 0 auto;
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .adress-section-center-content-div h1 {
                font-size: 32px;
                font-weight: bold;
                font-family: 'Poppins', sans-serif;
                color: rgb(59, 59, 59);
                margin: 0;
                margin-top: 120px;
            }

            .adress-section-center-content-div-mob img {
                width: 90px;
                margin-bottom: 100px;
            }

            .imagemob {
                width: 90px !important;
                height: auto;
                margin-top: 10px;
                margin-bottom: 40px !important;
            }

            .adress-section-center-content-div-mob p {
                text-align: justify;
                color: rgb(80, 80, 80);
                margin-bottom: 30px;
            }

            .adress-section-center-content-div-mob {
                width: 90%;
                margin: 0 auto;
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .adress-section-center-content-div-mob h1 {
                font-size: 38px;
                font-weight: bold;
                font-family: 'Poppins', sans-serif;
                color: rgb(59, 59, 59);
                margin-top: 120px;
                margin-bottom: 40px;
            }

            .adress-section-center-content-carousel-div {
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 50px;
            }

            .adress-section-center-content-carousel-images-div {
                position: relative;
                width: 90%;
                height: 600px;
                overflow: hidden;
            }

            .carousel-track {
                display: flex;
                transition: transform 0.5s ease-in-out;
            }

            .carousel-image {
                width: 100%;
                height: 600px;
                object-fit: cover;
                flex-shrink: 0;
            }

            .carousel-arrow {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                color: rgb(77, 77, 77);
                background-color: transparent;
                border: none;
                padding: 10px;
                cursor: pointer;
                z-index: 10;
            }

            .carousel-arrow.left-arrow {
                left: 10px;
            }

            .carousel-arrow.right-arrow {
                right: 10px;
            }

            .swiper {
                width: 90%;
                height: 400px;
            }

            .swiper-slide {
                width: 100%;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                justify-items: center;
                align-items: center;
            }

            .swiper-slide img {
                width: 100%;
                height: 220px;
                object-fit: cover;
                max-height: 500px;
            }

            .location-info {
                position: absolute;
                display: flex;
                align-items: center;
                border-radius: 10px;
                background-color: rgb(52, 52, 253);
                transform: translateY(20px);
                left: 50%;
                transform: translateX(-50%);
                text-align: center;
                width: 180px;
            }

            .location-info a {
                text-decoration: none;
                color: white;
                font-family: 'Poppins', sans-serif;
                font-weight: 500;
                transform: translateY(20px);
            }

            .location-info p {
                color: white;
            }

            .location-info img.location-icon {
                width: 20px;
                height: 20px;
                margin-right: 8px;
            }

            .location-info p {
                font-size: 16px;
                font-family: 'Poppins', sans-serif;
                color: #3b3b3b;
                margin: 0;
            }

            .location-info img {
                width: 30px;
                height: 30px;
                margin-right: 20px;
            }

            .car-parts-section-background-div {
                display: none;
            }
        }

        .swiper-button-next, .swiper-button-prev {
            color: rgb(34, 34, 34) !important;
            width: 40px;
            height: 40px;
            top: 50%;
            z-index: 10;
            cursor: pointer;
        }

        .carousel-item {
            display: none;
            flex-shrink: 0;
            width: 100%;
            text-align: center;
        }

        .location-info {
            position: absolute;
            display: flex;
            align-items: center;
            padding: 22px;
            border-radius: 10px;
            background-color: #010651;
            transform: translateY(20px);
            left: 50%;
            transform: translateX(-50%);
            padding: 5px 10px;
            margin-top: 20px !important;
            z-index: 9999;
        }

        .location-info a {
            text-decoration: none;
            color: white;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            transform: translateY(20px);
        }

        .location-info p {
            color: white;
        }

        .location-info img.location-icon {
            width: 20px;
            height: 20px;
            margin-right: 8px;
        }

        .location-info p {
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
            color: #ffffff;
            margin: 0;
        }

        .location-info img {
            width: 30px;
            height: 30px;
            margin-right: 20px;
        }



        .car-parts-section-center-content-div-car-parts-div-buttons {
            width: 100%;
            display: flex;
            justify-content: center;
            justify-items: center;
            align-items: center;
            margin-top: 40px;
            margin-left: -100px;
            margin-bottom: 20px;
            gap: 20px;
        }

        .info-icons {
            margin-top: 50px;
        }

        .car-parts-section-center-content-div-car-parts-div-buttons a {
            width: 90px;
            padding: 8px;
            font-size: 15px;
            font-weight: 300;
            text-align: center;
            text-decoration: none;
            color: white;
            font-family: 'Poppins', sans-serif;
            border-radius: 5px;
            background-color: rgb(218, 165, 32);
            z-index: 1;
            cursor: pointer;
        }

        .car-parts-section-center-content-div-sidebar {
            width: 15%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 20px;
        }

        .car-parts-section-center-content-div-sidebar a {
            width: 120px;
            padding: 8px;
            font-size: 15px;
            font-weight: 300;
            text-align: center;
            text-decoration: none;
            color: white;
            font-family: 'Poppins', sans-serif;
            border-radius: 5px;
            background-color: #00065f;
            z-index: 1;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            .hero-content {
                display: flex;
                flex-direction: column;
                justify-content: center;
                justify-items: center;
                align-items: center;
                padding: var(--spacing-3xl) 0;
            }

            .slider-container {
                width: 100%;
                max-height: 400px;
                max-width: 100%;
                margin: 0 auto;
                display: flex;
                justify-content: center;
                align-items: center;
                justify-items: center;
                margin-top: -50px;
                margin-bottom: 30px;
            }

            .contact-form-container {
                width: 100%;
                max-width: 100%;
                margin: 0 auto;
                display: flex;
                justify-content: center;
                align-items: center;
                justify-items: center;
            }

            .main-mobile-header {
                height: 50px;
                background-color: #010651;
                padding: 10px;
                position: relative;
                z-index: 1000;
                display: flex;
                justify-content: center;
                align-items: center;
                justify-items: center;
            }

            .mobile-header-container {
                width: 95%;
                margin: 0 auto;
                display: flex;
                justify-content: space-between;
                align-items: center;
                justify-items: center;
            }

            .main-header-logo {
                width: 80px;
                height: auto;
            }


            .main-header {
                display: none;
            }

            .hamburger-menu {
                font-size: 30px;
                color: white;
                cursor: pointer;
                z-index: 9999;
            }

            .mobile-nav {
                position: fixed;
                top: 0;
                right: -100%;
                width: 70%;
                height: 100vh;
                background-color: #010651;
                transition: right 0.3s ease-in-out;
                padding-top: 60px;
                z-index: 999;
            }

            .mobile-nav.active {
                right: 0;
            }

            .mobile-nav ul {
                list-style-type: none;
                padding: 0;
                text-align: center;
            }

            .mobile-nav ul li {
                padding: 15px;
            }

            .mobile-nav ul li a {
                color: white;
                text-decoration: none;
                font-size: 18px;
                display: block;
            }

            .background-div {
                width: 90%;
                padding: 5px;
                height: 220px;
                background-color: #010651;
            }

            .carousel-images {
                width: 700px;
                height: 380px;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
            }

            .carousel-item img {
                width: 100%;
                height: auto;
                position: absolute;
            }

            .carousel-item h1 {
                color: white;
                font-size: 30px;
                margin-top: -150px;
            }

            .form-center-content-div {
                width: 100%;
                height: 80%;
                display: flex;
                flex-direction: column;
            }

            .form-center-content-div input {
                width: 96%;
            }

            .car-parts-section-background-div-mob {
                width: 100%;
                max-width: 100%;
                height: 600px;
                background-color: #ffffff;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .car-parts-section-mob {
                width: 100%;
                height: auto;
                margin: 0 auto;
                background-color: #ffffff;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .car-parts-section-center-content-div-title-mob {
                width: 100%;
                height: auto;
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
            }

            .car-parts-section-center-content-div-title-mob h1 {
                font-size: 24px;
                font-weight: 600;
                color: #313131;
                font-family: 'Poppins', sans-serif;
                padding: 10px;
            }

            .car-parts-section-center-content-div-presentation-mob {
                width: 100%;
                max-width: 400px;
                height: 700px;
                height: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .car-parts-section-center-content-div-center-mob {
                width: 100%;
                height: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .car-parts-section-center-content-div-sidebar-mob {
                width: 100%;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 10px;
            }

            .car-parts-section-center-content-div-sidebar-mob a {
                width: 100px;
                padding: 10px;
                font-size: 14px;
                text-align: center;
                text-decoration: none;
                color: white;
                font-family: 'Poppins', sans-serif;
                border-radius: 5px;
                background-color: #010651;
                cursor: pointer;
            }

            .car-container-mob {
                width: 100%;
                max-width: 100%;
                height: auto;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .car-parts-section-center-content-div-car-parts-div-mob {
                width: 100%;
                height: auto;
                display: flex;
                justify-content: center;
                justify-items: center;
                align-items: center;
            }
            
            .car-parts-section-center-content-div-car-parts-div-img-mob {
                width: 90%;
                height: auto;
            }

            .car-parts-section-center-content-div-car-parts-div-img-mob img {
                width: 100%;
                max-width: 100%;
                height: auto;
                margin: 0 auto;
            }

            .pc-slide {
                display: none;
            }

            .mobile-slide {
                display: block;
            }

            .info-icons-mob {
                width: 100%;
                height: 100px;
                display: flex;
                justify-content: space-between;
                margin-top: 350px;
            }

            .info-icons-mob img {
                width: 30px;
                height: 30px;
            }

            .info-icons-mob img:hover {
                cursor: pointer;
            }

            .action-button-div-mob {
                width: 40px;
                height: 40px;
                margin-left: -20px;
                position: absolute;
            }

            .about-div-mob {
                opacity: 0;
                visibility: hidden;
                position: absolute;
                width: 200px;
                background-color: #010651;
                font-weight: 300;
                font-family: 'Poppins', sans-serif;
                padding: 10px;
                border-radius: 5px;
                z-index: 1;
                transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out;
            }

            .action-button-div-mob:hover .about-div-mob {
                opacity: 1;
                visibility: visible;
            }

            .about-img-div-mob {
                width: 100%;
                height: auto;
            }

            .about-img-div-mob img {
                width: 100%;
                height: auto;
            }

            .about-text-div-mob p {
                color: #ffffff;
                font-size: 13px;
                margin: 0;
            }

            .about-text-div-mob b {
                color: #ffffff;
                font-size: 13px;
                margin: 0;
            }

            .adress-section-center-content-div h1 {
                font-size: 28px;
                text-align: center;
            }

            .adress-section-center-content-carousel-div {
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 50px;
            }

            .adress-section-center-content-carousel-images-div {
                position: relative;
                width: 100%;
                height: 600px;
                overflow: hidden;
            }

            .carousel-track {
                display: flex;
                transition: transform 0.5s ease-in-out;
            }

            .carousel-image {
                width: 100%;
                height: 600px;
                object-fit: cover;
                flex-shrink: 0;
            }

            .swiper {
                height: 300px;
            }

            .carousel-image {
                height: 300px;
            }

            .main-footer {
                height: auto;
                padding: 20px 0;
            }

            .main-footer-center-content-div {
                width: 90%;
                text-align: center;
            }

            .main-footer-center-content-lists-div {
                flex-direction: column;
                align-items: center;
            }

            .main-footer-lists-div {
                margin: 0;
                text-align: center;
            }

            .main-footer-lists-div h4 {
                margin-top: 20px;
            }

            .list-margin li {
                margin-left: 0;
                margin-bottom: 10px;
            }

            .models-section {
                display: none;
            }

            .mobile-section {
                width: 100%;
                text-align: center;
                display: block;
            }

            .models-section-center-content-div {
                max-width: 100%;
                margin: 0 auto;
            }

            .swiper-container2 {
                width: 100%;
                height: 600px;
                margin: 20px auto;
                position: relative;
                padding: 0 15px;
                box-sizing: border-box;
            }

            .models-section-blocks-item-div {
                width: 100%;
                height: 100%;
                background-color: rgb(239, 240, 255);
                border-radius: 10px;
                display: flex;
                padding: 20px;
                box-sizing: border-box;
                justify-content: center;
                align-items: center;
            }

            .models-section-blocks-item-data-div {
                width: 100%;
                height: auto;
                display: flex;
                flex-direction: column;
                justify-content: center;
                justify-items: center;
            }

            .models-section-blocks-item-data-div img {
                width: 100%; 
                height: auto;
            }

            .swiper-button-next2, .swiper-button-prev2 {
                color: rgb(215, 253, 10);
                width: 40px;
                height: 40px;
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                z-index: 10;
                cursor: pointer;
            }

            .swiper-pagination2 {
                bottom: 10px;
                text-align: center;
            }

            .swiper-pagination-bullet {
                background: #000;
                opacity: 0.7;
                width: 10px;
                height: 10px;
            }
            
            .form-hr {
                display: none;
            }

            .form-price {
                width: auto;
            }

            .adress-section {
                display: none;
            }


            .swiper-button-next, .swiper-button-prev {
                color: rgb(255, 255, 255);
            }

            .location-info {
                position: absolute;
                display: flex;
                align-items: center;
                padding: 22px;
                border-radius: 10px;
                background-color: #010651 !important;
                transform: translateY(20px);
                left: 50%;
                transform: translateX(-50%);
                padding: 5px 10px;
                margin-top: 0px;
                z-index: 9999;
            }
            
            .location-info a {
                text-decoration: none;
                color: white;
                font-family: 'Poppins', sans-serif;
                font-weight: 500;
                transform: translateY(20px);
            }
            
            .location-info p {
                color: white !important;
            }
            
            .location-info img.location-icon {
                width: 20px;
                height: 20px;
                margin-right: 8px;
            }
            
            .location-info p {
                font-size: 16px;
                font-family: 'Poppins', sans-serif;
                color: #3b3b3b;
                margin: 0;
            }
            
            .location-info img {
                width: 30px;
                height: 30px;
                margin-right: 20px;
            }

            .adress-section-mob {
                width: 100%;
                height: 750px;
                padding: 20px 0;
                display: block;
            }

            .adress-section-center-content-div {
                width: 100%;
                max-width: 100%;
                margin: 0 auto;
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .adress-section-center-content-div h1 {
                font-size: 32px;
                font-weight: bold;
                font-family: 'Poppins', sans-serif;
                color: rgb(59, 59, 59);
                margin: 0;
                margin-top: 120px;
            }

            .adress-section-center-content-div-mob img {
                width: 100px;
                margin-bottom: 10px;
            }

            .adress-section-center-content-div-mob p {
                text-align: justify;
                color: rgb(80, 80, 80);
            }

            .adress-section-center-content-div-mob {
                width: 90%;
                margin: 0 auto;
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .adress-section-center-content-div-mob h1 {
                font-size: 38px;
                font-weight: bold;
                font-family: 'Poppins', sans-serif;
                color: rgb(59, 59, 59);
                margin-top: 120px;
                margin-bottom: 40px;
            }

            .adress-section-center-content-carousel-div {
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 50px;
            }

            .adress-section-center-content-carousel-images-div {
                position: relative;
                width: 90%;
                height: 600px;
                overflow: hidden;
            }

            .carousel-track {
                display: flex;
                transition: transform 0.5s ease-in-out;
            }

            .carousel-image {
                width: 100%;
                height: 600px;
                object-fit: cover;
                flex-shrink: 0;
            }

            .carousel-arrow {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                color: rgb(77, 77, 77);
                background-color: transparent;
                border: none;
                padding: 10px;
                cursor: pointer;
                z-index: 10;
            }

            .carousel-arrow.left-arrow {
                left: 10px;
            }

            .carousel-arrow.right-arrow {
                right: 10px;
            }

            .location-info {
                position: absolute;
                display: flex;
                align-items: center;
                border-radius: 10px;
                background-color: rgb(52, 52, 253);
                transform: translateY(20px);
                left: 50%;
                transform: translateX(-50%);
                text-align: center;
                width: 180px;
            }

            .location-info a {
                text-decoration: none;
                color: white;
                font-family: 'Poppins', sans-serif;
                font-weight: 500;
                transform: translateY(20px);
            }

            .location-info p {
                color: white;
            }

            .location-info img.location-icon {
                width: 20px;
                height: 20px;
                margin-right: 8px;
            }

            .location-info p {
                font-size: 16px;
                font-family: 'Poppins', sans-serif;
                color: #3b3b3b;
                margin: 0;
            }

            .location-info img {
                width: 30px;
                height: 30px;
                margin-right: 20px;
            }

            .car-parts-section-background-div {
                display: none;
            }

            .main-nav {
                display: none;
            }

            .mobile-menu-toggle {
                display: block;
            }

            .main-header-nav-mobile {
                display: block;
                position: fixed;
                top: 0;
                right: -300px;
                width: 250px;
                height: 100vh;
                background-color: #00065f;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                padding-top: 80px;
                transition: right 0.3s ease;
                z-index: 3;
            }

            .main-header-nav-mobile.active {
                right: 0;
            }

            .menu-toggle {
                display: flex;
                z-index: 9000;
            }

            .main-header-nav-list-mobile {
                display: flex;
                flex-direction: column;
                gap: 40px;
                list-style: none;
                padding: 0;
            }

            .main-header-nav-list-mobile a {
                font-size: 20px;
                color: #fff;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            .main-header-nav-list-mobile a:hover {
                color: #ddd;
            }

            .slide-content {
                display: flex;
                flex-direction: column;
                justify-content: center;
                justify-items: center;
                align-items: center;
            }

            .slide-image {
                display: flex;
                flex-direction: column;
                justify-content: center;
                justify-items: center;
                align-items: center;
            }

            .vehicle-img {
                max-width: 320px;
                height: auto;
            }

            .social-media-div {
                display: flex;
                justify-content: center;
                justify-items: center;
                align-items: center;
                flex-direction: column;
            }

            .info-icon-div-footer img {
                width: 25px;
                height: auto;
                margin-right: 10px;
            }
            
            .car-parts-section-center-content-div-car-parts-div-buttons {
                margin-left: 0px;
            }
        }

        .social-media-div {
            display: flex;
            justify-content: center;
            justify-items: center;
            align-items: center;
            flex-direction: column;
        }

        .info-icon-div-footer {
            display: flex;
            justify-content: center;
            justify-items: center;
            align-items: center;
            margin-bottom: 10px;
        }

        .info-icon-div-footer p {
            font-size: 15px;
        }

        .info-icon-div-footer a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: inherit;
        }
        
        .info-icon-div-footer img {
            width: 25px;
            height: auto;
            margin-right: 10px;
        }
















        .main-section {
            width: 100%;
            height: auto;
            display: flex;
            justify-content: center;
            justify-items: center;
            align-items: center;
        }

        .main-section-center-div {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            justify-items: center;
            align-items: center;
        }

        .main-thank-you-content {
            width: 100%;
            height: 100px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            justify-items: center;
            align-items: center;
        }

        .main-thank-you-content h1 {
            font-size: 30px;
            font-weight: 600;
            color: rgb(59, 59, 59);
            text-align: center;
            margin: 0;
            padding: 20px 0;
            font-style: italic;
            margin-top: 20px;
        }

        .main-thank-you-content p {
            font-size: 20px;
            font-weight: 400;
            color: rgb(36, 36, 36);
            margin: 0;
            padding: 20px 0;
            text-align: center;
        }
    </style>

    <!-- ==================== BLOCO 3: Scripts Gerais ==================== -->
     <script src="../js/index.js"></script>

    <!-- ==================== BLOCO 4: Scripts de Componentes ==================== -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <!-- ==================== BLOCO 5: Analytics & SEO ==================== -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-N6SN7W8T');</script>

        <!-- Google tag (gtag.js) --> <script async src="https://www.googletagmanager.com/gtag/js?id=G-BTYJ6R0367"></script> <script> window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', 'G-BTYJ6R0367'); </script>
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-N6SN7W8T"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    
    <a href="#" id="whatsapp-btn" onclick="return false">
        <img src="../assets/icons/whatsapp.png" alt="whatsapp-icon">
    </a>

    <div id="wa-container">
        <form action="" method="post">
            <input type="text" name="name" placeholder="Nome" required>
            <input type="tel" name="phone" id="telefoneWhatsapp" placeholder="Telefone" oninput="mascaraTelefoneWhatsapp(event)" required>
            <input type="text" name="city" placeholder="Cidade" required>
            <input type="text" name="car" placeholder="Carro de interesse" required>
            <input type="text" name="var" value="second" style="display: none;">
            
            <p>Ao preencher o formulário, você está ciente que o Consórcio Fancar poderá enviar, de tempos em tempos, comunicações e conteúdos de acordo com os seus interesses.</p>
            
            <button type="submit" id="submit-btn">Enviar</button>
        </form>
    </div>
    <header class="header">
        <div class="container">
            <div class="header-wrapper">
                <div class="logo">
                    <a href="#" aria-label="Ford Fancar">
                        <img src="../assets/FORDFANCAR.png" alt="Logo Ford Fancar" style="width: 90px; height: auto;">
                    </a>
                </div>
                
                <nav class="main-nav">
                    <ul class="nav-list">
                        <li class="nav-item"><a href="https://seminovos.fancar.com.br" class="nav-link">Seminovos</a></li>
                        <li class="nav-item"><a href="https://www.consorciofancar.com.br" class="nav-link">Consórcio</a></li>
                        <li class="nav-item"><a href="https://fancor.com.br" class="nav-link">Fancor Seguros</a></li>
                    </ul>
                </nav>
                
                <button class="menu-toggle" id="menu-toggle">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </button>
            </div>
        </div>
    </header>

    <nav class="main-header-nav-mobile">
      <ul class="main-header-nav-list-mobile">
         <li><a href="https://seminovos.fancar.com.br" class="nav-link">Seminovos</a></li>
         <li><a href="https://www.consorciofancar.com.br" class="nav-link">Consórcio</a></li>
         <li><a href="https://fancor.com.br" class="nav-link">Fancor Seguros</a></li>
      </ul>
    </nav>


    <section class="main-section">
        <div class="main-section-center-div">
            <div class="main-thank-you-content">
            <h1>Obrigado por entrar em contato!</h1>
            <p>
                Sua mensagem foi recebida com sucesso. Nossa equipe entrará em
                contato o mais breve possível.
            </p>
            </div>
        </div>
    </section>


    <script>
        const countdown = 10;

        setTimeout(() => {
            window.location.href = "http://meuford.fancar.com.br";
        }, countdown * 1000);
    </script>



    <footer class="main-footer">
        <div class="main-footer-center-content-div">
            <div class="main-footer-center-content-lists-div">
                <div class="footer-img-div">
                    <img src="../assets/FORDFANCARAZUL.png" alt="main-logo">
                </div>

                <div class="main-footer-lists-div">
                    <h4>Localização</h4>
                    <ul>
                        <a href="https://maps.app.goo.gl/FzkVLA7LGdb8gbjn7"><li>Ponta Grossa</li></a>
                        <a href="https://maps.app.goo.gl/yr9txJUpy7LZRQCv9"><li>Cascavel</li></a>
                        <a href="https://maps.app.goo.gl/3pxHnrWBHPHDanwq7"><li>Foz do Iguaçu</li></a>
                        <a href="https://maps.app.goo.gl/71gJEKKnhbQkdgeP9"><li>Pato Branco</li></a>
                        <a href="https://maps.app.goo.gl/HQgWAT6iTvh7ojBa6"><li>Umuarama</li></a>
                        <a href="https://maps.app.goo.gl/MGC5abi6Xuxkr8nX7"><li>Guarapuava</li></a>
                    </ul>
                </div>

                <div class="main-footer-lists-div list-margin">
                    <h4>Visite nossas redes sociais</h4>
                    <div class="social-media-div">
                    <div class="info-icon-div-footer">
                        <a href="https://www.facebook.com/fordfancar">
                        <img src="../assetsteste/icons/facebook.png" alt="facebook" />
                        <p>fordfancar</p>
                        </a>
                    </div>
                    <div class="info-icon-div-footer">
                        <a href="https://www.instagram.com/fordfancar/">
                        <img src="../assetsteste/icons/instagram.png" alt="instagram" />
                        <p>fordfancar</p>
                        </a>
                    </div>
                    </div>
                </div>
            </div>
            <hr>
            <p>Copyright &copy; Ford Fancar 2025. All Rights reserved.</p>
        </div>
    </footer>
</body>
</html>