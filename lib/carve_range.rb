require "carve_range/version"
require "date"

module CarveRange
  def self.carve(old_date_range, new_date_range, space=0)
  	old_start = old_date_range.first
    old_end = old_date_range.last
    new_start = new_date_range.first
    new_end = new_date_range.last

    if new_start <= old_start && new_end < old_end     # +__|==+--|
      modified_date_range = old_date_range.select { |d| d > (new_end + space)? d : false }
      return modified_date_range.first..modified_date_range.last, new_date_range

    elsif new_start > old_start && new_end >= old_end  # |--+==|__+
      modified_date_range = old_date_range.select { |d| d < (new_start - space)? d : false }
      return modified_date_range.first..modified_date_range.last, new_date_range

    elsif new_start > old_start && new_end < old_end   # |-+=+-|
      pre_date_range = old_date_range.select { |d| d < (new_start - space)? d : false }
      post_date_range = old_date_range.select { |d| d > (new_end + space)? d : false }
      return pre_date_range.first..pre_date_range.last, post_date_range.first..post_date_range.last, new_date_range

    elsif new_start <= old_start && new_end >= old_end # +=|=====|=+
      return nil, new_date_range
    end

    return old_date_range, new_date_range
  end
end
