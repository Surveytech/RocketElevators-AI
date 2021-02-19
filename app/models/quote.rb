class Quote < ApplicationRecord
  belongs_to :user

  TYPE_LIST = [["Select Building Type"," "],["Residential","residential"], ["Commercial","commercial"], ["Corporate","corporate"], ["Hybrid","hybrid"]]
  PRODUCT = [["Standard", "standard"],["Premium","premium"],["Excelium", "excelium"]]
end
