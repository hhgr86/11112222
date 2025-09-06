require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  test "valid service" do
    service = Service.new(name: "Test", description: "Desc")
    assert service.valid?
  end

  test "invalid without name" do
    service = Service.new(description: "Desc")
    assert_not service.valid?
  end
end
