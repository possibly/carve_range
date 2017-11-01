require "test_helper"

class CarveRangeTest < Minitest::Test
	
	def setup
		@old_date_range = Date.today..Date.today+7
	end

  def test_that_it_has_a_version_number
    refute_nil ::CarveRange::VERSION
  end

  def test_new_date_overlaps_only_start_of_old_date
  	# Scenario: +__|==+---|
    new_date_range = Date.today-7..Date.today+3
    expected_old_date_range = Date.today+4..Date.today+7
    expected_new_date_range = new_date_range
    result = ::CarveRange.carve(@old_date_range, new_date_range)
    assert expected_old_date_range == result.first
    assert new_date_range == result[1]
  end

  def test_new_date_overlaps_only_end_of_old_date
  	# Scenario: |--+==|__+
    new_date_range = Date.today+3..Date.today+10
    expected_old_date_range = Date.today..Date.today+2
    result = ::CarveRange.carve(@old_date_range, new_date_range)
    assert expected_old_date_range == result.first
    assert new_date_range == result[1]
  end

  def test_new_date_overlaps_only_middle_of_old_date
  	# Scenario: |-+=+-|
    new_date_range = Date.today+1..Date.today+4
    expected_pre_date_range = Date.today..Date.today
    expected_post_date_range = Date.today+5..@old_date_range.last
    result = ::CarveRange.carve(@old_date_range, new_date_range)
    assert_equal expected_pre_date_range, result.first
    assert_equal expected_post_date_range, result[1]
		assert_equal new_date_range, result[2]
  end

  def test_new_date_overlaps_entirety_of_old_date
  	# Scenario: +=|=====|=+
  	new_date_range = Date.today-1..Date.today+8
    expected_old_date_range = nil
    result = ::CarveRange.carve(@old_date_range, new_date_range)
    assert expected_old_date_range == result.first
    assert new_date_range == result[1]
  end

  def test_new_date_and_old_date_dont_overlap
  	# Scenario: +==+ |--|
  	new_date_range = Date.today-5..Date.today-3
  	result = ::CarveRange.carve(@old_date_range, new_date_range)
    assert @old_date_range == result.first
    assert new_date_range == result[1]
  end
end
