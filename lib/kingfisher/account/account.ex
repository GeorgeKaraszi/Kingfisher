defmodule Kingfisher.Account do
  alias Kingfisher.Account.User
  alias Kingfisher.Repo



  def new_user(params) do
    %User{} |> User.changeset(params) |> Repo.insert
  end

  def update_or_insert_user(%{email: email} = user_params) do
    case User.find_by(email: email) do
        nil ->
            new_user(user_params)
        user ->
            {:ok, user}
    end
  end
end
