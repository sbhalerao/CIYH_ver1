# lib/store_redirect_to.rb

class StoreRedirectTo
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    path = request.path
    signin = path.match(%r(^/auth/[^/]+$)) && path != '/auth/failure'
    # signout = path == '/users/signout'
    if signin 
     #  redirect = request.params['redirect_to'] || request.referer
      redirect = request.params['redirect_to'] 
      request.session['redirect_to'] = redirect if redirect
    end

    @app.call(env)
  end
end