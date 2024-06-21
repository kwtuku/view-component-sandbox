# https://api.rubyonrails.org/v7.0.8/classes/ActionView/Helpers/FormBuilder.html
# https://qiita.com/takeyuweb/items/f9990500a1e9d5731c04
module FormBuilders
  class MyFormBuilder < ActionView::Helpers::FormBuilder
    def date_field(method, options = {})
      # 呼び出す時に`min: nil`で無効にできる
      @template.date_field(@object_name, method, objectify_options(options).with_defaults(min: "1900-01-01", max: "2100-01-01"))
    end
  end
end
