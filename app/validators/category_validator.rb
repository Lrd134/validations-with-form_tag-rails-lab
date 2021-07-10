class CategoryValidator < ActiveModel::Validator
  VALID_WORDS = ["Fiction", "Non-Fiction"]
  def validate(record)
    valid = false
    split_category = record.category.split(" ")

    if record
      VALID_WORDS.each do | word |
        if record.category.match?(word) && split_category.size == 1
          valid = true
        end
      end

      if !valid
        record.errors[:category] << "must be Fiction or Non-Fiction"
      end
    end
  end
end