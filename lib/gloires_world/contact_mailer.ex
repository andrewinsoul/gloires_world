defmodule GloiresWorld.ContactMailer do
  import Swoosh.Email

  def enquiry(name, email, phone, message) do
    new()
    |> to({"Gloire's World", "hello@gloiresworld.com"})
    |> from({"Website", "noreply@gloiresworld.com"})
    |> reply_to({name, email})
    |> subject("New enquiry from #{name}")
    |> text_body("""
    Name: #{name}

    Email: #{email}

    Phone: #{phone}

    Message:

    #{message}
    """)
  end
end
