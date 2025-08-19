<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, java.io.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="oracle.jdbc.pool.OracleDataSource" %>
<%@ page import="com.itextpdf.text.Document" %>
<%@ page import="com.itextpdf.text.Paragraph" %>
<%@ page import="com.itextpdf.text.pdf.PdfWriter" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.lang.StringBuilder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*, java.text.SimpleDateFormat, java.util.Date" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Descubra a linha completa Ford na Fancar. Maverick, F-150, Bronco, Mustang e muito mais. Ofertas exclusivas e atendimento especializado.">
    <meta name="keywords" content="Ford, Fancar, Maverick, F-150, Bronco, Mustang, Ranger, Territory, Transit">
    
    <!-- Title -->
    <title>Ford Fancar - Sua Nova Ford Te Espera | Ofertas Exclusivas</title>
    
    <!-- Fonts & Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="icon" href="assets/icons/Logo_ford_Vertical.png" type="image/x-icon">
    
    <!-- Styles -->
    <link rel="stylesheet" href="css/index.css">

    <style>
        .cta-btn {
            align-items: center;
            gap: var(--space-2);
            background: green;
            color: var(--white);
            border: none;
            padding: var(--space-3) var(--space-6);
            border-radius: var(--radius-full);
            font-weight: 600;
            font-size: var(--text-sm);
            cursor: pointer;
            transition: all var(--transition-normal);
        }

        .cta-btn:hover {
            background: darkgreen;
        }

        .title-highlight {
            background: linear-gradient(135deg, #ffffff 0%, #8a8d96 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: inline-block;
        }

        
        .vehicle-name {
            font-size: clamp(2rem, 5vw, 4rem);
            font-weight: 800;
            margin-bottom: var(--space-4);
            background: linear-gradient(135deg, #ffffff 0%, #8a8d96 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            line-height: 1.1;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .checkbox-label input[type="checkbox"] {
            width: 25px;
            height: 25px;
            margin: 0;
            border: 1px solid gray;
            margin-top: 10px;
        }

        .form-group input,
        .form-group select {
            padding: 13px;
            border: 2px solid var(--gray-200);
            border-radius: var(--radius-lg);
            font-size: var(--text-base);
            transition: all var(--transition-fast);
            background: var(--white);
        }
    </style>
    
    <script src="js/index.js></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
    
    <!-- Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-BTYJ6R0367"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-BTYJ6R0367');
    </script>
    
    <!-- Meta Pixel -->
    <script>
        !function(f,b,e,v,n,t,s)
        {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
        n.callMethod.apply(n,arguments):n.queue.push(arguments)};
        if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
        n.queue=[];t=b.createElement(e);t.async=!0;
        t.src=v;s=b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t,s)}(window, document,'script',
        'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '9444820535578285');
        fbq('track', 'PageView');
    </script>
    <noscript><img height="1" width="1" style="display:none"
    src="https://www.facebook.com/tr?id=9444820535578285&ev=PageView&noscript=1"
    /></noscript>
    
    <!-- GTM -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-N6SN7W8T');</script>
</head>
<body>
    <!-- GTM (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-N6SN7W8T"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>


    <!-- Modern Header -->
    <header class="modern-header">
        <div class="header-container">
            <div class="header-brand">
                <img src="assets/FORDFANCAR.png" alt="Ford Fancar" class="brand-logo">
            </div>

            <nav class="header-nav">
                <ul class="nav-menu">
                    <li><a href="https://seminovos.fancar.com.br" class="nav-link">Seminovos</a></li>
                    <li><a href="https://www.consorciofancar.com.br" class="nav-link">Consórcio</a></li>
                    <li><a href="https://fancor.com.br" class="nav-link">Fancor Seguros</a></li>
                </ul>
            </nav>

            <div class="header-actions">
                <button class="cta-btn" onclick="scrollToForm()">
                    <span>Fale Conosco</span>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                        <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
                
                <button class="mobile-menu-toggle" id="mobileMenuToggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div class="mobile-menu" id="mobileMenu">
            <div class="mobile-menu-content">
                <nav class="mobile-nav">
                    <a href="https://seminovos.fancar.com.br" class="mobile-nav-link">Seminovos</a>
                    <a href="https://www.consorciofancar.com.br" class="mobile-nav-link">Consórcio</a>
                    <a href="https://fancor.com.br" class="mobile-nav-link">Fancor Seguros</a>
                </nav>
                <button class="mobile-cta-btn" onclick="scrollToForm()">Fale Conosco</button>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-background">
            <div class="hero-gradient"></div>
            <div class="hero-particles"></div>
        </div>
        
        <div class="hero-container">
            <!-- Header Content -->
            <div class="hero-header">
                <h1 class="hero-title">
                    Escolha o 
                    <span class="title-highlight">Novo Ford</span>
                    perfeito para você
                </h1>
                <p class="hero-subtitle">
                    Explore nossa linha completa de veículos e encontre o Ford perfeito para sua vida
                </p>
            </div>

            <!-- Main Content Grid -->
            <div class="hero-content-grid">
                <!-- Vehicle Showcase -->
                <div class="vehicle-showcase">
                    <div class="vehicle-slider">
                        <div class="slider-wrapper">
                            <!-- Slide 1 - Maverick Tremor -->
                            <div class="vehicle-slide active" data-vehicle="maverick-tremor">
                                <div class="slide-content">
                                    <div class="vehicle-image-container">
                                        <img src="assets/MVATREMOR.png" alt="Ford Maverick Tremor" class="vehicle-img">
                                    </div>
                                    <div class="vehicle-info">
                                        <h2 class="vehicle-name">Maverick Tremor</h2>
                                        <p class="vehicle-description">A picape que redefine aventura e versatilidade</p>
                                        <div class="vehicle-features">
                                            <span class="feature-tag">4x4</span>
                                            <span class="feature-tag">Turbo</span>
                                            <span class="feature-tag">Off-Road</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide 2 - Maverick Black -->
                            <div class="vehicle-slide" data-vehicle="maverick-black">
                                <div class="slide-content">
                                    <div class="vehicle-image-container">
                                        <img src="assets/MVABLACK.png" alt="Ford Maverick Black" class="vehicle-img">
                                    </div>
                                    <div class="vehicle-info">
                                        <h2 class="vehicle-name">Maverick Black</h2>
                                        <p class="vehicle-description">Estilo urbano com performance excepcional</p>
                                        <div class="vehicle-features">
                                            <span class="feature-tag">Econômica</span>
                                            <span class="feature-tag">Conectada</span>
                                            <span class="feature-tag">Versátil</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide 3 - F-150 Platinum -->
                            <div class="vehicle-slide" data-vehicle="f150">
                                <div class="slide-content">
                                    <div class="vehicle-image-container">
                                        <img src="assets/carros-form/F150 SLIDE.png" alt="Ford F-150 Platinum" class="vehicle-img">
                                    </div>
                                    <div class="vehicle-info">
                                        <h2 class="vehicle-name">Ford F-150</h2>
                                        <p class="vehicle-description">O máximo em luxo e capacidade de trabalho</p>
                                        <div class="vehicle-features">
                                            <span class="feature-tag">Luxo</span>
                                            <span class="feature-tag">Potência</span>
                                            <span class="feature-tag">Tecnologia</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide 4 - Bronco -->
                            <div class="vehicle-slide" data-vehicle="bronco">
                                <div class="slide-content">
                                    <div class="vehicle-image-container">
                                        <img src="assets/NOVO BRONCO(1920 x 1080) (1).png" alt="Ford Bronco" class="vehicle-img">
                                    </div>
                                    <div class="vehicle-info">
                                        <h2 class="vehicle-name">Bronco</h2>
                                        <p class="vehicle-description">Lenda off-road que voltou para conquistar</p>
                                        <div class="vehicle-features">
                                            <span class="feature-tag">Icônico</span>
                                            <span class="feature-tag">Off-Road</span>
                                            <span class="feature-tag">Robusto</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide 5 - Mustang -->
                            <div class="vehicle-slide" data-vehicle="mustang">
                                <div class="slide-content">
                                    <div class="vehicle-image-container">
                                        <img src="assets/carros-form/MUSTANG_GT_PERFORMANCE__1920_x_1080.png" alt="Ford Mustang" class="vehicle-img">
                                    </div>
                                    <div class="vehicle-info">
                                        <h2 class="vehicle-name">Mustang</h2>
                                        <p class="vehicle-description">Pura emoção em cada curva</p>
                                        <div class="vehicle-features">
                                            <span class="feature-tag">Esportivo</span>
                                            <span class="feature-tag">V8</span>
                                            <span class="feature-tag">Performance</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide 6 - Ranger -->
                            <div class="vehicle-slide" data-vehicle="ranger">
                                <div class="slide-content">
                                    <div class="vehicle-image-container">
                                        <img src="assets/carros-form/RANGER_LIMITED+KIT__1920_x_1080.png" alt="Ford Ranger" class="vehicle-img">
                                    </div>
                                    <div class="vehicle-info">
                                        <h2 class="vehicle-name">Ranger</h2>
                                        <p class="vehicle-description">A picape mais vendida do Brasil</p>
                                        <div class="vehicle-features">
                                            <span class="feature-tag">Líder</span>
                                            <span class="feature-tag">Confiável</span>
                                            <span class="feature-tag">Resistente</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide 7 - Raptor -->
                            <div class="vehicle-slide" data-vehicle="raptor">
                                <div class="slide-content">
                                    <div class="vehicle-image-container">
                                        <img src="assets/carros-form/RANGER_RAPTOR__1920_x_1080.png" alt="Ford Ranger Raptor" class="vehicle-img">
                                    </div>
                                    <div class="vehicle-info">
                                        <h2 class="vehicle-name">Ranger Raptor</h2>
                                        <p class="vehicle-description">Performance off-road extrema</p>
                                        <div class="vehicle-features">
                                            <span class="feature-tag">Extrema</span>
                                            <span class="feature-tag">Racing</span>
                                            <span class="feature-tag">Exclusiva</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide 8 - Territory -->
                            <div class="vehicle-slide" data-vehicle="territory">
                                <div class="slide-content">
                                    <div class="vehicle-image-container">
                                        <img src="assets/carros-form/NOVA TERRITORY(1920 x 1080) (3).png" alt="Ford Territory" class="vehicle-img">
                                    </div>
                                    <div class="vehicle-info">
                                        <h2 class="vehicle-name">Territory</h2>
                                        <p class="vehicle-description">SUV inteligente para a família moderna</p>
                                        <div class="vehicle-features">
                                            <span class="feature-tag">Familiar</span>
                                            <span class="feature-tag">Inteligente</span>
                                            <span class="feature-tag">Seguro</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide 9 - Transit -->
                            <div class="vehicle-slide" data-vehicle="transit">
                                <div class="slide-content">
                                    <div class="vehicle-image-container">
                                        <img src="assets/carros-form/TRANSIT__1920_x_1080.png" alt="Ford Transit" class="vehicle-img">
                                    </div>
                                    <div class="vehicle-info">
                                        <h2 class="vehicle-name">Transit</h2>
                                        <p class="vehicle-description">Solução completa para seu negócio</p>
                                        <div class="vehicle-features">
                                            <span class="feature-tag">Comercial</span>
                                            <span class="feature-tag">Eficiente</span>
                                            <span class="feature-tag">Produtiva</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Slider Controls -->
                        <div class="slider-controls">
                            <button class="slider-btn prev" id="prevSlide" aria-label="Slide anterior">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <path d="M15 18L9 12L15 6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </button>
                            <button class="slider-btn next" id="nextSlide" aria-label="Próximo slide">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <path d="M9 18L15 12L9 6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </button>
                        </div>

                        <br>
                        <br>

                        <!-- Slider Indicators -->
                        <div class="slider-indicators">
                            <button class="indicator active" data-slide="0" aria-label="Slide 1"></button>
                            <button class="indicator" data-slide="1" aria-label="Slide 2"></button>
                            <button class="indicator" data-slide="2" aria-label="Slide 3"></button>
                            <button class="indicator" data-slide="3" aria-label="Slide 4"></button>
                            <button class="indicator" data-slide="4" aria-label="Slide 5"></button>
                            <button class="indicator" data-slide="5" aria-label="Slide 6"></button>
                            <button class="indicator" data-slide="6" aria-label="Slide 7"></button>
                            <button class="indicator" data-slide="7" aria-label="Slide 8"></button>
                            <button class="indicator" data-slide="8" aria-label="Slide 9"></button>
                        </div>
                    </div>
                </div>

                <!-- Contact Form -->
                <div class="contact-form-section" id="contactForm">
                    <div class="form-container">
                        <div class="form-header">
                            <h3>Fale com um Consultor</h3>
                            <p>Preencha seus dados e receba uma proposta personalizada</p>
                        </div>

                        <form class="modern-form" action="" method="post">
                            <div class="form-group">
                                <label for="name">Nome Completo</label>
                                <input type="text" id="name" name="name" required>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="phone">Telefone</label>
                                    <input type="tel" id="phone" name="phone" required>
                                </div>
                                <div class="form-group">
                                    <label for="city">Cidade</label>
                                    <input type="text" id="city" name="city" class="cidade" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="car">Modelo de Interesse</label>
                                <select id="car" name="car" required>
                                    <option value="">Selecione um modelo</option>
                                    <option value="Maverick Tremor">Maverick Tremor</option>
                                    <option value="Maverick Black">Maverick Black</option>
                                    <option value="F-150 Platinum">F-150 Platinum</option>
                                    <option value="Bronco">Bronco</option>
                                    <option value="Mustang">Mustang</option>
                                    <option value="Ranger">Ranger</option>
                                    <option value="Ranger Raptor">Ranger Raptor</option>
                                    <option value="Territory">Territory</option>
                                    <option value="Transit">Transit</option>
                                </select>
                            </div>

                            <input type="hidden" name="var" value="first">

                            <div class="form-group">
                                <label class="checkbox-label">
                                    <input type="checkbox" required>
                                    <span class="checkbox-text">Concordo em receber comunicações da Ford Fancar e aceito a <a href="https://ford.fancar.com.br/politica-de-privacidade" >Política de Privacidade</a></span>
                                </label>
                            </div>

                            <button type="submit" class="submit-btn">
                                <span>Conversar com Consultor</span>
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Vehicle Details Section -->
    <section class="vehicle-details-section">
        <div class="details-container">
            <div class="section-header">
                <h2>Conheça os Detalhes que a Ford Traz para Você</h2>
                <p>Explore as características únicas de cada modelo Ford</p>
            </div>

            <div class="vehicle-tabs">
                <button class="tab-btn active" data-vehicle="maverick">Maverick</button>
                <button class="tab-btn" data-vehicle="f150">F-150</button>
                <button class="tab-btn" data-vehicle="bronco">Bronco</button>
                <button class="tab-btn" data-vehicle="mustang">Mustang</button>
                <button class="tab-btn" data-vehicle="ranger">Ranger</button>
                <button class="tab-btn" data-vehicle="raptor">Raptor</button>
                <button class="tab-btn" data-vehicle="territory">Territory</button>
                <button class="tab-btn" data-vehicle="transit">Transit</button>
            </div>

            <div class="vehicle-detail-content" id="vehicleDetailContent">
                <!-- Content will be loaded dynamically -->
            </div>
        </div>
    </section>

    <!-- Locations Section -->
    <section class="locations-section">
        <div class="locations-container">
            <div class="section-header">
                <div class="company-logo">
                    <img src="assets/GRUPOFANCAR.png" alt="Grupo Fancar">
                </div>
                <h2>Grupo Fancar</h2>
                <p>O Grupo Fancar atua no mercado automotivo do Paraná e do Mato Grosso. Fundado pelo empresário Nélvio Perin em 1993, o Grupo atualmente conta com cerca de 20 lojas espalhadas entre ambos os estados, locais em que o nosso compromisso com a excelência e o atendimento nos tornaram referência.</p>
                <p>Hoje, a Fancar acumula diversos prêmios de qualidade e performance em vendas, conquistando reconhecimento nacional pela solidez comercial e profissional.</p>
            </div>

            <div class="locations-carousel">
                <div class="swiper locations-swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="location-card">
                                <div class="location-image">
                                    <img src="assets/PONTA GROSSA.png" alt="Ford Ponta Grossa">
                                </div>
                                <div class="location-info">
                                    <h3>Ford Ponta Grossa</h3>
                                    <p>Matriz do Grupo Fancar</p>
                                    <a href="https://maps.app.goo.gl/FzkVLA7LGdb8gbjn7"  class="location-btn">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                                            <path d="M21 10C21 17L12 23L3 10C3 5.02944 7.02944 1 12 1C16.9706 1 21 5.02944 21 10Z" stroke="currentColor" stroke-width="2"/>
                                            <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="2"/>
                                        </svg>
                                        <span>Como Chegar</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="location-card">
                                <div class="location-image">
                                    <img src="assets/CASCAVEL.png" alt="Ford Cascavel">
                                </div>
                                <div class="location-info">
                                    <h3>Ford Cascavel</h3>
                                    <p>Atendimento especializado</p>
                                    <a href="https://maps.app.goo.gl/yr9txJUpy7LZRQCv9"  class="location-btn">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                                            <path d="M21 10C21 17L12 23L3 10C3 5.02944 7.02944 1 12 1C16.9706 1 21 5.02944 21 10Z" stroke="currentColor" stroke-width="2"/>
                                            <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="2"/>
                                        </svg>
                                        <span>Como Chegar</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="location-card">
                                <div class="location-image">
                                    <img src="assets/UMUARAMA.jpg" alt="Ford Umuarama">
                                </div>
                                <div class="location-info">
                                    <h3>Ford Umuarama</h3>
                                    <p>Tradição e qualidade</p>
                                    <a href="https://maps.app.goo.gl/HQgWAT6iTvh7ojBa6"  class="location-btn">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                                            <path d="M21 10C21 17L12 23L3 10C3 5.02944 7.02944 1 12 1C16.9706 1 21 5.02944 21 10Z" stroke="currentColor" stroke-width="2"/>
                                            <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="2"/>
                                        </svg>
                                        <span>Como Chegar</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="location-card">
                                <div class="location-image">
                                    <img src="assets/PATO BRANCO.png" alt="Ford Pato Branco">
                                </div>
                                <div class="location-info">
                                    <h3>Ford Pato Branco</h3>
                                    <p>Excelência no atendimento</p>
                                    <a href="https://maps.app.goo.gl/71gJEKKnhbQkdgeP9"  class="location-btn">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                                            <path d="M21 10C21 17L12 23L3 10C3 5.02944 7.02944 1 12 1C16.9706 1 21 5.02944 21 10Z" stroke="currentColor" stroke-width="2"/>
                                            <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="2"/>
                                        </svg>
                                        <span>Como Chegar</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="location-card">
                                <div class="location-image">
                                    <img src="assets/FOZ DO IGUAÇU.jpg" alt="Ford Foz do Iguaçu">
                                </div>
                                <div class="location-info">
                                    <h3>Ford Foz do Iguaçu</h3>
                                    <p>Atendimento de fronteira</p>
                                    <a href="#"  class="location-btn">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                                            <path d="M21 10C21 17L12 23L3 10C3 5.02944 7.02944 1 12 1C16.9706 1 21 5.02944 21 10Z" stroke="currentColor" stroke-width="2"/>
                                            <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="2"/>
                                        </svg>
                                        <span>Como Chegar</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="location-card">
                                <div class="location-image">
                                    <img src="assets/GUARAPUAVA.jpg" alt="Ford Guarapuava">
                                </div>
                                <div class="location-info">
                                    <h3>Ford Guarapuava</h3>
                                    <p>Compromisso com você</p>
                                    <a href="https://maps.app.goo.gl/MGC5abi6Xuxkr8nX7"  class="location-btn">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                                            <path d="M21 10C21 17L12 23L3 10C3 5.02944 7.02944 1 12 1C16.9706 1 21 5.02944 21 10Z" stroke="currentColor" stroke-width="2"/>
                                            <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="2"/>
                                        </svg>
                                        <span>Como Chegar</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="location-card">
                                <div class="location-image">
                                    <img src="assets/lojaford.jpeg" alt="Ford Toledo">
                                </div>
                                <div class="location-info">
                                    <h3>Ford Toledo</h3>
                                    <p>Compromisso com você</p>
                                    <a href="https://share.google/tGbfmquDinJ7OpCH4"  class="location-btn">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                                            <path d="M21 10C21 17L12 23L3 10C3 5.02944 7.02944 1 12 1C16.9706 1 21 5.02944 21 10Z" stroke="currentColor" stroke-width="2"/>
                                            <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="2"/>
                                        </svg>
                                        <span>Como Chegar</span>
                                    </a>
                                </div>
                            </div>
                        </div>


                        <div class="swiper-slide">
                            <div class="location-card">
                                <div class="location-image">
                                    <img src="assets/fordrondo.jpeg" alt="Ford Rondonópolis">
                                </div>
                                <div class="location-info">
                                    <h3>Ford Rondonópolis</h3>
                                    <p>Sua Concessionária Fancar no Mato Grosso</p>
                                    <a href="https://share.google/7VC88fokI3917SAw0"  class="location-btn">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                                            <path d="M21 10C21 17L12 23L3 10C3 5.02944 7.02944 1 12 1C16.9706 1 21 5.02944 21 10Z" stroke="currentColor" stroke-width="2"/>
                                            <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="2"/>
                                        </svg>
                                        <span>Como Chegar</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- WhatsApp Widget -->
     <div class="whatsapp-widget">
        <button id="whatsapp-toggle" class="whatsapp-btn" aria-label="Abrir chat WhatsApp">
            <svg viewBox="0 0 24 24" fill="currentColor">
                <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893A11.821 11.821 0 0020.465 3.63"/>
            </svg>
        </button>

        <div class="whatsapp-form" id="whatsappForm">
            <div class="whatsapp-header">
                <h4>Fale Conosco</h4>
                <button class="close-btn" id="closeWhatsapp">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                        <path d="M18 6L6 18M6 6L18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
            </div>

            <form action="" method="post" class="whatsapp-contact-form">
                <div class="form-group">
                    <input type="text" name="name" placeholder="Nome" required>
                </div>
                <div class="form-group">
                    <input type="tel" name="phone" placeholder="Telefone" required>
                </div>
                <div class="form-group">
                    <input type="text" name="city" placeholder="Cidade" required>
                </div>
                <div class="form-group">
                    <input type="text" name="car" placeholder="Carro de interesse" required>
                </div>
                <input type="hidden" name="var" value="second">
                
                <p class="form-disclaimer">
                    Ao preencher o formulário, você está ciente que a Ford Fancar poderá enviar comunicações de acordo com os seus interesses. 
                    <a href="https://ford.fancar.com.br/politica-de-privacidade" >Política de Privacidade</a>
                </p>
                
                <button type="submit" class="whatsapp-submit-btn">
                    <span>Enviar</span>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                        <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer class="modern-footer">
        <div class="footer-container">
            <div class="footer-content">
                <div class="footer-brand">
                    <img src="assets/FORDFANCAR.png" alt="Ford Fancar" class="footer-logo">
                    <p class="footer-description">
                        Há mais de 30 anos oferecendo os melhores veículos Ford com atendimento especializado e compromisso com a excelência.
                    </p>
                    <div class="footer-social">
                        <a href="#" class="social-link" aria-label="Facebook">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                                <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link" aria-label="Instagram">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                                <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link" aria-label="YouTube">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                                <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
                            </svg>
                        </a>
                    </div>
                </div>

                <div class="footer-links">
                    <div class="footer-column">
                        <h4>Serviços</h4>
                        <ul>
                            <li><a href="https://seminovos.fancar.com.br" >Seminovos</a></li>
                            <li><a href="https://www.consorciofancar.com.br" >Consórcio</a></li>
                            <li><a href="https://fancor.com.br" >Seguros</a></li>
                            <li><a href="#" onclick="scrollToForm()">Fale Conosco</a></li>
                        </ul>
                    </div>

                    <div class="footer-column">
                        <h4>Modelos Ford</h4>
                        <ul>
                            <li><a href="#" onclick="selectVehicle('maverick')">Maverick</a></li>
                            <li><a href="#" onclick="selectVehicle('f150')">F-150</a></li>
                            <li><a href="#" onclick="selectVehicle('bronco')">Bronco</a></li>
                            <li><a href="#" onclick="selectVehicle('mustang')">Mustang</a></li>
                            <li><a href="#" onclick="selectVehicle('ranger')">Ranger</a></li>
                            <li><a href="#" onclick="selectVehicle('territory')">Territory</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</body>
<%
if (request.getMethod().equals("POST")) {
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String city = request.getParameter("city");
    String car = request.getParameter("car");
    String var = request.getParameter("var");

    Properties mailProps = new Properties();
    mailProps.put("mail.smtp.host", "smtp.grupofancar.com.br");
    mailProps.put("mail.smtp.port", "587");
    mailProps.put("mail.smtp.auth", "true");
    mailProps.put("mail.smtp.starttls.enable", "false");

    String senderEmail = "agendaprocessos@grupofancar.com.br";
    String senderPassword = "9An6Go4T";

    List<String> recipients = new ArrayList<>();
    recipients.add("marcos.g@grupofancar.com.br");
    recipients.add("mkt4@grupofancar.com.br");
    recipients.add("mkt1@grupofancar.com.br");
    recipients.add("ellen.lopes@fancar.com.br");
        
    Session sessions = Session.getInstance(mailProps, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(senderEmail, senderPassword);
        }
    });

    try {
        Message message = new MimeMessage(sessions);
        message.setFrom(new InternetAddress(senderEmail));

        for (String recipient : recipients) {
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        }
        
        message.setSubject("Nova Solicitação Ford - " + name);

        String charset = "UTF-8";
        String currentDate = new SimpleDateFormat("dd/MM/yyyy 'às' HH:mm").format(new java.util.Date());
        
        StringBuilder emailBuilder = new StringBuilder();
        emailBuilder.append("<!DOCTYPE html>");
        emailBuilder.append("<html lang='pt-BR'>");
        emailBuilder.append("<head>");
        emailBuilder.append("<meta charset='UTF-8'>");
        emailBuilder.append("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        emailBuilder.append("<title>Solicitação Ford</title>");
        emailBuilder.append("<style>");
        emailBuilder.append("* { margin: 0; padding: 0; box-sizing: border-box; }");
        emailBuilder.append("body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); padding: 20px; }");
        emailBuilder.append(".email-container { max-width: 650px; margin: 0 auto; background: #ffffff; border-radius: 20px; overflow: hidden; box-shadow: 0 20px 40px rgba(0,0,0,0.1); }");
        
        // Header Ford
        emailBuilder.append(".header { background: linear-gradient(135deg, #003478 0%, #0066cc 100%); padding: 30px; text-align: center; position: relative; }");
        emailBuilder.append(".ford-logo { color: #ffffff; font-size: 32px; font-weight: bold; letter-spacing: 3px; margin-bottom: 10px; position: relative; z-index: 1; }");
        emailBuilder.append(".header-subtitle { color: #b3d9ff; font-size: 16px; position: relative; z-index: 1; }");
        
        // Badge de notificação
        emailBuilder.append(".notification-badge { background: #ff6b35; color: white; padding: 8px 20px; border-radius: 25px; display: inline-block; margin: 20px 0; font-weight: bold; font-size: 14px; }");
        
        // Conteúdo principal
        emailBuilder.append(".content { padding: 40px 30px; }");
        emailBuilder.append(".welcome-message { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 25px; border-radius: 15px; margin-bottom: 30px; text-align: center; }");
        emailBuilder.append(".welcome-message h2 { font-size: 24px; margin-bottom: 10px; }");
        emailBuilder.append(".welcome-message p { font-size: 16px; opacity: 0.9; }");
        
        // Card de informações
        emailBuilder.append(".info-card { background: #f8fafc; border: 2px solid #e2e8f0; border-radius: 15px; padding: 25px; margin: 20px 0; }");
        emailBuilder.append(".info-card h3 { color: #2d3748; font-size: 20px; margin-bottom: 20px; display: flex; align-items: center; }");
        
        // Grid de informações
        emailBuilder.append(".info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 15px; }");
        emailBuilder.append(".info-item { background: white; padding: 15px; border-radius: 10px; border-left: 4px solid #0066cc; }");
        emailBuilder.append(".info-label { font-size: 12px; color: #718096; text-transform: uppercase; font-weight: bold; margin-bottom: 5px; }");
        emailBuilder.append(".info-value { font-size: 16px; color: #2d3748; font-weight: 600; }");
        
        // Destaque do veículo
        emailBuilder.append(".vehicle-highlight { background: linear-gradient(135deg, #ff6b35 0%, #f7931e 100%); color: white; padding: 20px; border-radius: 15px; margin: 20px 0; text-align: center; }");
        emailBuilder.append(".vehicle-highlight h4 { font-size: 18px; margin-bottom: 10px; }");
        emailBuilder.append(".vehicle-highlight .car-name { font-size: 24px; font-weight: bold; }");
        
        // Timestamp
        emailBuilder.append(".timestamp { background: #edf2f7; padding: 15px; border-radius: 10px; text-align: center; margin: 20px 0; }");
        emailBuilder.append(".timestamp-label { font-size: 12px; color: #718096; margin-bottom: 5px; }");
        emailBuilder.append(".timestamp-value { font-size: 14px; color: #4a5568; font-weight: 600; }");
        
        // Call to action
        emailBuilder.append(".cta-section { background: linear-gradient(135deg, #48bb78 0%, #38a169 100%); color: white; padding: 25px; border-radius: 15px; text-align: center; margin: 30px 0; }");
        emailBuilder.append(".cta-title { font-size: 20px; margin-bottom: 10px; }");
        emailBuilder.append(".cta-subtitle { font-size: 14px; opacity: 0.9; }");
        
        // Footer
        emailBuilder.append(".footer { background: #2d3748; color: #a0aec0; padding: 25px; text-align: center; }");
        emailBuilder.append(".footer-logo { color: #ffffff; font-size: 18px; font-weight: bold; margin-bottom: 10px; }");
        emailBuilder.append(".footer-text { font-size: 12px; line-height: 1.5; }");
        
        // Responsivo
        emailBuilder.append("@media (max-width: 600px) {");
        emailBuilder.append(".info-grid { grid-template-columns: 1fr; }");
        emailBuilder.append(".content { padding: 20px 15px; }");
        emailBuilder.append(".ford-logo { font-size: 24px; }");
        emailBuilder.append("}");
        emailBuilder.append("</style>");
        emailBuilder.append("</head>");
        emailBuilder.append("<body>");
        emailBuilder.append("<div class='email-container'>");
        
        // Header
        emailBuilder.append("<div class='header'>");
        emailBuilder.append("<div class='ford-logo'>FORD</div>");
        emailBuilder.append("</div>");
        
        // Conteúdo
        emailBuilder.append("<div class='content'>");
        emailBuilder.append("<div class='notification-badge'>🔔 Nova Solicitação Recebida</div>");
        
        emailBuilder.append("<div class='welcome-message'>");
        emailBuilder.append("<h2>Solicitação de Interesse</h2>");
        emailBuilder.append("<p>Um novo cliente demonstrou interesse em nossos veículos Ford</p>");
        emailBuilder.append("</div>");
        
        emailBuilder.append("<div class='info-card'>");
        emailBuilder.append("<h3>👤 Informações do Cliente</h3>");
        emailBuilder.append("<div class='info-grid'>");
        
        emailBuilder.append("<div class='info-item'>");
        emailBuilder.append("<div class='info-label'>Nome Completo</div>");
        emailBuilder.append("<div class='info-value'>").append(name != null ? name : "Não informado").append("</div>");
        emailBuilder.append("</div>");
        
        emailBuilder.append("<div class='info-item'>");
        emailBuilder.append("<div class='info-label'>Telefone</div>");
        emailBuilder.append("<div class='info-value'>").append(phone != null ? phone : "Não informado").append("</div>");
        emailBuilder.append("</div>");
        
        emailBuilder.append("<div class='info-item'>");
        emailBuilder.append("<div class='info-label'>Cidade</div>");
        emailBuilder.append("<div class='info-value'>").append(city != null ? city : "Não informado").append("</div>");
        emailBuilder.append("</div>");
        
        emailBuilder.append("<div class='info-item'>");
        emailBuilder.append("<div class='info-label'>Origem</div>");
        emailBuilder.append("<div class='info-value'>Site Ford Fancar</div>");
        emailBuilder.append("</div>");
        
        emailBuilder.append("</div>");
        emailBuilder.append("</div>");
        
        emailBuilder.append("<div class='vehicle-highlight'>");
        emailBuilder.append("<h4>🚗 Veículo de Interesse</h4>");
        emailBuilder.append("<div class='car-name'>").append(car != null ? car : "Não especificado").append("</div>");
        emailBuilder.append("</div>");
        
        emailBuilder.append("<div class='timestamp'>");
        emailBuilder.append("<div class='timestamp-label'>DATA E HORA DA SOLICITAÇÃO</div>");
        emailBuilder.append("<div class='timestamp-value'>📅 ").append(currentDate).append("</div>");
        emailBuilder.append("</div>");
        
        emailBuilder.append("<div class='cta-section'>");
        emailBuilder.append("<div class='cta-title'>⚡ Ação Recomendada</div>");
        emailBuilder.append("<div class='cta-subtitle'>Entre em contato com o cliente o mais breve possível para oferecer as melhores condições Ford</div>");
        emailBuilder.append("</div>");
        
        emailBuilder.append("</div>");
        
        emailBuilder.append("</div>");
        emailBuilder.append("</body>");
        emailBuilder.append("</html>");

        String conteudoEmail = emailBuilder.toString();

        message.setContent(conteudoEmail, "text/html; charset=" + charset);
        Transport.send(message);

        if(var != null && var.equals("first")){
            out.println("<script>");
            out.println("window.location.href = 'https://meuford.fancar.com.br/templates/index.jsp';");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("window.location.href = 'https://api.whatsapp.com/send?phone=554230266042&text=Olá, quero saber mais sobre as condições exclusivas Ford Fancar.';");
            out.println("</script>");
        }
    } catch (MessagingException e) {
        e.printStackTrace();
        out.println("<script>alert('Erro ao enviar email: " + e.getMessage().replace("'", "\'") + "');</script>");
    }
}

%>
