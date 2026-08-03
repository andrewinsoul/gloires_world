defmodule GloiresWorldWeb.ContactController do
  use GloiresWorldWeb, :controller

  alias GloiresWorld.ContactForm

  def create(conn, %{"contact_form" => params}) do
    IO.inspect(params, label: "CONTACT FORM")

    changeset =
      ContactForm.changeset(%ContactForm{}, params)

    IO.inspect(changeset.errors, label: "ERRORS")
    IO.inspect(changeset.valid?, label: "VALID?")

    text(conn, "Reached controller")
  end
end
