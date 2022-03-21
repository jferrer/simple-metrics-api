# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: ENV.fetch("VHOST")

  scope :api do
    root to: "home#index"
    resources :metrics, only: %i[index create]
  end
end
