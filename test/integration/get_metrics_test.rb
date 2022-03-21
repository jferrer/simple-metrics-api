# frozen_string_literal: true

require "test_helper"

class GetMetricstest < ActionDispatch::IntegrationTest
  def setup
    Rails.application.load_seed
  end

  test "filter by day" do
    get metrics_path, params: { day: Date.today }
    assert_response :ok

    jdata = JSON.parse(response.body)
    refute jdata["data"].empty?
  end

  test "filter by hour" do
    get metrics_path, params: { hour: Date.today }
    assert_response :ok

    jdata = JSON.parse(response.body)
    refute jdata["data"].empty?
  end

  test "filter by week current_week" do
    get metrics_path, params: { week: Date.today }
    assert_response :ok

    jdata = JSON.parse(response.body)
    refute jdata["data"].empty?
  end

  test "filter by invalid param" do
    get metrics_path, params: { month: Date.today }
    assert_response :unprocessable_entity

    jdata = JSON.parse(response.body)
    assert_equal "Invalid parameter", jdata["message"]
    assert jdata["errors"].any?
  end
end
