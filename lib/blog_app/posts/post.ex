defmodule BlogApp.Posts.Post do
  use Ecto.Schema
  use Waffle.Ecto.Schema

  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :image, BlogApp.Uploaders.ImageUploader.Type

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> cast_attachments(attrs, [:image], allow_paths: true)
    |> validate_required([:title, :body])
  end
end
