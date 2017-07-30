defmodule Kingfisher.Account.User do

  use Kingfisher, :model
  use Kingfisher.Commands.CrudCommands,
      record_type:  User,
      associations: []


  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :display_name, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :display_name, :email, :token, :provider])
    |> validate_required([:first_name, :last_name, :email, :token, :provider])
  end
end
