# frozen_string_literal: true

class Metric < ApplicationRecord
  include Filterable

  validates :name, inclusion: %w[features cost support]
  validates :value, inclusion: { in: 1..5 }

  scope :filter_by_day, lambda { |date|
    Metric
      .group("DATE_PART('hour', created_at)")
      .where(created_at: parse_date(date).all_day)
      .count
      .sort
  }

  scope :filter_by_hour, lambda { |date|
    Metric
      .group("DATE_PART('minute', created_at)")
      .where(created_at: parse_date(date).all_day)
      .count
      .sort
  }

  scope :filter_by_week, lambda { |date|
    Metric
      .group("created_at::date")
      .where(created_at: parse_date(date).all_week)
      .order("created_at::date")
      .count
      .to_a
  }

  def self.parse_date(date)
    date.to_time.utc
  end
end
