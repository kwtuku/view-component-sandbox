ActiveRecord::Base.logger = Logger.new($stdout)

AncestryItem.destroy_all
NestedSetItem.destroy_all

# - n1
#   - n11
#     - n111
#       - n1111
#       - n1112
#     - n112
#       - n1121
#   - n12
#     - n121
#     - n122
#   - n13
#     - n131
# - n2
#   - n21
#     - n211
#     - n212
#   - n22
#     - n221
#   - n23
# - n3
#   - n31
#     - n311
#   - n32
#   - n33
# - n4
#   - n41
#     - n411
#   - n42
# - n5
#   - n51
#   - n52
AncestryItem.create!(my_string: "n1").tap do |n1|
  n1.children.create!(my_string: "n11").tap do |n11|
    n11.children.create!(my_string: "n111").tap do |n111|
      n111.children.create!(my_string: "n1111")
      n111.children.create!(my_string: "n1112")
    end
    n11.children.create!(my_string: "n112").tap do |n112|
      n112.children.create!(my_string: "n1121")
    end
  end
  n1.children.create!(my_string: "n12").tap do |n12|
    n12.children.create!(my_string: "n121")
    n12.children.create!(my_string: "n122")
  end
  n1.children.create!(my_string: "n13").tap do |n13|
    n13.children.create!(my_string: "n131")
  end
end
AncestryItem.create!(my_string: "n2").tap do |n2|
  n2.children.create!(my_string: "n21").tap do |n21|
    n21.children.create!(my_string: "n211")
    n21.children.create!(my_string: "n212")
  end
  n2.children.create!(my_string: "n22").tap do |n22|
    n22.children.create!(my_string: "n221")
  end
  n2.children.create!(my_string: "n23")
end
AncestryItem.create!(my_string: "n3").tap do |n3|
  n3.children.create!(my_string: "n31").tap do |n31|
    n31.children.create!(my_string: "n311")
  end
  n3.children.create!(my_string: "n32")
  n3.children.create!(my_string: "n33")
end
AncestryItem.create!(my_string: "n4").tap do |n4|
  n4.children.create!(my_string: "n41").tap do |n41|
    n41.children.create!(my_string: "n411")
  end
  n4.children.create!(my_string: "n42")
end
AncestryItem.create!(my_string: "n5").tap do |n5|
  n5.children.create!(my_string: "n51")
  n5.children.create!(my_string: "n52")
end

NestedSetItem.create!(my_string: "n1").tap do |n1|
  n1.children.create!(my_string: "n11").tap do |n11|
    n11.children.create!(my_string: "n111").tap do |n111|
      n111.children.create!(my_string: "n1111")
      n111.children.create!(my_string: "n1112")
    end
    n11.children.create!(my_string: "n112").tap do |n112|
      n112.children.create!(my_string: "n1121")
    end
  end
  n1.children.create!(my_string: "n12").tap do |n12|
    n12.children.create!(my_string: "n121")
    n12.children.create!(my_string: "n122")
  end
  n1.children.create!(my_string: "n13").tap do |n13|
    n13.children.create!(my_string: "n131")
  end
end
NestedSetItem.create!(my_string: "n2").tap do |n2|
  n2.children.create!(my_string: "n21").tap do |n21|
    n21.children.create!(my_string: "n211")
    n21.children.create!(my_string: "n212")
  end
  n2.children.create!(my_string: "n22").tap do |n22|
    n22.children.create!(my_string: "n221")
  end
  n2.children.create!(my_string: "n23")
end
NestedSetItem.create!(my_string: "n3").tap do |n3|
  n3.children.create!(my_string: "n31").tap do |n31|
    n31.children.create!(my_string: "n311")
  end
  n3.children.create!(my_string: "n32")
  n3.children.create!(my_string: "n33")
end
NestedSetItem.create!(my_string: "n4").tap do |n4|
  n4.children.create!(my_string: "n41").tap do |n41|
    n41.children.create!(my_string: "n411")
  end
  n4.children.create!(my_string: "n42")
end
NestedSetItem.create!(my_string: "n5").tap do |n5|
  n5.children.create!(my_string: "n51")
  n5.children.create!(my_string: "n52")
end
