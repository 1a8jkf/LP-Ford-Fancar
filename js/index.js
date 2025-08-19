document.addEventListener("DOMContentLoaded", function () {
  const loadingScreen = document.getElementById("loadingScreen");

  window.addEventListener("load", function () {
    setTimeout(() => {
      loadingScreen.classList.add("hidden");
    }, 1500);
  });

  const mobileMenuToggle = document.getElementById("mobileMenuToggle");
  const mobileMenu = document.getElementById("mobileMenu");

  if (mobileMenuToggle && mobileMenu) {
    mobileMenuToggle.addEventListener("click", function () {
      mobileMenuToggle.classList.toggle("active");
      mobileMenu.classList.toggle("active");
    });
  }

  let currentSlide = 0;
  const slides = document.querySelectorAll(".vehicle-slide");
  const indicators = document.querySelectorAll(".indicator");
  const prevBtn = document.getElementById("prevSlide");
  const nextBtn = document.getElementById("nextSlide");

  function showSlide(index) {
    slides.forEach((slide, i) => {
      slide.classList.toggle("active", i === index);
    });

    indicators.forEach((indicator, i) => {
      indicator.classList.toggle("active", i === index);
    });

    const vehicleData = slides[index].getAttribute("data-vehicle");
    updateFormSelect(vehicleData);
  }

  function nextSlide() {
    currentSlide = (currentSlide + 1) % slides.length;
    showSlide(currentSlide);
  }

  function prevSlide() {
    currentSlide = (currentSlide - 1 + slides.length) % slides.length;
    showSlide(currentSlide);
  }

  if (nextBtn) nextBtn.addEventListener("click", nextSlide);
  if (prevBtn) prevBtn.addEventListener("click", prevSlide);

  indicators.forEach((indicator, index) => {
    indicator.addEventListener("click", () => {
      currentSlide = index;
      showSlide(currentSlide);
    });
  });

  setInterval(nextSlide, 5000);

  function updateFormSelect(vehicleData) {
    const carSelect = document.getElementById("car");
    if (carSelect && vehicleData) {
      const vehicleMap = {
        "maverick-tremor": "Maverick Tremor",
        "maverick-black": "Maverick Black",
        f150: "F-150 Platinum",
        bronco: "Bronco",
        mustang: "Mustang",
        ranger: "Ranger",
        raptor: "Ranger Raptor",
        territory: "Territory",
        transit: "Transit",
      };

      if (vehicleMap[vehicleData]) {
        carSelect.value = vehicleMap[vehicleData];
      }
    }
  }

  const tabBtns = document.querySelectorAll(".tab-btn");
  const vehicleDetailContent = document.getElementById("vehicleDetailContent");

  const vehicleDetails = {
    maverick: {
      title: "Ford Maverick",
      image: "assets/MVATREMOR.png",
      features: [
        {
          title: "Motor EcoBoost",
          description: "Motor 2.0L Turbo EcoBoost GTDi",
        },
        { title: "Transmissão", description: "Automática de 8 velocidades" },
        {
          title: "Transmissão",
          description: "Transmissão Automática de 8 velocidades",
        },
        {
          title: "Conectividade",
          description: "Central multifuncional SYNC 4 de 13,2”",
        },
      ],
      specs: {
        Potência: "253 cv",
        Torque: "380 Nm",
        Combustível: "Gasolina",
        "Sistema Multimidia:": "Android Auto e Apple CarPlay Wireless",
      },
    },
    f150: {
      title: "Ford F-150",
      image: "assets/carros-form/F150 SLIDE.png",
      features: [
        {
          icon: "💪",
          title: "Rodas:",
          description: 'Escurecidas* ou Cromadas* 20"',
        },
        {
          icon: "🏗️",
          title: "Sistema de som:",
          description:
            "Premium com 14 Alto-falantes feito por Bang & Olufsen HD Radio™",
        },
        {
          icon: "🛡️",
          title: "Caçamba",
          description: "Abertura elétrica da porta da caçamba",
        },
        { icon: "🎛️", title: "Motor", description: "Motor Coyote 5.0L V8" },
      ],
      specs: {
        Potência: "405 cv",
        Torque: "556 Nm",
        Reboque: "3.492 kg",
        Tecnologia: "FordPass™ Connect",
      },
    },
    bronco: {
      title: "Ford Bronco",
      image: "assets/NOVO BRONCO(1920 x 1080) (1).png",
      features: [
        {
          icon: "🏔️",
          title: "Multimídia",
          description: "Compatível com Android Auto e Apple CarPlay sem fio",
        },
        {
          icon: "🔧",
          title: "Recursos",
          description:
            "Chave com sensor de presença: Acesso inteligente e Partida sem chave",
        },
        {
          icon: "🎯",
          title: "G.O.A.T. Modes",
          description: "7 modos de condução",
        },
        {
          icon: "💧",
          title: "Tecnologia",
          description: "Assistente de manobras evasivas",
        },
      ],
      specs: {
        Motor: "2.0L EcoBoost",
        Potência: "253 cv",
        Torque: "380 Nm",
        Tecnologia: "FordPass™ Connect",
      },
    },
    mustang: {
      title: "Ford Mustang",
      image: "assets/carros-form/MUSTANG_GT_PERFORMANCE__1920_x_1080.png",
      features: [
        {
          icon: "🏁",
          title: "Design",
          description:
            "A evolução da icônica silhueta do cupê esportivo mais vendido no mundo.",
        },
        {
          icon: "⚡",
          title: "Performance",
          description:
            "Potência, torque e dirigibilidade para uma experiência de pilotagem sem igual.",
        },
        {
          icon: "🎵",
          title: "Suspesão",
          description: "Suspensão Adaptativa MagneRide®",
        },
        {
          icon: "🏎️",
          title: "Escapamento",
          description:
            "Escapamento duplo com 4 ponteiras cromadas e ajuste de válvula ativo",
        },
      ],
      specs: {
        Potência: "488 cv",
        Torque: "564 Nm",
        Motor: "Coyote 5.0L V8",
        "Transmissão automática": "10 Velocidades",
      },
    },
    ranger: {
      title: "Ford Ranger",
      image: "assets/carros-form/RANGER_LIMITED+KIT__1920_x_1080.png",
      features: [
        {
          icon: "🥇",
          title: "Modos de condução",
          description: "Até 6 modos de condução selecionáveis",
        },
        {
          icon: "💪",
          title: "Motor",
          description: "Motor 2.0 turbo Diesel ou Motor 3.0 V6 turbo Diesel",
        },
        { icon: "🛡️", title: "Tecnologia", description: "Piloto automático" },
        {
          icon: "🔧",
          title: "Versatilidade",
          description: "Ideal para trabalho e lazer",
        },
      ],
      specs: {
        Multimídia: 'Sync 4 com Tela de 10" e 12”',
        "Painel de instrumentos:": "Colorido e com 8”",
        Travas: "Travamento e destravamento remoto.",
        Tecnologia: "FordPass™ Connect",
      },
    },
    raptor: {
      title: "Ford Ranger Raptor",
      image: "assets/carros-form/RANGER_RAPTOR__1920_x_1080.png",
      features: [
        {
          icon: "🏆",
          title: "Performance",
          description:
            "A Ranger Raptor é equipada com o motor mais potente já lançado no segmento no Brasil",
        },
        {
          icon: "🏃",
          title: "Capacidade Off-Road",
          description:
            "Nascida para superar qualquer desafio off-road: a Ranger Raptor possui 7 modos de condução",
        },
        {
          icon: "🎯",
          title: "Tecnologia e Conectividade",
          description:
            'Novo sistema multimídia da Ford, com Sync 4 e painel Full Digital de 12.4"',
        },
        {
          icon: "🔥",
          title: "Interior",
          description:
            "A combinação perfeita entre luxo, tecnologia e muita esportividade.",
        },
      ],
      specs: {
        "Navegador Off-Road":
          "Uma ferramenta que possibilita explorar os terrenos mais desafiadores.",
        Câmbio: "Câmbio eletrônico de 10 velocidades",
        Rodas: "Rodas de liga leve 20”",
        Tecnologia: "FordPass™ Connect",
      },
    },
    territory: {
      title: "Ford Territory",
      image: "assets/carros-form/NOVA TERRITORY(1920 x 1080) (3).png",
      features: [
        {
          icon: "👨‍👩‍👧‍👦",
          title: "Transmissão",
          description: "Transmissão Automática de 7 Velocidades",
        },
        {
          icon: "🤖",
          title: "Interior",
          description:
            "Banco do motorista com ajuste elétrico de 10 posições, incluindo ajuste lombar",
        },
        {
          icon: "🛡️",
          title: "Central multimídia",
          description:
            "Multimídia com tela digital de 12.3” sensível ao toque, compatível com Android Auto e Apple Car Play e comando de voz.",
        },
        {
          icon: "📱",
          title: "Faróis",
          description: "Conjunto Óptico Full LED e ajuste de altura",
        },
      ],
      specs: {
        Motor: "1.5L EcoBoost",
        Potência: "169 cv",
        Torque: "260 nm",
        Tecnologia: "FordPass™ Connect",
      },
    },
    transit: {
      title: "Ford Transit",
      image: "assets/carros-form/TRANSIT__1920_x_1080.png",
      features: [
        {
          icon: "📦",
          title: "Carga Máxima",
          description: "Até 15,1 m³ de volume de carga",
        },
        {
          icon: "💼",
          title: "Negócios",
          description: "Ideal para empresas e autônomos",
        },
        {
          icon: "⚙️",
          title: "Durabilidade",
          description: "Motor Duratorq 2.2L confiável",
        },
        {
          icon: "🔧",
          title: "Versatilidade",
          description: "Diversas configurações disponíveis",
        },
      ],
      specs: {
        EcoCoach: "Condução inteligente",
        Motor: "Diesel Ecoblue® 2.0L",
        Potência: "165 cv",
        Tecnologia: "FordPass™ Connect",
      },
    },
  };

  function loadVehicleDetails(vehicle) {
    const data = vehicleDetails[vehicle];
    if (!data) return;

    const vehicleDetailGrid = document.createElement("div");
    vehicleDetailGrid.className = "vehicle-detail-grid";

    const vehicleDetailImage = document.createElement("div");
    vehicleDetailImage.className = "vehicle-detail-image";

    const detailVehicleImg = document.createElement("img");
    detailVehicleImg.src = data.image;
    detailVehicleImg.alt = data.title;
    detailVehicleImg.className = "detail-vehicle-img";

    vehicleDetailImage.appendChild(detailVehicleImg);

    const vehicleDetailInfo = document.createElement("div");
    vehicleDetailInfo.className = "vehicle-detail-info";

    const detailTitle = document.createElement("h3");
    detailTitle.className = "detail-title";
    detailTitle.textContent = data.title;

    const vehicleFeaturesGrid = document.createElement("div");
    vehicleFeaturesGrid.className = "vehicle-features-grid";

    data.features.forEach((feature) => {
      const featureCard = document.createElement("div");
      featureCard.className = "feature-card";

      const featureIcon = document.createElement("div");
      featureIcon.className = "feature-icon";
      featureIcon.textContent = feature.icon;

      const featureContent = document.createElement("div");
      featureContent.className = "feature-content";

      const featureTitle = document.createElement("h4");
      featureTitle.textContent = feature.title;

      const featureDescription = document.createElement("p");
      featureDescription.textContent = feature.description;

      featureContent.appendChild(featureTitle);
      featureContent.appendChild(featureDescription);

      featureCard.appendChild(featureIcon);
      featureCard.appendChild(featureContent);

      vehicleFeaturesGrid.appendChild(featureCard);
    });

    const vehicleSpecs = document.createElement("div");
    vehicleSpecs.className = "vehicle-specs";

    const specsTitle = document.createElement("h4");
    specsTitle.textContent = "Especificações Técnicas";

    const specsGrid = document.createElement("div");
    specsGrid.className = "specs-grid";

    Object.entries(data.specs).forEach(([key, value]) => {
      const specItem = document.createElement("div");
      specItem.className = "spec-item";

      const specLabel = document.createElement("span");
      specLabel.className = "spec-label";
      specLabel.textContent = key + ":";

      const specValue = document.createElement("span");
      specValue.className = "spec-value";
      specValue.textContent = value;

      specItem.appendChild(specLabel);
      specItem.appendChild(specValue);

      specsGrid.appendChild(specItem);
    });

    vehicleSpecs.appendChild(specsTitle);
    vehicleSpecs.appendChild(specsGrid);

    vehicleDetailInfo.appendChild(detailTitle);
    vehicleDetailInfo.appendChild(vehicleFeaturesGrid);
    vehicleDetailInfo.appendChild(vehicleSpecs);

    vehicleDetailGrid.appendChild(vehicleDetailImage);
    vehicleDetailGrid.appendChild(vehicleDetailInfo);

    vehicleDetailContent.innerHTML = "";
    vehicleDetailContent.appendChild(vehicleDetailGrid);
  }

  tabBtns.forEach((btn) => {
    btn.addEventListener("click", function () {
      const vehicle = this.getAttribute("data-vehicle");

      tabBtns.forEach((tab) => tab.classList.remove("active"));
      this.classList.add("active");

      loadVehicleDetails(vehicle);
    });
  });

  loadVehicleDetails("maverick");

  if (document.querySelector(".locations-swiper")) {
    new Swiper(".locations-swiper", {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      autoplay: {
        delay: 4000,
        disableOnInteraction: false,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      breakpoints: {
        640: {
          slidesPerView: 2,
        },
        1024: {
          slidesPerView: 3,
        },
      },
    });
  }

  const whatsappToggle = document.getElementById("whatsapp-toggle");
  const whatsappForm = document.getElementById("whatsappForm");
  const closeWhatsapp = document.getElementById("closeWhatsapp");

  console.log("WhatsApp Toggle:", whatsappToggle);
  console.log("WhatsApp Form:", whatsappForm);
  console.log("Close Button:", closeWhatsapp);

  if (whatsappToggle && whatsappForm) {
    whatsappToggle.addEventListener("click", function (e) {
      e.preventDefault();
      console.log("Botão clicado!");
      whatsappForm.classList.add("active");
    });
  }

  if (closeWhatsapp && whatsappForm) {
    closeWhatsapp.addEventListener("click", function (e) {
      e.preventDefault();
      console.log("Fechar clicado!");
      whatsappForm.classList.remove("active");
    });
  }

  document.addEventListener("click", function (e) {
    if (
      whatsappForm &&
      whatsappToggle &&
      !whatsappForm.contains(e.target) &&
      !whatsappToggle.contains(e.target)
    ) {
      whatsappForm.classList.remove("active");
    }
  });

  window.scrollToForm = function () {
    const contactForm = document.getElementById("contactForm");
    if (contactForm) {
      const headerHeight =
        document.querySelector(".modern-header").offsetHeight;
      const targetPosition = contactForm.offsetTop - headerHeight - 20;

      window.scrollTo({
        top: targetPosition,
        behavior: "smooth",
      });
    }
  };

  window.selectVehicle = function (vehicle) {
    const carSelect = document.getElementById("car");
    if (carSelect) {
      const vehicleMap = {
        maverick: "Maverick Tremor",
        f150: "F-150 Platinum",
        bronco: "Bronco",
        mustang: "Mustang",
        ranger: "Ranger",
        territory: "Territory",
      };

      if (vehicleMap[vehicle]) {
        carSelect.value = vehicleMap[vehicle];
        scrollToForm();
      }
    }
  };

  const header = document.querySelector(".modern-header");
  let lastScrollY = window.scrollY;

  window.addEventListener("scroll", function () {
    const currentScrollY = window.scrollY;

    if (currentScrollY > 100) {
      header.style.background = "rgba(0, 52, 120, 0.98)";
      header.style.boxShadow = "0 4px 20px rgba(0, 0, 0, 0.1)";
    } else {
      header.style.background = "rgba(0, 52, 120, 0.95)";
      header.style.boxShadow = "none";
    }

    lastScrollY = currentScrollY;
  });

  const forms = document.querySelectorAll("form");

  forms.forEach((form) => {
    form.addEventListener("submit", function (e) {
      e.preventDefault();

      const submitBtn = this.querySelector('button[type="submit"]');
      const originalText = submitBtn.innerHTML;

      const requiredFields = this.querySelectorAll("[required]");
      let isValid = true;

      requiredFields.forEach((field) => {
        if (!field.value.trim()) {
          isValid = false;
          field.style.borderColor = "var(--accent-color)";
          field.focus();
        } else {
          field.style.borderColor = "var(--gray-200)";
        }
      });

      if (isValid) {
        submitBtn.innerHTML = "<span>Enviando...</span>";
        submitBtn.disabled = true;

        setTimeout(() => {
          this.submit();
        }, 1000);
      }
    });
  });

  const phoneInputs = document.querySelectorAll('input[type="tel"]');
  phoneInputs.forEach((input) => {
    input.addEventListener("input", function (e) {
      let value = e.target.value.replace(/\D/g, "");
      value = value.replace(/(\d{2})(\d)/, "($1) $2");
      value = value.replace(/(\d{5})(\d)/, "$1-$2");
      e.target.value = value;
    });
  });

  const observerOptions = {
    threshold: 0.1,
    rootMargin: "0px 0px -50px 0px",
  };

  const observer = new IntersectionObserver(function (entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("animated");
      }
    });
  }, observerOptions);

  const animateElements = document.querySelectorAll(
    ".location-card, .vehicle-detail-content, .section-header"
  );
  animateElements.forEach((el) => {
    el.classList.add("animate-on-scroll");
    observer.observe(el);
  });

  function trackEvent(eventName, properties = {}) {
    if (typeof gtag !== "undefined") {
      gtag("event", eventName, properties);
    }

    if (typeof fbq !== "undefined") {
      fbq("track", eventName, properties);
    }
  }

  tabBtns.forEach((btn) => {
    btn.addEventListener("click", function () {
      const vehicle = this.getAttribute("data-vehicle");
      trackEvent("vehicle_interest", {
        vehicle_name: vehicle,
      });
    });
  });

  forms.forEach((form) => {
    form.addEventListener("submit", function () {
      const carSelect = this.querySelector('select[name="car"]');
      const vehicle = carSelect ? carSelect.value : "unknown";

      trackEvent("lead_generated", {
        vehicle_interest: vehicle,
        form_type: this.closest(".whatsapp-form") ? "whatsapp" : "main",
      });
    });
  });

  console.log("🚗 Ford Fancar Modern Site Initialized Successfully!");
});

const additionalCSS = `
        .vehicle-detail-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: var(--space-8);
            align-items: start;
        }

        .vehicle-detail-image {
            text-align: center;
        }

        .detail-vehicle-img {
            max-width: 100%;
            height: auto;
            filter: drop-shadow(0 10px 20px rgba(0, 0, 0, 0.1));
        }

        .detail-title {
            font-size: var(--text-3xl);
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: var(--space-6);
        }

        .vehicle-features-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: var(--space-4);
            margin-bottom: var(--space-8);
        }

        .feature-card {
            background: var(--gray-50);
            padding: var(--space-4);
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            gap: var(--space-3);
            transition: all var(--transition-normal);
        }

        .feature-card:hover {
            background: var(--gray-100);
            transform: translateY(-2px);
        }

        .feature-icon {
            font-size: var(--text-2xl);
            flex-shrink: 0;
        }

        .feature-content h4 {
            font-size: var(--text-sm);
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: var(--space-1);
        }

        .feature-content p {
            font-size: var(--text-xs);
            color: var(--gray-600);
            line-height: 1.4;
        }

        .vehicle-specs h4 {
            font-size: var(--text-lg);
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: var(--space-4);
        }

        .specs-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: var(--space-3);
        }

        .spec-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--space-3);
            background: var(--white);
            border-radius: var(--radius-md);
            border: 1px solid var(--gray-200);
        }

        .spec-label {
            font-weight: 500;
            color: var(--gray-700);
            font-size: var(--text-sm);
        }

        .spec-value {
            font-weight: 600;
            color: var(--primary-color);
            font-size: var(--text-sm);
        }

        @media (max-width: 768px) {
            .vehicle-detail-grid {
                grid-template-columns: 1fr;
                gap: var(--space-6);
            }
            
            .vehicle-features-grid {
                grid-template-columns: 1fr;
                gap: var(--space-3);
            }
            
            .specs-grid {
                grid-template-columns: 1fr;
            }
            
            .detail-title {
                font-size: var(--text-2xl);
                text-align: center;
            }
        }
        `;

const style = document.createElement("style");
style.textContent = additionalCSS;
document.head.appendChild(style);
