# add config/initializers/preload_sti_models.rb:

if Rails.env.development?
  %w[lookup lookup_solution_type].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end