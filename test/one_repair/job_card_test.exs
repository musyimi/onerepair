defmodule OneRepair.JobCardTest do
  use OneRepair.DataCase

  alias OneRepair.JobCard

  describe "jobs" do
    alias OneRepair.JobCard.Job

    import OneRepair.JobCardFixtures

    @invalid_attrs %{comment: nil, contact: nil, estimate: nil, fault: nil, imei: nil, name: nil, technician: nil, total: nil, type: nil}

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert JobCard.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert JobCard.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      valid_attrs = %{comment: "some comment", contact: 42, estimate: 42, fault: "some fault", imei: 42, name: "some name", technician: "some technician", total: 42, type: "some type"}

      assert {:ok, %Job{} = job} = JobCard.create_job(valid_attrs)
      assert job.comment == "some comment"
      assert job.contact == 42
      assert job.estimate == 42
      assert job.fault == "some fault"
      assert job.imei == 42
      assert job.name == "some name"
      assert job.technician == "some technician"
      assert job.total == 42
      assert job.type == "some type"
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = JobCard.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      update_attrs = %{comment: "some updated comment", contact: 43, estimate: 43, fault: "some updated fault", imei: 43, name: "some updated name", technician: "some updated technician", total: 43, type: "some updated type"}

      assert {:ok, %Job{} = job} = JobCard.update_job(job, update_attrs)
      assert job.comment == "some updated comment"
      assert job.contact == 43
      assert job.estimate == 43
      assert job.fault == "some updated fault"
      assert job.imei == 43
      assert job.name == "some updated name"
      assert job.technician == "some updated technician"
      assert job.total == 43
      assert job.type == "some updated type"
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = JobCard.update_job(job, @invalid_attrs)
      assert job == JobCard.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = JobCard.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> JobCard.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = JobCard.change_job(job)
    end
  end
end
