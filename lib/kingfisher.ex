defmodule Kingfisher do
  @moduledoc """
  Kingfisher keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def model do
    quote do
      use Ecto.Schema
      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      alias Kingfisher.{Account.User}
    end
  end

    def commands do
    quote do
      use Ecto.Schema
      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      alias Kingfisher.{Repo, Account.User}
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
