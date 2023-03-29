defmodule BlogApp.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlogApp.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: 42,
        image: "some image",
        title: "some title"
      })
      |> BlogApp.Posts.create_post()

    post
  end
end
