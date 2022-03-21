# frozen_string_literal: true

class MetricsController < ApplicationController
  before_action :filter_valid_params?, only: :index

  def index
    metrics = Metric.filter(sanitized_params)

    render json: {
      data: metrics,
      avg: calculate_average(metrics)
    }, status: :ok
  end

  def create
    metric = Metric.create(metric_params)

    if metric.valid?
      render json: {
        name: metric.name, value: metric.value, created_at: metric.created_at
      }, status: :created
    else
      render json: {
        message: "Validation Failed", errors: metric.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

    def calculate_average(metrics)
      metrics.to_h.values.sum / metrics.size
    end

    def filter_valid_params?
      return true if sanitized_params.present?

      render json: {
        message: "Invalid parameter", errors: ["Check docs for valid parameters"]
      }, status: :unprocessable_entity
    end

    def metric_params
      params.permit(:name, :value, :created_at)
    end

    def sanitized_params
      params.slice(:day, :hour, :week)
    end
end
