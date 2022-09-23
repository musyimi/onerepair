defmodule OneRepair.JobCardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OneRepair.JobCard` context.
  """

  @doc """
  Generate a job.
  """
  def job_fixture(attrs \\ %{}) do
    {:ok, job} =
      attrs
      |> Enum.into(%{
        comment: "some comment",
        contact: 42,
        estimate: 42,
        fault: "some fault",
        imei: 42,
        name: "some name",
        technician: "some technician",
        total: 42,
        type: "some type"
      })
      |> OneRepair.JobCard.create_job()

    job
  end
end
