defmodule OneRepair.JobCard.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :comment, :string
    field :contact, :integer
    field :estimate, :integer
    field :fault, :string
    field :imei, :integer
    field :name, :string
    field :technician, :string
    field :total, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:name, :contact, :type, :imei, :fault, :estimate, :total, :comment, :technician])
    |> validate_required([:name, :contact, :type, :imei, :fault, :estimate, :total, :comment, :technician])
  end
end
