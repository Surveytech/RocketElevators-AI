class Quote < ApplicationRecord
  belongs_to :user

  TYPE_LIST = [["Select Building Type"," "],["Residential","residential"], ["Commercial","commercial"], ["Corporate","corporate"], ["Hybrid","hybrid"]]
  product_line = [["Standard", "standard"],["Premium","preMIum"],["Excelium", "excelium"]]
end
