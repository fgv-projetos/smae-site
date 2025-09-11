<template>
  <main>
    <!-- Header -->
    <header class="header">
      <div class="container">
        <div class="header-content">
          <img
            src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/c5b2a7f3-1904-4199-a864-6b52909aed0f.png"
            alt="SMAE - Sistema de Monitoramento e Acompanhamento Estratégico logo"
            class="logo"
          >

          <nav>
            <ul class="nav-menu">
              <li><a href="#funcionalidades">FUNCIONALIDADES</a></li>
              <li><a href="#modulos">MÓDULOS</a></li>
              <li><a href="#use-case">USE CASE</a></li>
              <li><a href="#mais-comercio">MAIS COMERCIO</a></li>
              <li><a href="#video-tecnica">VIDEO TECNICA</a></li>
              <li><a href="#guia-uso">GUIA PARA USO</a></li>
              <li><a href="#contato">COMECE A USAR</a></li>
            </ul>
            <button
              class="mobile-menu-btn"
              onclick="toggleMobileMenu()"
            >
              ☰
            </button>
          </nav>
        </div>
      </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
      <div class="container">
        <div class="hero-icon">
          <img
            src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/0162f933-add8-4967-b710-ba45d3cd50a3.png"
            alt="SMAE system icon representing monitoring and strategic tracking"
          >
          <!-- <div>logo</div> -->
        </div>
        <h1>Sistema de Monitoramento e Acompanhamento Estratégico</h1>
        <a
          href="#contato"
          class="btn-primary"
        >COMECE A USAR</a>
      </div>
    </section>

    <!-- Features Section -->
    <section
      id="funcionalidades"
      class="features"
    >
      <div class="container">
        <div class="features-grid fade-in">
          <div class="feature-card">
            <div class="feature-icon">
              📊
            </div>
            <h3>Dashboards intuitivos auxiliam na tomada de decisão.</h3>
          </div>
          <div class="feature-card">
            <div class="feature-icon">
              🔗
            </div>
            <h3>Relaciona APIs e bases a bancos de dados.</h3>
          </div>
          <div class="feature-card">
            <div class="feature-icon">
              🔍
            </div>
            <h3>
              Investigação na área de desenvolvimento governamental: SGI, SOI,
              Transferência
            </h3>
          </div>
          <div class="feature-card">
            <div class="feature-icon">
              📝
            </div>
            <h3>
              Promove melhores práticas em gestão de risco para a gestão e
              colaboração na tomada de decisões.
            </h3>
          </div>
          <div class="feature-card">
            <div class="feature-icon">
              💾
            </div>
            <h3>
              Reúne e analisa condutas pertinentes e comportamentos de dados
              entre SMAE e parceiros utilizando métodos e conhecimento avançado.
            </h3>
          </div>
          <div class="feature-card">
            <div class="feature-icon">
              🔎
            </div>
            <h3>
              Gera e mantém a estrutura de integração com plataformas SWM.
            </h3>
          </div>
        </div>
      </div>
    </section>

    <!-- Modules Section -->
    <section
      id="modulos"
      class="modules"
    >
      <div class="container">
        <h2 class="section-title fade-in">
          Módulos do SMAE
        </h2>
        <div class="modules-grid">
          <div class="module-card fade-in">
            <h3>Programa de Metas</h3>
            <p>
              O módulo "Programa de Metas" é uma ferramenta estratégica que
              permite o planejamento, monitoramento e avaliação de metas
              governamentais de forma transparente e eficaz.
            </p>
          </div>
          <div class="module-card fade-in">
            <h3>Gestão de Projetos</h3>
            <p>
              O módulo de Gestão de Projetos oferece transparência e eficiência
              no acompanhamento de projetos estratégicos, permitindo controle
              total sobre cronogramas, recursos e entregas.
            </p>
          </div>
          <div class="module-card fade-in">
            <h3>Monitoramento de Obras</h3>
            <p>
              O módulo de monitoramento de obras foi criado para apoiar a gestão
              pública no controle e acompanhamento de obras de infraestrutura,
              garantindo transparência e eficiência.
            </p>
          </div>
          <div class="module-card fade-in">
            <h3>Transferências Voluntárias</h3>
            <p>
              O módulo de Transferências Voluntárias acompanha demandas,
              processos e execução de transferências de recursos, proporcionando
              maior controle e transparência.
            </p>
          </div>
          <div class="module-card fade-in">
            <h3>Planos Setoriais</h3>
            <p>
              O módulo de Planos Setoriais foi desenvolvido para apoiar a gestão
              estratégica de diferentes setores governamentais, integrando
              planejamento e execução.
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Case Section -->
    <section
      id="use-case"
      class="case-section"
    >
      <div class="container">
        <div class="case-grid fade-in">
          <div class="case-content">
            <h2>Case: Prefeitura Municipal de São Paulo</h2>
            <p>
              A Prefeitura de São Paulo deu um importante passo rumo à
              modernização e eficiência na gestão com o Sistema de Monitoramento
              e Acompanhamento Estratégico (SMAE). Esta solução inovadora tem
              revolucionado a forma como a administração municipal planeja,
              executa e monitora suas políticas públicas.
            </p>
            <br>
            <p>
              O sistema permite um controle mais rigoroso das metas
              estabelecidas, proporcionando transparência e facilitando a tomada
              de decisões baseada em dados concretos e atualizados em tempo
              real.
            </p>
          </div>
          <div class="video-wrapper">
            <img
              src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/89327fda-1568-4582-8ae1-e706e6005a4b.png"
              alt="Video demonstrativo do sistema SMAE sendo utilizado pela Prefeitura de São Paulo, mostrando dashboards e funcionalidades em ação"
            >
          </div>
        </div>
      </div>
    </section>

    <!-- Powered by FGV Section -->
    <section class="powered-by">
      <div class="container">
        <div class="powered-grid fade-in">
          <div>
            <img
              src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/e0591b9c-a536-4c00-8dde-85e96e4b0bb9.png"
              alt="Fundação Getúlio Vargas logo, instituição responsável pelo desenvolvimento do SMAE"
              class="fgv-logo"
            >
            <h3>POWERED BY FGV</h3>
            <p>
              A FGV Projetos, especializada em consultoria pública e produtos
              para o setor público, desenvolveu o SMAE com base em sua vasta
              experiência em gestão governamental e tecnologia aplicada à
              administração pública.
            </p>
            <br>
            <p>
              Nosso compromisso é fornecer soluções que promovam a eficiência,
              transparência e melhoria contínua dos serviços públicos.
            </p>
            <br>
            <a
              href="#contato"
              class="btn-primary"
            >FALE CONOSCO</a>
          </div>
          <div class="map-container">
            <img
              src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/bb4e978e-d84c-47d1-bc89-2ac08cdc7ea1.png"
              alt="Mapa interativo mostrando as regiões e localidades onde o sistema SMAE está sendo implementado no Brasil"
              class="map-image"
            >
          </div>
        </div>
      </div>
    </section>

    <!-- Guidelines Section -->
    <section
      id="guia-uso"
      class="guideline"
    >
      <div class="container">
        <div class="guideline-grid fade-in">
          <div>
            <h3>Guideline para uso</h3>
            <p>
              Nossa documentação completa oferece um guia detalhado para
              implementação e uso do SMAE. Desde a configuração inicial até
              funcionalidades avançadas, você encontrará tudo que precisa para
              maximizar o potencial da plataforma.
            </p>
            <br>
            <p>
              O guia inclui exemplos práticos, casos de uso, boas práticas e
              orientações técnicas para diferentes perfis de usuários, desde
              gestores até técnicos especializados.
            </p>
            <br>
            <a
              href="#documentacao"
              class="btn-primary"
            >LEIA MAIS</a>
          </div>
          <div style="text-align: center">
            <button
              class="btn-secondary"
              onclick="openDonationModal()"
            >
              DOE
            </button>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
      <div class="container">
        <div class="footer-content">
          <div class="footer-logos">
            <img
              src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/e77dfb7f-8a50-41a4-bc38-2662dfcd444b.png"
              alt="SMAE footer logo"
              class="footer-logo"
            >
            <img
              src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/a39e6df6-6513-4353-9b97-36657dad82ab.png"
              alt="FGV footer logo"
              class="footer-logo"
            >
          </div>
          <nav class="footer-links">
            <a href="#privacidade">Política de Privacidade</a>
            <a href="#termos">Termos de Uso</a>
            <a href="#contato">Fale Conosco</a>
            <a href="#cgu">CGU</a>
            <a href="#fgv">FGV</a>
          </nav>
          <div style="text-align: center">
            <img
              src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/86c47e31-8474-46d1-be76-87846282709c.png"
              alt="Governo Federal logo"
              class="footer-logo"
            >
          </div>
        </div>
        <div class="footer-copyright">
          <p>
            © 2024 SMAE - Sistema de Monitoramento e Acompanhamento
            Estratégico. Todos os direitos reservados.
          </p>
        </div>
      </div>
    </footer>
  </main>
</template>

<script lang="ts" setup>
onMounted(() => {
  // Smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener(
      'click', function (e) {
        e.preventDefault()
        const target = document.querySelector(this.getAttribute('href'))
        if (target) {
          target.scrollIntoView({
            behavior: 'smooth',
            block: 'start',
          })
        }
      },
    )
  })

  // Fade in animation on scroll
  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px',
  }

  const observer = new IntersectionObserver(
    function (entries) {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible')
        }
      })
    }, observerOptions,
  )

  document.querySelectorAll('.fade-in').forEach((el) => {
    observer.observe(el)
  })

  // Form contact handler
  function handleContact() {
    alert('Formulário de contato será aberto. Em breve você poderá entrar em contato diretamente conosco!')
  }

  // Initialize animations when page loads
  window.addEventListener(
    'load', function () {
    // Add smooth reveal animation to hero elements
      const heroElements = document.querySelectorAll('.hero > .container > *')
      heroElements.forEach((
        el, index,
      ) => {
        el.style.opacity = '0'
        el.style.transform = 'translateY(30px)'
        setTimeout(
          () => {
            el.style.transition = 'all 0.6s ease'
            el.style.opacity = '1'
            el.style.transform = 'translateY(0)'
          }, index * 200,
        )
      })
    },
  )

  // Add scroll effect to header
  window.addEventListener(
    'scroll', function () {
      const header = document.querySelector('.header')
      if (window.scrollY > 100) {
        header.style.background = 'rgba(30, 58, 95, 0.95)'
        header.style.backdropFilter = 'blur(10px)'
      }
      else {
        header.style.background = 'var(--primary-blue)'
        header.style.backdropFilter = 'none'
      }
    },
  )

  // Add click handlers for CTA buttons
  document.addEventListener(
    'DOMContentLoaded', function () {
      const ctaButtons = document.querySelectorAll('.btn-primary')
      ctaButtons.forEach((button) => {
        if (
          button.textContent.includes('COMECE A USAR')
          || button.textContent.includes('FALE CONOSCO')
        ) {
          button.addEventListener(
            'click', function (e) {
              if (this.getAttribute('href') === '#contato') {
                e.preventDefault()
                handleContact()
              }
            },
          )
        }
      })
    },
  )
})
</script>

<style>
:root {
  --primary-blue: #1e3a5f;
  --secondary-blue: #2d4a6b;
  --accent-yellow: #f59e0b;
  --light-gray: #f8fafc;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  /* font-family:
    -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; */
  line-height: 1.6;
  color: #333;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.header {
  background: var(--primary-blue);
  padding: 1rem 0;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1000;
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  height: 40px;
  filter: brightness(0) invert(1);
}

.nav-menu {
  display: flex;
  list-style: none;
  gap: 2rem;
}

.nav-menu a {
  color: white;
  text-decoration: none;
  font-size: 0.9rem;
  transition: color 0.3s;
}

.nav-menu a:hover {
  color: var(--accent-yellow);
}

.hero {
  background: linear-gradient(
    135deg,
    var(--primary-blue) 0%,
    var(--secondary-blue) 100%
  );
  color: white;
  text-align: center;
  padding: 120px 0 80px;
  margin-top: 60px;
}

.hero-icon {
  width: 80px;
  height: 80px;
  margin: 0 auto 2rem;
  background: var(--accent-yellow);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2rem;
  font-weight: bold;
}

.hero h1 {
  font-size: 2.5rem;
  font-weight: 300;
  margin-bottom: 2rem;
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}

.btn-primary {
  background: var(--accent-yellow);
  color: var(--primary-blue);
  padding: 12px 30px;
  border: none;
  border-radius: 25px;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s;
  text-decoration: none;
  display: inline-block;
}

.btn-primary:hover {
  background: #d97706;
  transform: translateY(-2px);
}

.features {
  padding: 80px 0;
  background: white;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 3rem;
}

.feature-card {
  text-align: center;
  padding: 2rem;
}

.feature-icon {
  width: 60px;
  height: 60px;
  margin: 0 auto 1.5rem;
  background: var(--primary-blue);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 1.5rem;
}

.modules {
  background: var(--primary-blue);
  color: white;
  padding: 80px 0;
}

.section-title {
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 3rem;
  font-weight: 300;
}

.modules-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
  gap: 2rem;
}

.module-card {
  background: var(--accent-yellow);
  color: var(--primary-blue);
  padding: 2rem;
  border-radius: 10px;
  position: relative;
}

.module-card h3 {
  font-size: 1.3rem;
  margin-bottom: 1rem;
  font-weight: bold;
}

.module-card::after {
  content: "";
  position: absolute;
  right: 20px;
  top: 20px;
  width: 40px;
  height: 40px;
  background: var(--primary-blue);
  border-radius: 50%;
  opacity: 0.1;
}

.case-section {
  padding: 80px 0;
  background: white;
}

.case-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: center;
}

.case-content h2 {
  color: var(--primary-blue);
  font-size: 2rem;
  margin-bottom: 1.5rem;
}

.video-wrapper {
  position: relative;
  padding-bottom: 56.25%;
  height: 0;
  overflow: hidden;
  border-radius: 10px;
}

.video-wrapper iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.powered-by {
  background: var(--primary-blue);
  color: white;
  padding: 80px 0;
}

.powered-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: center;
}

.fgv-logo {
  height: 60px;
  margin-bottom: 2rem;
  filter: brightness(0) invert(1);
}

.map-container {
  text-align: center;
}

.map-image {
  width: 100%;
  max-width: 400px;
  border-radius: 10px;
}

.guideline {
  background: white;
  padding: 80px 0;
}

.guideline-grid {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 4rem;
  align-items: center;
}

.btn-secondary {
  background: var(--primary-blue);
  color: white;
  padding: 15px 40px;
  border: none;
  border-radius: 25px;
  font-weight: bold;
  cursor: pointer;
  font-size: 1.2rem;
  transition: all 0.3s;
}

.btn-secondary:hover {
  background: var(--secondary-blue);
  transform: translateY(-2px);
}

.footer {
  background: var(--primary-blue);
  color: white;
  padding: 40px 0 20px;
}

.footer-content {
  display: grid;
  grid-template-columns: 1fr 2fr 1fr;
  gap: 2rem;
  align-items: center;
  margin-bottom: 2rem;
}

.footer-logos {
  display: flex;
  gap: 2rem;
}

.footer-logo {
  height: 40px;
  filter: brightness(0) invert(1);
}

.footer-links {
  display: flex;
  justify-content: center;
  gap: 2rem;
  flex-wrap: wrap;
}

.footer-links a {
  color: white;
  text-decoration: none;
  font-size: 0.9rem;
  transition: color 0.3s;
}

.footer-links a:hover {
  color: var(--accent-yellow);
}

.footer-copyright {
  text-align: center;
  padding-top: 2rem;
  border-top: 1px solid rgb(255 255 255 / 10%);
  opacity: 0.7;
}

.mobile-menu-btn {
  display: none;
  background: none;
  border: none;
  color: white;
  font-size: 1.5rem;
  cursor: pointer;
}

@media (width <= 768px) {
  .nav-menu {
    display: none;
  }

  .mobile-menu-btn {
    display: block;
  }

  .hero h1 {
    font-size: 2rem;
  }

  .case-grid,
  .powered-grid,
  .guideline-grid {
    grid-template-columns: 1fr;
    gap: 2rem;
  }

  .modules-grid,
  .features-grid {
    grid-template-columns: 1fr;
  }

  .footer-content {
    grid-template-columns: 1fr;
    text-align: center;
    gap: 1.5rem;
  }

  .footer-links {
    justify-content: center;
  }
}

.fade-in {
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.6s ease;
}

.fade-in.visible {
  opacity: 1;
  transform: translateY(0);
}
</style>
