# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:cc_number, :cc_month, :cc_year, :cc_cvv]