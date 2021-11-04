defmodule TimeManagerAPI.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :username, :string, null: false
      add :encrypted_password, :string
      add :email, :string, null: false
      add :role, :string
      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
