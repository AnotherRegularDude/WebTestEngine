Rails.application.config.active_job.queue_adapter = :test
FFaker::Random.seed = Random.new_seed
FFaker::Random.reset!

Rails.logger.info('Creating 100 new users...')
100.times do
  form = RegistrationForm.new(
    username: FFaker::Internet.unique.user_name,
    email: FFaker::Internet.unique.email,
    password: :password,
    first_name: FFaker::NameRU.first_name,
    last_name: FFaker::NameRU.last_name,
    patronymic: FFaker::NameRU.patronymic
  )
  form.save

  form.user.update_columns(activated: FFaker::Boolean.maybe, email_confirmation: nil)
end

User.order('random()').first(10).each { |user| user.update_column(:role, :teacher) }
Rails.logger.info('Finished.')
