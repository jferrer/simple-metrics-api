# frozen_string_literal: true

valid_names = %i[features cost support]

Date.today.all_week.each do |day|
  1440.times do |minutes|
    next unless [true, false].sample

    Metric.create!(
      name: valid_names.sample,
      value: rand(1..5),
      created_at: day.to_time.utc.advance(minutes: minutes)
    )
  end
end
