defmodule TimeManagerAPI.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :time, :utc_datetime, null: false
      add :status, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:clocks, [:user_id])
  end
end
