class PermissionService
  def self.allow?(current_user, controller, action)
    return true if controller === 'sessions' && action === 'new'
  end
end
