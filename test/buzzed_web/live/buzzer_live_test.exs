defmodule BuzzedWeb.BuzzerLiveTest do
  use BuzzedWeb.ConnCase

  import Phoenix.LiveViewTest
  import Buzzed.GamesFixtures

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  defp create_buzzer(_) do
    buzzer = buzzer_fixture()
    %{buzzer: buzzer}
  end

  describe "Index" do
    setup [:create_buzzer]

    test "lists all buzzers", %{conn: conn, buzzer: buzzer} do
      {:ok, _index_live, html} = live(conn, Routes.buzzer_index_path(conn, :index))

      assert html =~ "Listing Buzzers"
      assert html =~ buzzer.title
    end

    test "saves new buzzer", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.buzzer_index_path(conn, :index))

      assert index_live |> element("a", "New Buzzer") |> render_click() =~
               "New Buzzer"

      assert_patch(index_live, Routes.buzzer_index_path(conn, :new))

      assert index_live
             |> form("#buzzer-form", buzzer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#buzzer-form", buzzer: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.buzzer_index_path(conn, :index))

      assert html =~ "Buzzer created successfully"
      assert html =~ "some title"
    end

    test "updates buzzer in listing", %{conn: conn, buzzer: buzzer} do
      {:ok, index_live, _html} = live(conn, Routes.buzzer_index_path(conn, :index))

      assert index_live |> element("#buzzer-#{buzzer.id} a", "Edit") |> render_click() =~
               "Edit Buzzer"

      assert_patch(index_live, Routes.buzzer_index_path(conn, :edit, buzzer))

      assert index_live
             |> form("#buzzer-form", buzzer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#buzzer-form", buzzer: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.buzzer_index_path(conn, :index))

      assert html =~ "Buzzer updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes buzzer in listing", %{conn: conn, buzzer: buzzer} do
      {:ok, index_live, _html} = live(conn, Routes.buzzer_index_path(conn, :index))

      assert index_live |> element("#buzzer-#{buzzer.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#buzzer-#{buzzer.id}")
    end
  end

  describe "Show" do
    setup [:create_buzzer]

    test "displays buzzer", %{conn: conn, buzzer: buzzer} do
      {:ok, _show_live, html} = live(conn, Routes.buzzer_show_path(conn, :show, buzzer))

      assert html =~ "Show Buzzer"
      assert html =~ buzzer.title
    end

    test "updates buzzer within modal", %{conn: conn, buzzer: buzzer} do
      {:ok, show_live, _html} = live(conn, Routes.buzzer_show_path(conn, :show, buzzer))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Buzzer"

      assert_patch(show_live, Routes.buzzer_show_path(conn, :edit, buzzer))

      assert show_live
             |> form("#buzzer-form", buzzer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#buzzer-form", buzzer: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.buzzer_show_path(conn, :show, buzzer))

      assert html =~ "Buzzer updated successfully"
      assert html =~ "some updated title"
    end
  end
end
