defmodule GloiresWorldWeb.HomeLive do
  use GloiresWorldWeb, :live_view

  alias GloiresWorldWeb.Landing

  @impl true
  def mount(_params, _session, socket) do
    portfolio_images = [
      %{
        title: "Corporate Elegance",
        description: "Sophisticated tailoring designed for confident women.",
        image: ~p"/images/gallery/aturuchi.jpg"
      },
      %{
        title: "African Prints",
        description:
          "A beautifully tailored maxi dress featuring a vibrant African print and a flowing gathered skirt.",
        image: ~p"/images/gallery/customer-1.jpg"
      },
      %{
        title: "Evening Couture",
        description:
          "An elegant floor-length bodycon gown featuring handcrafted bead embellishments and a high halter neckline.",
        image: ~p"/images/gallery/ceo.jpg"
      }
    ]

    videos = [
      %{id: "favor", poster: ~p"/favor.webp", src: ~p"/videos/favor.mp4"},
      %{id: "aminat", poster: ~p"/aminat.webp", src: ~p"/videos/aminat.mp4"},
      %{id: "flower-1", poster: ~p"/flower.webp", src: ~p"/videos/flower-1.mp4"},
      %{id: "glory-1", poster: ~p"/glory-1.webp", src: ~p"/videos/glory-1.mp4"},
      %{id: "glory-2", poster: ~p"/glory-2.webp", src: ~p"/videos/glory-2.mp4"},
      %{id: "glory-3", poster: ~p"/glory-3.webp", src: ~p"/videos/glory-3.mp4"}
    ]

    services = [
      %{
        image: ~p"/images/gallery/glory.jpg",
        title: "Corporate Wear",
        description: "Designed to flatter, made to inspire confidence"
      },
      %{
        image: ~p"/images/gallery/aminat.jpg",
        title: "Bespoke Fashion",
        description: "Elegance rooted in culture and crafted with care."
      },
      %{
        image: ~p"/images/gallery/wedding-gown.jpg",
        title: "Bridal Couture",
        description: "Every bride deserves a dress as unforgettable as her story"
      },
      %{
        image: ~p"/images/gallery/aminat-bubu-gown.jpg",
        title: "Bubu Gown",
        description: "Grace, beautifully draped in every detail."
      },
      %{
        image: ~p"/images/gallery/customer-2.jpg",
        title: "African Fashion",
        description: "Rock your culture with confidence"
      },
      %{
        image: ~p"/images/gallery/glory-special-occasion.jpg",
        title: "Special Occasion",
        description: "Classic style with a modern touch."
      },
      %{
        image: ~p"/images/gallery/glory-street.jpg",
        title: "Street Wear",
        description: "Casual hoodies and shorts crafted for a bold, relaxed look."
      },
      %{
        image: ~p"/images/gallery/aminat-dinner.jpg",
        title: "Dinner Gown",
        description: "Elegant dinner gowns tailored to make every entrance unforgettable."
      },
      %{
        title: "African Prints",
        description: "Contemporary African fashion with timeless craftsmanship.",
        image: ~p"/images/gallery/african_print.webp"
      },
    ]

    {:ok,
     assign(
       socket,
       mobile_menu_open: false,
       portfolio_images: portfolio_images,
       videos: videos,
       services: services
     )}
  end

  @impl true
  def handle_event("toggle-mobile-menu", _, socket) do
    {:noreply, update(socket, :mobile_menu_open, &(!&1))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Landing.navbar mobile_menu_open={@mobile_menu_open} />

    <main>
      <Landing.hero />
      <Landing.portfolio portfolio_images={@portfolio_images} />
      <Landing.videos videos={@videos} />
      <Landing.about />
      <Landing.services services={@services} />
      <Landing.testimonials />
      <Landing.contact />
      <Landing.footer />
    </main>
    """
  end
end
