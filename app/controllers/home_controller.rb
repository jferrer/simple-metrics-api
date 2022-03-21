# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render json: { app: "Simple Metrics", status: "ok" }
  end
end
