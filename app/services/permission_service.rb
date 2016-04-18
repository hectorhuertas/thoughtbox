class PermissionService
  def self.allow?(current_user, controller, action)
    return true if current_user
    return true if controller === 'sessions' && action === 'new'
    return true if controller === 'users'    && (action === 'new' || action === 'create')
  end
end
