# config/initializers/show_exceptions.rb
#modifying render_exception method from Class ShowExceptions. rails/actionpack/lib/action_dispatch/middleware/show_exceptions.rb
require 'action_dispatch/middleware/show_exceptions'

# Modifying how exceptions are handled by middleware, specifically ActionDispatch::ShowExceptions
module ActionDispatch
  class ShowExceptions
    private
    
    # Rails#env returns string with current rails environment (should be production)
    #exception is Exception object
      def render_exception_with_template(env, exception)
        #call action in ErrorsController as though being called from routing middleware
        body = ErrorsController.action(rescue_responses[exception.class.name]).call(env)
        #rescUe_responses is DEFAULT_RESCUE_RESONSE hash. This is defined in actionpack/lib/action_controller/rescue.rb 
        #exception.class.name is just string name of Class of Exception
        log_error(exception)
        body
        # If exception is thrown during call to ErrorsController, then use original method (which is aliased)
      rescue
        render_exception_without_template(env, exception)
      end
      
      alias_method_chain :render_exception, :template    # Used to change behavior of :render_exception from the original ActionDispatch::ShowExceptions class
      #Equivalent to alias_method :render_exception_without_template, :render_exception; alias_method :render_exception, :render_exception_with_template
  end
end

