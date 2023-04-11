defmodule BlogAppWeb.PostLive.Show do
  use BlogAppWeb, :live_view

  alias BlogApp.Posts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    post = Posts.get_post!(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, post)
     |> assign(:post_image_url, get_post_image_url(post))}
  end

  defp page_title(:show), do: "Show Post"
  defp page_title(:edit), do: "Edit Post"

  defp get_post_image_url(post),
    do: BlogApp.Uploaders.ImageUploader.url({post.image, post})
end
