module AgentsHelper
  def current_agent?(agent)
    agent.id == current_agent.id
  end

  def me_tag(agent)
    content_tag(:span, 'Vous', class: 'badge badge-info') if current_agent?(agent)
  end

  def admin_tag(agent)
    content_tag(:span, 'Admin', class: 'badge badge-danger') if agent.admin?
  end

  def delete_dropdown_link(agent)
    link_to 'Supprimer', agent_path(agent), data: { confirm: "Êtes-vous sûr de vouloir supprimer cet utilisateur ?" }, method: :delete, class: 'dropdown-item' if policy(agent).destroy?
  end
end