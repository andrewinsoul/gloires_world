defmodule GloiresWorldWeb.ContactComponent do
  use GloiresWorldWeb, :live_component

  alias GloiresWorld.ContactForm

  @impl true
  def update(assigns, socket) do
    changeset =
      ContactForm.changeset(%ContactForm{}, %{})

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:form, Phoenix.Component.to_form(changeset))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.form
        for={@form}
        phx-target={@myself}
        phx-change="validate"
        phx-submit="submit"
        class="space-y-6"
      >
        <.input
          field={@form[:name]}
          type="text"
          label="Full Name"
        />

        <.input
          field={@form[:email]}
          type="email"
          label="Email"
        />

        <.input
          field={@form[:phone]}
          type="text"
          label="Phone"
        />

        <.input
          field={@form[:message]}
          type="textarea"
          label="Message"
        />

        <button
          type="submit"
          class="rounded-full bg-[#C97C83] px-8 py-4 text-white"
          phx-disable-with="Sending..."
        >
          Send Message
        </button>
      </.form>
    </div>
    """
  end

  @impl true
  def handle_event("validate", %{"contact_form" => params}, socket) do
    changeset =
      ContactForm.changeset(%ContactForm{}, params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :form, Phoenix.Component.to_form(changeset))}
  end

  @impl true
  def handle_event("submit", %{"contact_form" => params}, socket) do
    changeset =
      ContactForm.changeset(%ContactForm{}, params)
      |> Map.put(:action, :validate)

    if changeset.valid? do
      params = Ecto.Changeset.apply_changes(changeset)

      email =
        GloiresWorld.ContactMailer.enquiry(
          params.name,
          params.email,
          params.phone,
          params.message
        )

      case GloiresWorld.Mailer.deliver(email) do
        {:ok, _response} ->
          {:noreply,
           socket
           |> put_flash(:info, "Thank you! We'll contact you shortly.")
           |> assign(
             :form,
             Phoenix.Component.to_form(ContactForm.changeset(%ContactForm{}, %{}))
           )}

        {:error, _reason} ->
          {:noreply,
           put_flash(
             socket,
             :error,
             "Unable to send message. Please try again."
           )}
      end

      {:noreply, socket}
    else
      {:noreply,
       assign(
         socket,
         :form,
         Phoenix.Component.to_form(changeset)
       )}
    end
  end
end
