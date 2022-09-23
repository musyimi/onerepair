defmodule OneRepair.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string
      add :contact, :integer
      add :type, :string
      add :imei, :integer
      add :fault, :string
      add :estimate, :integer
      add :total, :integer
      add :comment, :string
      add :technician, :string

      timestamps()
    end
  end
end
