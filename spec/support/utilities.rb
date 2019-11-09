def log_in(user)
  visit new_session_path
  fill_in "session_email",with: user.email
  fill_in "session_password",with: user.password
  click_button 'commit'
end
