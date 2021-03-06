defmodule Kingfisher.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :display_name, :string
      add :email, :string
      add :token, :string
      add :provider, :string

      timestamps()
    end

  end
end
