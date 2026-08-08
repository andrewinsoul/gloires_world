defmodule GloiresWorldWeb.Landing do
  use GloiresWorldWeb, :html

  attr :mobile_menu_open, :boolean, default: false

  def navbar(assigns) do
    message =
      URI.encode("""
      Hello Gloire's Stitches 👋

      I saw your website and I'd like to book a consultation for a custom outfit.
      """)

    assigns = assign(assigns, :message, message)

    ~H"""
    <header class="fixed inset-x-0 top-0 z-50 border-b border-neutral-200 bg-[#faf7f4]/90 backdrop-blur-md">
      <div class="mx-auto flex h-20 max-w-7xl items-center justify-between px-5 lg:px-8">

    <!-- Logo -->
        <a href="#hero" class="flex items-center gap-3">
          <img
            src={~p"/images/branding/favicon.png"}
            alt="Gloire's Stitches"
            class="h-11 w-11 shrink-0 rounded-full"
          />

          <div class="leading-tight">
            <p class="font-display text-xl font-semibold text-zinc-900 lg:text-2xl">
              Gloire's Stitches
            </p>

            <p class="hidden text-[10px] uppercase tracking-[0.3rem] text-zinc-500 sm:block">
              Fashion House
            </p>
          </div>
        </a>

    <!-- Desktop Navigation -->
        <nav class="hidden items-center gap-10 lg:flex">
          <a href="#hero" class="transition hover:text-[#C97C83]">
            Home
          </a>

          <a href="#portfolio" class="transition hover:text-[#C97C83]">
            Collections
          </a>

          <a href="#about" class="transition hover:text-[#C97C83]">
            About
          </a>

          <a href="#services" class="transition hover:text-[#C97C83]">
            Services
          </a>

          <a href="#contact" class="transition hover:text-[#C97C83]">
            Contact
          </a>
        </nav>

    <!-- Desktop CTA -->
        <a
          href={"https://api.whatsapp.com/send?phone=2347063336186&text=#{@message}"}
          target="_blank"
          rel="noopener noreferrer"
          class="hidden rounded-full border border-zinc-300 bg-white/70 px-8 py-4 backdrop-blur transition hover:bg-white lg:inline-flex"
        >
          Book Appointment
        </a>

    <!-- Mobile Actions -->
        <div class="flex items-center gap-3 lg:hidden">
          <button
            phx-click="toggle-mobile-menu"
            class="group flex h-11 w-11 items-center justify-center rounded-lg transition hover:bg-zinc-100"
            aria-label="Toggle menu"
          >
            <div class="relative h-5 w-6">
              <span class={[
                "absolute left-0 top-0 h-0.5 w-full rounded-full bg-zinc-800 transition-all duration-300 ease-in-out",
                @mobile_menu_open && "translate-y-[9px] rotate-45"
              ]}>
              </span>

              <span class={[
                "absolute left-0 top-[9px] h-0.5 w-full rounded-full bg-zinc-800 transition-all duration-300 ease-in-out",
                @mobile_menu_open && "opacity-0"
              ]}>
              </span>

              <span class={[
                "absolute left-0 top-[18px] h-0.5 w-full rounded-full bg-zinc-800 transition-all duration-300 ease-in-out",
                @mobile_menu_open && "-translate-y-[9px] -rotate-45"
              ]}>
              </span>
            </div>
          </button>
        </div>
      </div>

    <!-- Mobile Menu -->
      <div
        :if={@mobile_menu_open}
        id="mobile-menu"
        phx-mounted={
          JS.transition(
            {"transition-all duration-300 ease-out", "opacity-0 -translate-y-4",
             "opacity-100 translate-y-0"}
          )
        }
        phx-remove={
          JS.transition(
            {"transition-all duration-200 ease-in", "opacity-100 translate-y-0",
             "opacity-0 -translate-y-4"}
          )
        }
        class="border-t bg-white shadow-xl lg:hidden"
      >
        <nav class="flex flex-col py-4">
          <a
            href="#hero"
            class="px-6 py-3 transition duration-200 hover:bg-zinc-50 hover:pl-8 hover:text-[#C97C83]"
          >
            Home
          </a>

          <a
            href="#portfolio"
            class="px-6 py-3 transition duration-200 hover:bg-zinc-50 hover:pl-8 hover:text-[#C97C83]"
          >
            Collections
          </a>

          <a
            href="#about"
            class="px-6 py-3 transition duration-200 hover:bg-zinc-50 hover:pl-8 hover:text-[#C97C83]"
          >
            About
          </a>

          <a
            href="#services"
            class="px-6 py-3 transition duration-200 hover:bg-zinc-50 hover:pl-8 hover:text-[#C97C83]"
          >
            Services
          </a>

          <a
            href="#contact"
            class="px-6 py-3 transition duration-200 hover:bg-zinc-50 hover:pl-8 hover:text-[#C97C83]"
          >
            Contact
          </a>

          <a
            href={"https://api.whatsapp.com/send?phone=2347063336186&text=#{@message}"}
            target="_blank"
            rel="noopener noreferrer"
            class="mx-6 mt-4 rounded-full bg-[#C97C83] px-6 py-3 text-center text-white transition duration-300 hover:-translate-y-0.5 hover:shadow-md"
          >
            Book Appointment
          </a>
        </nav>
      </div>
    </header>
    """
  end

  def hero(assigns) do
    message =
      URI.encode_www_form("""
      Hello Gloire's Stitches 👋

      I saw your website and I'd like to book a consultation for a custom outfit.
      """)

    assigns = assign(assigns, :message, message)

    ~H"""
    <section
      id="hero"
      class="relative min-h-screen overflow-hidden"
    >
      <!-- Background Image -->
      <img
        src={~p"/images/hero/hero.webp"}
        alt=""
        class="absolute inset-0 h-full w-full object-cover object-[70%_55%] lg:object-[70%_0%]"
      />

    <!-- Overlay -->
      <div class="absolute inset-0 bg-gray-200 opacity-45"></div>

    <!-- Content -->
      <div class="relative z-10 mx-auto flex min-h-screen max-w-7xl items-center px-6">
        <div class="max-w-2xl">
          <p class="mb-4 uppercase tracking-[0.45rem] text-sm text-[#C97C83]">
            GLOIRE'S STITCHES
          </p>

          <h1 class="font-display text-6xl font-semibold leading-tight text-zinc-900 lg:text-8xl">
            Designing <br /> Confidence
          </h1>

          <p class="mt-8 max-w-xl text-xl leading-9 text-zinc-700">
            Elegant bespoke fashion crafted for women who appreciate timeless
            style, exceptional tailoring and effortless confidence.
          </p>

          <div class="mt-12 flex flex-wrap gap-5">
            <a
              href="#portfolio"
              class="rounded-full bg-[#C97C83] px-8 py-4 text-white transition hover:scale-105"
            >
              Explore Collection
            </a>

            <a
              href={"https://wa.me/2347063336186?text=#{@message}"}
              target="_blank"
              rel="noopener noreferrer"
              class="rounded-full border border-zinc-300 bg-white/70 px-8 py-4 backdrop-blur transition hover:bg-white"
            >
              Book Appointment
            </a>
          </div>
        </div>
      </div>
    </section>
    """
  end

  def portfolio(assigns) do
    ~H"""
    <section
      id="portfolio"
      class="bg-white py-28"
    >
      <div class="mx-auto max-w-7xl px-6">

    <!-- Heading -->

        <div class="mx-auto max-w-3xl text-center">
          <p class="uppercase tracking-[0.4rem] text-sm text-[#C97C83]">
            Featured Collections
          </p>

          <h2 class="mt-4 font-display text-5xl text-zinc-900">
            Every Piece Tells <br /> A Story
          </h2>

          <p class="mt-8 text-lg leading-8 text-zinc-600">
            From elegant corporate wear to bridal couture and timeless African
            fashion, every design is carefully handcrafted to celebrate confidence,
            beauty and individuality.
          </p>
        </div>

    <!-- Gallery -->

        <div class="mt-20 grid gap-8 md:grid-cols-2 lg:grid-cols-3">
          <!-- Card -->
          <div
            :for={item <- @portfolio_images}
            class="group overflow-hidden rounded-3xl"
          >
            <img
              src={item.image}
              alt={item.title}
              class="h-[520px] w-full object-cover transition duration-700 group-hover:scale-110"
            />

            <div class="mt-6">
              <h3 class="font-display text-2xl">
                {item.title}
              </h3>

              <p class="mt-2 px-1 leading-relaxed text-zinc-600">
                {item.description}
              </p>
            </div>
          </div>
        </div>

    <!-- Button -->

        <div class="mt-20 text-center">
          <a
            href="#contact"
            class="inline-flex rounded-full bg-[#C97C83] px-8 py-4 text-white transition hover:scale-105"
          >
            Request Custom Design
          </a>
        </div>
      </div>
    </section>
    """
  end

  def videos(assigns) do
    ~H"""
    <section
      id="videos"
      class="bg-[#faf7f4] py-28"
    >
      <div class="mx-auto max-w-7xl px-6">
        <div class="mx-auto max-w-3xl text-center">
          <p class="uppercase tracking-[0.4rem] text-sm text-[#C97C83]">
            In Motion
          </p>

          <h2 class="mt-4 font-display text-5xl text-zinc-900">
            Experience Every Design
          </h2>

          <p class="mt-8 text-lg leading-8 text-zinc-600">
            Every stitch comes alive through movement, elegance and confidence.
          </p>
        </div>

        <div class="mt-20 grid gap-8 md:grid-cols-2 lg:grid-cols-3">
          <div
            :for={video <- @videos}
            class="overflow-hidden rounded-3xl shadow-lg"
          >
            <video
              id={"video-#{video.id}"}
              phx-hook="LazyVideo"
              class="aspect-[9/16] w-full object-cover"
              autoplay
              muted
              loop
              playsinline
              controls
              preload="none"
              poster={video.poster}
            >
              <source data-src={video.src} type="video/mp4" />
            </video>
          </div>
        </div>
      </div>
    </section>
    """
  end

  def about(assigns) do
    ~H"""
    <section
      id="about"
      class="bg-[#faf7f4] py-32"
    >
      <div class="mx-auto grid max-w-7xl items-center gap-20 px-6 lg:grid-cols-2">

    <!-- LEFT IMAGE -->

        <div class="relative">
          <img
            src={~p"/images/about/glory.png"}
            alt="Gloire"
            class="w-full rounded-[2rem] object-cover shadow-2xl"
          />

          <div class="absolute -bottom-8 -right-8 rounded-3xl bg-white p-8 shadow-xl">
            <p class="text-sm uppercase tracking-[0.35rem] text-[#C97C83]">
              Experience
            </p>

            <h3 class="mt-2 font-display text-4xl">
              5+
            </h3>

            <p class="text-zinc-600">
              Years of Fashion Excellence
            </p>
          </div>
        </div>

    <!-- RIGHT CONTENT -->

        <div>
          <p class="uppercase tracking-[0.4rem] text-sm text-[#C97C83]">
            Meet The Designer
          </p>

          <h2 class="mt-5 font-display text-5xl leading-tight text-zinc-900">
            Hi, I’m Glory, the creative mind behind G’loire Stitches.
          </h2>

          <p class="mt-8 text-lg leading-8 text-zinc-600">
            I believe great fashion is more than beautiful clothing, it’s about helping every woman feel confident, elegant, and comfortable in what she wears.
          </p>

          <p class="mt-6 text-lg leading-8 text-zinc-600">
            Every piece I create is thoughtfully designed and carefully tailored with attention to detail, quality craftsmanship, and the perfect fit.
          </p>

          <p class="mt-6 text-lg leading-8 text-zinc-600">
            From bespoke outfits to timeless ready-to-wear collections, my goal is to create designs that celebrate your style and leave a lasting impression.

            Thank you for being part of this journey. I can’t wait to create something beautiful for you.
          </p>

          <div class="mt-12 grid grid-cols-2 gap-10">
            <div>
              <h3 class="font-display text-4xl text-[#C97C83]">
                200+
              </h3>

              <p class="mt-2 text-zinc-600">
                Custom Designs
              </p>
            </div>

            <div>
              <h3 class="font-display text-4xl text-[#C97C83]">
                100%
              </h3>

              <p class="mt-2 text-zinc-600">
                Handmade Craftsmanship
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  def services(assigns) do
    ~H"""
    <section
      id="services"
      class="bg-white py-32"
    >
      <div class="mx-auto max-w-7xl px-6">

    <!-- Heading -->

        <div class="mx-auto max-w-3xl text-center">
          <p class="uppercase tracking-[0.4rem] text-sm text-[#C97C83]">
            What We Do
          </p>

          <h2 class="mt-4 font-display text-5xl text-zinc-900">
            Fashion Tailored <br /> Around You
          </h2>

          <p class="mt-8 text-lg leading-8 text-zinc-600">
            Thoughtfully designed for your unique style.
            Tailored to complement your personality and lifestyle.
            Created for every occasion that matters.
          </p>
        </div>

        <div class="mt-20 grid gap-8 md:grid-cols-2 lg:grid-cols-3">
          <!-- Card -->
          <div
            :for={service <- @services}
            class="service-card group"
          >
            <img
              src={service.image}
              alt={service.title}
              class="service-card__image"
            />

            <div class="service-card__overlay">
              <div class="service-card__content">
                <h3 class="font-display text-4xl text-white">
                  {service.title}
                </h3>

                <p class="mt-4 text-lg leading-8 text-white/90">
                  {service.description}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  def testimonials(assigns) do
    ~H"""
    <section
      id="why-us"
      class="bg-[#faf7f4] py-32"
    >
      <div class="mx-auto max-w-7xl px-6">

    <!-- Heading -->

        <div class="mx-auto max-w-3xl text-center">
          <p class="uppercase tracking-[0.4rem] text-sm text-[#C97C83]">
            Why Choose Us
          </p>

          <h2 class="mt-4 font-display text-5xl text-zinc-900">
            Crafted With Passion. <br /> Finished With Excellence.
          </h2>

          <p class="mt-8 text-lg leading-8 text-zinc-600">
            Every outfit is created with attention to detail, premium craftsmanship
            and a commitment to making every client feel confident and elegant.
          </p>
        </div>

    <!-- Features -->

        <div class="mt-20 grid gap-8 md:grid-cols-2 lg:grid-cols-4">
          <div class="rounded-3xl bg-white p-10 shadow-sm">
            <div class="text-4xl">✨</div>

            <h3 class="mt-6 font-display text-2xl">
              Premium Craftsmanship
            </h3>

            <p class="mt-4 leading-8 text-zinc-600">
              Every stitch is carefully finished to deliver exceptional quality.
            </p>
          </div>

          <div class="rounded-3xl bg-white p-10 shadow-sm">
            <div class="text-4xl">📏</div>

            <h3 class="mt-6 font-display text-2xl">
              Perfect Fit
            </h3>

            <p class="mt-4 leading-8 text-zinc-600">
              Designed and tailored to complement your unique body and style.
            </p>
          </div>

          <div class="rounded-3xl bg-white p-10 shadow-sm">
            <div class="text-4xl">🎨</div>

            <h3 class="mt-6 font-display text-2xl">
              Unique Designs
            </h3>

            <p class="mt-4 leading-8 text-zinc-600">
              Modern, elegant and timeless pieces that help you stand out.
            </p>
          </div>

          <div class="rounded-3xl bg-white p-10 shadow-sm">
            <div class="text-4xl">❤️</div>

            <h3 class="mt-6 font-display text-2xl">
              Personal Attention
            </h3>

            <p class="mt-4 leading-8 text-zinc-600">
              Every client receives a personalized experience from consultation to delivery.
            </p>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr :rest, :global

  def contact(assigns) do
    ~H"""
    <section id="contact" class="bg-[#FCF8F6] py-28">
      <div class="mx-auto max-w-7xl px-6 lg:px-8">

    <!-- Heading -->
        <div class="mb-20 text-center">
          <p class="mb-4 text-sm font-semibold uppercase tracking-[0.4em] text-[#C97C83]">
            Contact
          </p>

          <h2 class="font-serif text-4xl text-zinc-900 md:text-5xl">
            Let's Create Something Beautiful
          </h2>

          <p class="mx-auto mt-6 max-w-2xl text-lg leading-8 text-zinc-600">
            Whether it's a bespoke outfit, bridal wear, corporate collection,
            or ready-to-wear piece, we'd love to hear from you.
          </p>
        </div>

    <!-- Two Columns -->
        <div class="grid gap-16 lg:grid-cols-2">

    <!-- LEFT -->
          <div class="space-y-10">
            <div>
              <h3 class="mb-2 font-serif text-2xl text-zinc-900">
                Visit Our Studio
              </h3>

              <p class="leading-8 text-zinc-600">
                G'loire Stitches Fashion House<br /> Port Harcourt, Nigeria
              </p>
            </div>

            <div>
              <h3 class="mb-2 font-serif text-2xl text-zinc-900">
                Phone
              </h3>

              <a
                href="tel:+2347063336186"
                class="text-lg text-[#C97C83] hover:underline"
              >
                +234 706 333 6186
              </a>
            </div>

            <div>
              <h3 class="mb-2 font-serif text-2xl text-zinc-900">
                Email
              </h3>

              <a
                href="mailto:ucheglory55@gmail.com"
                class="text-lg text-[#C97C83] hover:underline"
              >
                ucheglory55@gmail.com
              </a>
            </div>

            <div>
              <h3 class="mb-2 font-serif text-2xl text-zinc-900">
                Working Hours
              </h3>

              <p class="leading-8 text-zinc-600">
                Monday – Friday<br /> 9:00 AM – 6:00 PM
              </p>
            </div>
          </div>

    <!-- RIGHT -->
          <div class="rounded-[32px] bg-white p-10 shadow-xl shadow-black/5">
            <.live_component
              module={GloiresWorldWeb.ContactComponent}
              id="contact-form"
            />
          </div>
        </div>
      </div>
    </section>
    """
  end

  def footer(assigns) do
    ~H"""
    <footer class="bg-zinc-950 text-zinc-300">
      <div class="mx-auto max-w-7xl px-6 py-20">
        <div class="grid gap-16 lg:grid-cols-4">

    <!-- Brand -->

          <div class="lg:col-span-2">
            <div class="flex items-center gap-4">
              <img
                src={~p"/images/branding/favicon.png"}
                alt="G'loire Stitches"
                class="h-12 w-12 rounded-full"
              />

              <div>
                <h2 class="font-display text-3xl text-white">
                  G'loire Stitches
                </h2>

                <p class="text-sm uppercase tracking-[0.35rem] text-zinc-500">
                  Fashion House
                </p>
              </div>
            </div>

            <p class="mt-8 max-w-lg leading-8 text-zinc-400">
              G'loire Stitches creates elegant bespoke fashion that celebrates
              confidence, individuality and timeless beauty. Every outfit is
              thoughtfully designed to make you feel your absolute best.
            </p>
          </div>

    <!-- Quick Links -->

          <div>
            <h3 class="mb-6 font-display text-2xl text-white">
              Explore
            </h3>

            <ul class="space-y-4">
              <li>
                <a href="#hero" class="hover:text-[#C97C83] transition">
                  Home
                </a>
              </li>

              <li>
                <a href="#portfolio" class="hover:text-[#C97C83] transition">
                  Portfolio
                </a>
              </li>

              <li>
                <a href="#about" class="hover:text-[#C97C83] transition">
                  About
                </a>
              </li>

              <li>
                <a href="#services" class="hover:text-[#C97C83] transition">
                  Services
                </a>
              </li>

              <li>
                <a href="#contact" class="hover:text-[#C97C83] transition">
                  Contact
                </a>
              </li>
            </ul>
          </div>

    <!-- Contact -->

          <div>
            <h3 class="mb-6 font-display text-2xl text-white">
              Contact
            </h3>

            <ul class="space-y-4">
              <li>Port Harcourt, Nigeria</li>

              <li>+234 706 333 6186</li>

              <li>ucheglory55@gmail.com</li>

              <li>Mon - Sat • 9AM - 6PM</li>
            </ul>
          </div>
        </div>

    <!-- Divider -->

        <div class="my-12 h-px bg-zinc-800"></div>

    <!-- Bottom -->

        <div class="flex flex-col items-center justify-between gap-6 lg:flex-row">
          <p class="text-sm text-zinc-500">
            © {Date.utc_today().year} G'loire Stitches. All rights reserved.
          </p>

          <div class="flex gap-8">
            <a
              href="#"
              class="hover:text-[#C97C83] transition"
            >
              Instagram
            </a>

            <a
              href="#"
              class="hover:text-[#C97C83] transition"
            >
              Facebook
            </a>

            <a
              href="#"
              class="hover:text-[#C97C83] transition"
            >
              TikTok
            </a>

            <a
              href="#"
              class="hover:text-[#C97C83] transition"
            >
              WhatsApp
            </a>
          </div>
        </div>
      </div>
    </footer>
    """
  end
end
