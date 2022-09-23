defmodule OneRepairWeb.JobControllerTest do
  use OneRepairWeb.ConnCase

  import OneRepair.JobCardFixtures

  @create_attrs %{comment: "some comment", contact: 42, estimate: 42, fault: "some fault", imei: 42, name: "some name", technician: "some technician", total: 42, type: "some type"}
  @update_attrs %{comment: "some updated comment", contact: 43, estimate: 43, fault: "some updated fault", imei: 43, name: "some updated name", technician: "some updated technician", total: 43, type: "some updated type"}
  @invalid_attrs %{comment: nil, contact: nil, estimate: nil, fault: nil, imei: nil, name: nil, technician: nil, total: nil, type: nil}

  describe "index" do
    test "lists all jobs", %{conn: conn} do
      conn = get(conn, Routes.job_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Jobs"
    end
  end

  describe "new job" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.job_path(conn, :new))
      assert html_response(conn, 200) =~ "New Job"
    end
  end

  describe "create job" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.job_path(conn, :create), job: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.job_path(conn, :show, id)

      conn = get(conn, Routes.job_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Job"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.job_path(conn, :create), job: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Job"
    end
  end

  describe "edit job" do
    setup [:create_job]

    test "renders form for editing chosen job", %{conn: conn, job: job} do
      conn = get(conn, Routes.job_path(conn, :edit, job))
      assert html_response(conn, 200) =~ "Edit Job"
    end
  end

  describe "update job" do
    setup [:create_job]

    test "redirects when data is valid", %{conn: conn, job: job} do
      conn = put(conn, Routes.job_path(conn, :update, job), job: @update_attrs)
      assert redirected_to(conn) == Routes.job_path(conn, :show, job)

      conn = get(conn, Routes.job_path(conn, :show, job))
      assert html_response(conn, 200) =~ "some updated comment"
    end

    test "renders errors when data is invalid", %{conn: conn, job: job} do
      conn = put(conn, Routes.job_path(conn, :update, job), job: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Job"
    end
  end

  describe "delete job" do
    setup [:create_job]

    test "deletes chosen job", %{conn: conn, job: job} do
      conn = delete(conn, Routes.job_path(conn, :delete, job))
      assert redirected_to(conn) == Routes.job_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.job_path(conn, :show, job))
      end
    end
  end

  defp create_job(_) do
    job = job_fixture()
    %{job: job}
  end
end
