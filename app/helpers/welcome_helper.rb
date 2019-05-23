module WelcomeHelper
  def root_path?
    root_path == request.path
  end

  def sign_up_pro_button
    link_to 'Je m\'inscris', new_pro_registration_path , class: 'btn btn-primary'
  end

  def sign_in_pro_button
    link_to 'Se connecter', new_pro_session_path , class: 'btn btn-outline-primary'
  end

  def link_logo
    link_to root_path do
      holder_tag '200x50', 'Lapin Logo', class: 'img-fluid'
    end
  end
end
