defmodule GloiresWorld.ContactForm do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key false

  embedded_schema do
    field :name, :string
    field :email, :string
    field :phone, :string
    field :message, :string
  end

  def changeset(contact_form, attrs) do
    contact_form
    |> cast(attrs, [:name, :email, :phone, :message])
    |> validate_required([:name, :email, :message, :phone])
    |> validate_length(:name, min: 2)
    |> validate_length(:message, min: 20)
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+\.[^\s]+$/)
    |> validate_nigerian_phone_no()
  end

  defp validate_nigerian_phone_no(changeset) do
    validate_change(changeset, :phone, fn :phone, phone ->
      cleaned =
        phone
        |> String.replace(~r/\s+/, "")

      cond do
        cleaned == "" ->
          []

        Regex.match?(~r/^(0|\+234)[789][01]\d{8}$/, cleaned) ->
          []

        true ->
          [
            phone: "Enter a valid Nigerian phone number beginning with 0"
          ]
      end
    end)
  end
end
