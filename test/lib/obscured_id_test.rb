require "test_helper"
require_relative "../../lib/obscured_id"

class ObscuredIdTest < ActiveSupport::TestCase
  include ObscuredId

  test "obscures and deobscures" do
    assert_equal 1, deobscure_id(obscure_id(1))
    assert_equal 2, deobscure_id(obscure_id(2))
    refute_equal obscure_id(1), obscure_id(2), "obscure_id(1) vs obscure_id(2)"
    assert_equal 100_000, deobscure_id(obscure_id(100_000))
    assert_equal 100_000_000, deobscure_id(obscure_id(100_000_000))
  end

  test "particular obscured values" do
    assert_equal "FJHM46", obscure_id(1)
    assert_equal 1, deobscure_id("FJHM46")

    assert_equal "W4296A", obscure_id(2)
    assert_equal 2, deobscure_id("W4296A")
  end
end
