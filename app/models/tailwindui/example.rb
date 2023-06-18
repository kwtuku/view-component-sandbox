module Tailwindui
  class Example
    def self.names
      Dir.glob("*", base: Rails.root.join("app/views/tailwindui")).map { |filename| filename.delete_suffix(".html") }
    end
  end
end
