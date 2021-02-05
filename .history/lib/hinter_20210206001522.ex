defmodule Counter do
  @behaviour Ratatouille.App

  import Ratatouille.View

  @tabs %{0 => :add, 1 => :rmv}

  def init(_context) do
    %{tab: 0}
  end

  def update(model, msg) do
    case msg do
      {:event, %{ch: ?1}} -> %{model | tab: 0}
      {:event, %{ch: ?2}} -> %{model | tab: 1} 
      _ -> model
    end
  end

  def render(model) do
    view do
      row do
        column(size: 10) do
          menu_item("Add", @tabs[model.tab] == :add)
          menu_item("Remove", @tabs[model.tab] == :rmv)
        end
      end
      row do
        column(size: 10) do
          label(content: "#{model.tab}")
        end
      end
    end
  end

  def menu_item(label, is_active) do
    label(
      content: label,
      color: get_menu_color(is_active), 
      background: get_bg_color(is_active)
    )
  end

  def get_menu_color(is_active) do
    if is_active, do: :black, else: :white
  end
  def get_bg_color(is_active) do
    if is_active, do: :white, else: :black
  end
end

Ratatouille.run(Counter)



