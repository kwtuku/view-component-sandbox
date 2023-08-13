class TailwinduiController < ApplicationController
  layout "tailwindui"

  Tailwindui::Example.names.each do |name|
    define_method(name) do
      # アクションを定義するだけ
    end
  end
end
