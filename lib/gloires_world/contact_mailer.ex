defmodule GloiresWorld.ContactMailer do
  import Swoosh.Email

  def enquiry(name, email, phone, message) do
    new()
    |> to({"Gloire's Stitches", "ucheglory55@gmail.com"})
    |> from({"G'loire Stitches", "ucheglory55@gmail.com"})
    |> reply_to({name, email})
    |> subject("New enquiry from #{name}")
    |> html_body("""
    <h2>New Contact Request</h2>

    <p><strong>Name:</strong> #{name}</p>
    <p><strong>Email:</strong> #{email}</p>
    <p><strong>Phone:</strong> #{phone}</p>

    <hr>

    <p>#{message}</p>
    """)
  end
end
