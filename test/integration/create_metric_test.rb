# frozen_string_literal: true

require "test_helper"

class CreateMetrictest < ActionDispatch::IntegrationTest
  test "create valid metric" do
    valid_metric = { name: "features", value: 1 }

    post metrics_path, params: valid_metric
    assert_response :created

    jdata = JSON.parse(response.body)

    assert_equal valid_metric[:name], jdata["name"]
    assert_equal valid_metric[:value], jdata["value"]
  end

  test "invalid name" do
    invalid_metric = { name: "none", value: 1 }

    post metrics_path, params: invalid_metric
    assert_response :unprocessable_entity

    jdata = JSON.parse(response.body)

    assert_equal "Validation Failed", jdata["message"]
    assert jdata["errors"].any?
  end

  test "invalid value" do
    invalid_metric = { name: "features", value: 6 }

    post metrics_path, params: invalid_metric
    assert_response :unprocessable_entity

    jdata = JSON.parse(response.body)

    assert_equal "Validation Failed", jdata["message"]
    assert jdata["errors"].any?
  end
end
