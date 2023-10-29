require "tailwind_sorter"

namespace :tailwind_sorter do
  desc "ビューテンプレートファイルの Tailwind CSS のクラスをソートする"
  task run_all: :environment do
    Dir.glob(["app/{components,views}/**/*.erb"]) do |file|
      TailwindSorter::Sorter.run(file)
    end
  end
end
